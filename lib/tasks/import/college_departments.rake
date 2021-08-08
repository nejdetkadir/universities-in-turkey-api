namespace :import do
  desc 'Imports college_departments from db/static_data'
  task college_departments: :environment do
    file = YAML.load_file(Rails.root.join('db', 'static_data', 'college_departments.yml'))
    progress_bar = ProgressBar.create(:title => "College departments", :starting_at => 0, :total => file.count)

    file.each do |cd|
      College.all.each do |c|
        if c.name.eql?(cd['college'])
          Department.create(owner_id: c.id, owner_type: "College",
            name: cd['name'], years: cd['years'], point_type: cd['point_type'],
            quota: cd['quota'], quota_of_top_student_of_the_school: cd['quota_of_top_student_of_the_school'],
            special_conditions: cd['special_conditions'], order_of_success_of_last_year: cd['order_of_success_of_last_year'],
            base_score_of_last_year: cd['base_score_of_last_year']
          )
        end
      end
      progress_bar&.increment
    end
  end
end