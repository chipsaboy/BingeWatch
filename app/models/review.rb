class Review < ApplicationRecord
	belongs_to :show
	belongs_to :user
	validates :comment, presence: true
end
