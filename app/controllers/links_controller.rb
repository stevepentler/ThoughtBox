class LinksController < ApplicationController
  before_action :authorize

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

  private

  def link_params
    params.require(:link).permit(:title, :url, :viewed)
  end
end