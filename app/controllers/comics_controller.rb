class ComicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def show
    @comic = Comic.find(params[:id])
    @comics = Comic.all

    render 'index'
  end

  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new(user: current_user)
  end

  def create
    @comic = Comic.new(params.require(:comic).permit(:user_id, :title, :description, page_ids: []))

    if @comic.save
      redirect_to @comic
    else
      render 'new'
    end
  end
end
