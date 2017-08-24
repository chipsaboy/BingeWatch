class Tag < ApplicationRecord
	has_many :show_tags
	has_many :shows, through: :show_tags
end
