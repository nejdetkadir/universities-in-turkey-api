namespace :import do
  desc 'Runs all static data importing tasks'
  task all: %w[
    universities
    colleges
    faculties
    college_departments
    faculty_departments
  ]
end