require 'rails_helper'

describe Ticket do
  describe "Associations" do
    it { is_expected.to belong_to :order }
  end

  describe "Attributes" do
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :order }
  end
end
