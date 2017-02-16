class Ticket < ActiveRecord::Base
  belongs_to :showtime
  validates :price, :showtime, :name, :email, presence: true
end
