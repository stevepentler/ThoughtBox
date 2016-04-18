class Api::V1::LinksController < ApplicationController
  respond_to :json
  def index
    respond_with current_user.links
  end

  def update
    @link = Link.find(params[:id])
    respond_with @link.update(idea_params)
  end

  private

  def idea_params
    params.require(:link).permit(:title, :url, :viewed)
  end
end