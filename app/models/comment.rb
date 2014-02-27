class Comment < ActiveRecord::Base
  attr_accessible :visitor_id, :content, :blog_id, :is_valid

  belongs_to :visitor

  belongs_to :blog

  def time_str
  	self.updated_at.strftime("%Y-%m-%d")
  end

end
