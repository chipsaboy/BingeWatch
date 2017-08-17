class Show < ApplicationRecord
	ratyrate_rateable 'show', 'series'

	def show
		@show = Show.find_by(id: params[:id])
	end
end
