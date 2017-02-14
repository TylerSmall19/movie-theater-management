require 'rails_helper'

describe Theater do
  let(:address) { Faker::Address.street_address }
  let(:name){ Faker::Company.name }
	let(:t) { Theater.create!(address: address, name: name) }

  describe "attributes" do
    it "has a readable name and address" do
      expect(t.name).to eq name
      expect(t.address).to eq address
    end
  end
end
