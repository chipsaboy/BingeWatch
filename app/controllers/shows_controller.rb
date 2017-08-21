class ShowsController < ApplicationController
  before_action :find_show, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @shows = Show.all.order("name DESC")
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.find_with_tmdb(params[:search])
  end

  def show
    @reviews = Review.where(show_id: @show.id)
  end

  private

  def find_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(
    	:name,
    	:overview,
    	:poster,
    	:rating,
    	:num_episodes,
    	:num_seasons,
    	:cast,
    	:created,
    	:network,
    	:genres,
    	:backdrop,
    	reviews_attributes: [:comment]
    	)
  end
end
