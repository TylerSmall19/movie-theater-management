class Showtime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :screen
  has_many :orders
  has_many :tickets, through: :orders

  validates :time, :movie, :screen, :price, presence: true
  validates :price, numericality: true

  def pretty_time
    time.getlocal.strftime("%I:%M %p")
  end

  def tickets_left
    screen.capacity - orders.length
  end
end
