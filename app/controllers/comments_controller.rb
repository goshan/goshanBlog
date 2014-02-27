class CommentsController < ApplicationController

	def create
		visitor = Visitor.find_by_ip(request.remote_ip)
		if params[:name] && !params[:name].empty?
			visitor.update_attributes!(:name => params[:name])
		end
		@comment = Comment.create!(:visitor_id => visitor.id, :content => params[:content], :blog_id => params[:blog_id])
	end

end
