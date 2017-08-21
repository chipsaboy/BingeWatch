class Show < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true, uniqueness: true

  def reviews_attributes=(reviews_attributes)
    reviews_attributes.each do |i, reviews_attributes|
      self.reviews.build(review_attributes)
    end
  end

  def self.find_with_tmdb(search)
    q = Tmdb::TV.find(search)
    id = q[0].id
    detail = Tmdb::TV.detail(id)
    show = Show.new
    cast = Show.find_tmdb_cast(id)
    show.assign_attributes(
    	name: detail["name"],
    	overview: detail["overview"],
    	poster: detail["poster_path"],
    	rating: detail["vote_average"],
    	num_episodes: detail["number_of_episodes"],
    	num_seasons: detail["number_of_seasons"],
    	created: detail["first_air_date"],
    	network: detail["networks"][0]["name"],
    	backdrop: detail["backdrop_path"],
    	genres: detail["genres"][0]["name"],
    	cast: cast
    	)
    return show
  end

  def self.find_tmdb_cast(id)
  	q = Tmdb::TV.cast(id)
  	cast = []
  	q.collect do |c|
  		cast << c["name"]
  	end
  	cast.join(", ")
  end

  def show_attributes=(show_attributes)
  	show_attributes.each do |i, show_attributes|
      self.show.build(show_attributes)
    end
  end


end

# http://image.tmdb.org/t/p/w500/