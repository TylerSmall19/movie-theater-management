class Screen < ActiveRecord::Base
  belongs_to :theater
  belongs_to :movie
  has_many :showtimes, dependent: :destroy

  validates :number, :capacity, presence: true, numericality: true

  def description?
  	description && description != ""
  end
end
