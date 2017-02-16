class Order < ActiveRecord::Base
  belongs_to :showtime

  validates :email,
            :name,
            :credit_card,
            :expiration,
            :showtime,
            { presence: true }

  def date=(new_date)
    self.expiration = Time.new(new_date[:year], new_date[:month])
  end
end
