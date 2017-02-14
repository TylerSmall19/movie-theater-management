require 'rails_helper'

describe Theater do
	describe "associations" do		
		let(:t) { Theater.create(address: Faker::Address.street_address) }

		it "can have many screens" do
			4.times { t.screens << Screen.new }
			expect(t.screens.length).to be 4
		end
	end
end