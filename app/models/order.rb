class Order < ActiveRecord::Base
  belongs_to :showtime
  has_many :tickets

  validates :email,
            :name,
            :credit_card,
            :expiration,
            :showtime,
            { presence: true }

  def last_four_of_card
    credit_card[-4..-1]
  end

  def total
    tickets.sum(:price)
  end
end
