namespace :import do
  desc 'Imports faculties from db/static_data'
  task faculties: :environment do
    file = YAML.load_file(Rails.root.join('db', 'static_data', 'faculties.yml'))
    progress_bar = ProgressBar.create(:title => "Faculties", :starting_at => 0, :total => file.count)

    file.each do |faculty|
      university = University.find_by(name: faculty['university'])
      Faculty.create(university: university, name: faculty['name'])
      progress_bar&.increment
    end
  end
end