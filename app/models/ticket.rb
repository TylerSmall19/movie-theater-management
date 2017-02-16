class Ticket < ActiveRecord::Base
  belongs_to :showtime
  belongs_to :order

  validates :price, :order, presence: true
end
