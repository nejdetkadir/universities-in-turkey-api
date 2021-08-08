namespace :import do
  desc 'Imports faculty_departments from db/static_data'
  task faculty_departments: :environment do
    file = YAML.load_file(Rails.root.join('db', 'static_data', 'faculty_departments.yml'))
    progress_bar = ProgressBar.create(:title => "Faculty departments", :starting_at => 0, :total => file.count)

    file.each do |fd|
      Faculty.all.each do |c|
        if c.name.eql?(fd['faculty'])
          Department.create(owner_id: c.id, owner_type: "Faculty",
            name: fd['name'], years: fd['years'], point_type: fd['point_type'],
            quota: fd['quota'], quota_of_top_student_of_the_school: fd['quota_of_top_student_of_the_school'],
            special_conditions: fd['special_conditions'], order_of_success_of_last_year: fd['order_of_success_of_last_year'],
            base_score_of_last_year: fd['base_score_of_last_year']
          )
        end
      end
      progress_bar&.increment
    end
  end
end