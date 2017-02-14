require 'rails_helper'

describe Theater do
  let(:address) { Faker::Address.street_address }
  let(:name){ Faker::Company.name }
	let(:t) { Theater.create!(address: address, name: name) }

  describe "associations" do
		it "has many screens" do
			4.times { t.screens << Screen.new }
			expect(t.screens.length).to be 4
		end
	end

  describe "attributes" do
    it "has a readable name and address" do
      expect(t.name).to eq name
      expect(t.address).to eq address
    end
  end
end
