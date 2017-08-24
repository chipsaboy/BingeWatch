class TagsController < ApplicationController

	def show
		@tag = Category.find(params[:id])
	end

end
