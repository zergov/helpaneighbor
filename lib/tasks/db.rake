namespace :db do
  desc "Check if database exists"
  task exists: :environment do
    begin
      Rake::Task['environment'].invoke
      ActiveRecord::Base.connection
    rescue
      puts "database does not exists."
      exit 1
    else
      puts "database exists."
      exit 0
    end
  end
end
