class Theater < ActiveRecord::Base
	has_many :screens
	validates :address, presence: true
end
