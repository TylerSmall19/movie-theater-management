class Ticket < ActiveRecord::Base
  belongs_to :showtime
  belongs_to :order

  validates :price, :showtime, :name, :email, :order, presence: true
end
