class Order < ActiveRecord::Base
  belongs_to :showtime
  has_many :tickets

  validates :email,
            :name,
            :credit_card,
            :expiration,
            :showtime,
            { presence: true }

  validate :tickets_are_available

  def last_four_of_card
    credit_card[-4..-1]
  end

  def total
    showtime.price
  end

  private
  def tickets_are_available
    errors.add :tickets, "are sold out for this showtime." unless showtime.tickets_left > 0
  end
end
