#-*- encoding: utf-8 -*-

module BlogsHelper
  
  def types_option
    options = [["默认分类", 0]]
    BlogType.all.each do |type|
      options << [type.name, type.id]
    end
    options
  end
  
end
