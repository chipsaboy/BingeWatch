class ShowsController < ApplicationController

	def index
		@shows = Show.all
	end

	def new
		@show = Show.new
	end

	def create
		@show = Show.find_with_tmdb(params[:search])
		@show
	end

	def show
		@show = Show.find_by(id: params[:id])
	end
end
