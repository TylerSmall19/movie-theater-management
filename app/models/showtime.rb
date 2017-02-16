class Showtime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :screen
  has_many :tickets
  has_many :orders

  validates :time, :movie, :screen, presence: true

  def pretty_time
    time.getlocal.strftime("%I:%M %p")
  end
end
