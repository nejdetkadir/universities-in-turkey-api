namespace :import do
  desc 'Imports colleges from db/static_data'
  task colleges: :environment do
    file = YAML.load_file(Rails.root.join('db', 'static_data', 'colleges.yml'))
    progress_bar = ProgressBar.create(:title => "Colleges", :starting_at => 0, :total => file.count)

    file.each do |college|
      university = University.find_by(name: college['university'])
      College.create(university: university, name: college['name'])
      progress_bar&.increment
    end
  end
end