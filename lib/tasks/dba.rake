namespace :dba do
  
  task "default_admin" => :environment do 
    admin = Admin.create!(:nick_name => "goshan")
    puts "finished create a new admin #{admin.id}"
  end
  
end
