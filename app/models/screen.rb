class Screen < ActiveRecord::Base
  belongs_to :theater
  belongs_to :movie
  has_many :showtimes

  validates :number, :capacity, presence: true
end
