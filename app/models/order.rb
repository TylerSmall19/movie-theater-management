class Order < ActiveRecord::Base
  belongs_to :showtime

  validates :email,
            :name,
            :credit_card,
            :expiration,
            :showtime,
            { presence: true }
end
