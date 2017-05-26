class PagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @page = Page.new(params.require(:page).permit(:s3_file_url))
    @page.save!

    respond_to do |format|
      format.json { render json: { id: @page.id } }
    end
  end

end
