namespace :import do
  desc 'Imports universities from db/static_data'
  task universities: :environment do
    file = YAML.load_file(Rails.root.join('db', 'static_data', 'universities.yml'))
    progress_bar = ProgressBar.create(:title => "Universities", :starting_at => 0, :total => file.count)

    file.each do |university|
      University.create(university)
      progress_bar&.increment
    end
  end
end