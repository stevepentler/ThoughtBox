class Api::V1::LinksController < ApplicationController
  respond_to :json
  def index
    respond_with current_user.links
  end

  def update
    link = Link.find(params[:id])
    link.update(idea_params)
    respond_with @link, json: link
  end

  private

  def idea_params
    params.require(:link).permit(:title, :url, :viewed)
  end
end