class Movie < ActiveRecord::Base
  has_many :showtimes
  validates :title, :description, presence: true
end
