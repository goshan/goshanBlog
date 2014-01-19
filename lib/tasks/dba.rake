namespace :dba do
  
  task "default_admin" => :environment do 
    admin = Admin.create!(:nick_name => "goshan")
    puts "finished create a new admin #{admin.id}"
  end
  
  task "update_blog_count" => :environment do 
    BlogType.all.each do |type|
      count = Blog.where(:blog_type_id => type.id).count
      type.update_attributes!(:blogs_count => count)
      puts "updated blog type: #{type.name}"
    end
  end
  
end
