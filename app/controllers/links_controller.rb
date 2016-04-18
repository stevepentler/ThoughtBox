class LinksController < ApplicationController
  before_action :authorize
  def index
    @links = current_user.links ||= []
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:notice] = "Splendid Addition!"
      redirect_to links_path
    else
      flash[:error] = "Invalid link, Try Again!"
      redirect_to links_path
    end
  end

  def edit
    binding.pry
    @link = Link.find(params[:id])
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :viewed)
  end
end