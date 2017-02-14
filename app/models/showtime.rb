class Showtime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :screen
end
