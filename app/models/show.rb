class Show < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true, uniqueness: true

  def reviews_attributes=(reviews_attributes)
    reviews_attributes.each do |i, reviews_attributes|
      self.reviews.build(reviews_attributes)
    end
  end
end