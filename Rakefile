task :environment do
  require_relative "./lib/birthday_calendar"
end

desc "Generate config/precure.yml"
task :generate_precure_config => :environment do
  BirthdayCalendar.generate_precure_config
end

desc "Generate ical files"
task :generate_ical, [:config_name] => :environment do |_task, args|
  config_name = args[:config_name]

  if config_name
    BirthdayCalendar.generate_ical_file("#{__dir__}/docs", config_name)
  else
    BirthdayCalendar.generate_all_ical_files("#{__dir__}/docs")
  end
end

task :generate_all => %i[generate_precure_config generate_ical]

task :default => :generate_all
