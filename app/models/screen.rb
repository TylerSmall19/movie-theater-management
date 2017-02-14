class Screen < ActiveRecord::Base
  belongs_to :theater
  belongs_to :movie

  has_many :showtimes
end
