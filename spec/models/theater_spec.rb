require 'rails_helper'

describe Theater do
  let(:address) { Faker::Address.street_address }
  let(:name){ Faker::Company.name }
	let(:theater) { build(:theater, address: address, name: name) }

  describe "Attributes" do
    it "has a readable name" do
      expect(theater.name).to eq name
    end

    it "has a readable address" do
      expect(theater.address).to eq address
    end
  end
end
