class ComicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def show
    @comic = Comic.includes(:pages).find(params[:id])
    @comics = Comic.all.includes(:pages)

    render 'index'
  end

  def index
    @comics = Comic.all.includes(:pages)
  end

  def new
    @comic = Comic.new(user: current_user)
    authorize @comic
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:id])
    @comic.update_attributes(protected_params)

    authorize @comic

    if @comic.save
      redirect_to @comic
    else
      render 'edit'
    end
  end

  def create
    @comic = Comic.new(protected_params)
    authorize @comic

    if @comic.save
      redirect_to @comic
    else
      render 'new'
    end
  end

  protected

  def protected_params
    params
      .require(:comic)
      .permit(:user_id, :title, :description, :pages_order, page_ids: [])
      .merge(pages_order: JSON.parse(params[:comic][:pages_order]))
  end
end
