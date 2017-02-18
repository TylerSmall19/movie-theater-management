class Order < ActiveRecord::Base
  belongs_to :showtime
  has_many :tickets

  validates :email,
            :name,
            :credit_card,
            :expiration,
            :showtime,
            { presence: true }

  validates :credit_card, credit_card_number: true

  validate :tickets_available?

  def last_four_of_card
    credit_card[-4..-1]
  end

  def total
    showtime.price
  end

  private

  def tickets_available?
    # Safe guard against errors when no showtime is set
    errors.add :tickets, "are sold out for this showtime." unless showtime && showtime.tickets_left >= 0
  end
end
