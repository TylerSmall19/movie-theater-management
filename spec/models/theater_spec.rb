require 'rails_helper'

describe Theater do
  let(:address) { Faker::Address.street_address }
  let(:name){ Faker::Company.name }
	let(:t) { build(:theater, address: address, name: name) }

  describe "Attributes" do
    it "has a readable name" do
      expect(t.name).to eq name
    end

    it "has a address name" do
      expect(t.address).to eq address
    end
  end
end
