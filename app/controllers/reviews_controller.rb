class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update, :destroy]
	before_action :find_show, except: [:index, :show]
	before_action :authenticate_user!

	def index
		if !params[:user_id]
			@reviews = Review.all.order("created_at DESC")
		else
			@reviews = Review.all.where("user_id = ?", params[:user_id])
		end
	end

	def new
		@review = Review.new
	end

	def create
		@review = @show.reviews.build(review_params)
		@review.user = current_user
		if @review.save
			render @review, notice: "Review published"
		else
			render :new, notice: @review.errors.full_messages
		end
	end

	def show
		@review = Review.find(params[:id])
	end

	def update
		@review.update(review_params)
	end

	def destroy
		@review.destroy
		redirect_to shows_path
	end


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
