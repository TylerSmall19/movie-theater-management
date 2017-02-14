class Theater < ActiveRecord::Base
	has_many :screens
	validates :address, :name, presence: true
end
