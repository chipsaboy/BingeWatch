class ShowsController < ApplicationController
	def show
		@show = Show.find_by(id: params[:id])
	end
end
