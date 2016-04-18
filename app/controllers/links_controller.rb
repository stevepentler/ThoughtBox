class LinksController < ApplicationController
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

  def update
    @link = Link.find(params[:id])
    if link.update(link_params)
      flash[:notice] = "Updated!"
      redirect_to links_path
    else
      flash[:error] = "Invalid Link! Try Again!"
      redirect_to links_path
    end
  end


  private

  def link_params
    params.require(:link).permit(:title, :url, :viewed)
  end
end