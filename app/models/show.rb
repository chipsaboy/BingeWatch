class Show < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true, uniqueness: true

  def reviews_attributes=(reviews_attributes)
    reviews_attributes.each do |i, reviews_attributes|
      self.reviews.build(reviews_attributes)
    end
  end

  def self.find_info_with_tmdb(name)
    q = Tmdb::TV.find(name)
    if !q.empty?
      id = q[0].id
      detail = Tmdb::TV.detail(id)
      show = {
        name: detail["name"],
        overview: detail["overview"],
        poster: detail["poster_path"],
        rating: detail["vote_average"],
        backdrop: detail["backdrop_path"],
        }
      return show
    else
      return nil
    end
  end

end