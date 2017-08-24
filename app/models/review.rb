class Review < ApplicationRecord
	belongs_to :show
	belongs_to :user
	accepts_nested_attributes_for :user
end
