class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update, :destroy]
	before_action :find_show, except: [:index, :show]
	before_action :authenticate_user!

	private

	def find_review
		@review = Review.find(params[:id])
	end

	def find_show
		@show = Show.find(params[:show_id])
	end

	def review_params
		params.require(:review).permit(:comment)
	end
end
