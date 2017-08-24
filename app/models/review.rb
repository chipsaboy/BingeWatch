class Review < ApplicationRecord
	belongs_to :show
	belongs_to :user
	accepts_nested_attributes_for :user
	validates :show_id, uniqueness: { scope: :user_id, message: "You've reviewed this show!" }
end
