class Movie < ActiveRecord::Base
  has_many :showtimes, dependent: :destroy
  validates :title, :description, presence: true

  def self.all_with_showtimes
    Movie.all.select { |movie| movie.showtimes.any? }
  end
end
