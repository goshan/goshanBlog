class StatusesController < ApplicationController
  
  before_filter :auth
  
  layout "tools"
  
  def index
    page = params[:page] || 1
    @statuses = Status.order("created_at asc").paginate(:page => page, :per_page => 20)
  end
  
  def new
    @status = Status.new
  end
  
  def create
    Status.create!(params[:status])
    
    redirect_to root_path
  end
  
  def edit
    @status = Status.find_by_id(params[:id])
  end
  
  def update
    @status = Status.find_by_id(params[:id])
    @status.update_attributes!(params[:status])
    
    redirect_to root_path
  end
  
end
