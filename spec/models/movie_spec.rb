require 'rails_helper'

describe Movie do
  describe "Attributes" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }

    it { is_expected.to have_many :tickets }
  end

  describe "Associations" do
    it { is_expected.to have_many :showtimes }
  end
end
