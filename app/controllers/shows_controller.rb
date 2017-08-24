class ShowsController < ApplicationController
  before_action :find_show, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @shows = Show.all.order("name ASC")
    @shows = current_user.shows
  end

  def new
    @show = current_user.shows.build
    @show.reviews.build
  end

  def create
  	if Show.find_by(name: params[:name]).exists?
    	search = Show.find_with_tmdb(params[:name])
    	@show = current_user.shows.build(search)
    	if !@show.nil? && @show.save
      		redirect_to @show, notice: 'Show successfully added'
    	else
      		render :new, notice: "We couldn't find that show"
      	end
    else
      search = Show.find_with_tmdb(params[:name])
    	@show = current_user.shows.build(show_params)
    	if @show.save
    		redirect_to @show, notice: 'Show successfully added'
    	else
      		render :new
      	end
    end
  end

  def show
    @show = Show.find(params[:id])
  	@reviews = Review.where(show_id: @show.id)
  	if @show
  		@reviews = Review.where(show_id: @show.id)
  	else
  		redirect_to shows_url
  	end
  end

  def edit
  end

  def update
    if @show.update(show_params)
      render :show, notice: 'Show successfully updated'
    else
      render :edit, notice: @show.errors.full_messages
    end
  end

  def destroy
    @show.destroy
    redirect_to shows_url, notice: 'Show successfully deleted'
  end

  private

  def find_show
    @show = Show.find_by(id: params[:id])
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
      reviews_attributes: [:id, :rating, :content, :user_id,]
    )
  end
end
