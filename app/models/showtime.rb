class Showtime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :screen

  validates :time, :movie, :screen, presence: true
end
