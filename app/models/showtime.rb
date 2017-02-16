class Showtime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :screen
  has_many :tickets

  validates :time, :movie, :screen, presence: true

  def pretty_time
    time.strftime("%I:%M %p")
  end
end
