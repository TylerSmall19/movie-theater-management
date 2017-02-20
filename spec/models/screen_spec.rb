require 'rails_helper'

describe Screen do
  let(:screen){ build(:screen, movie: build(:movie)) }

  describe "Associations" do
    it { is_expected.to belong_to :theater }
    it { is_expected.to belong_to :movie }
    it { is_expected.to have_many :showtimes }
  end

  describe "Attributes" do

    it "has an optional description" do
      expect(screen.description).to be nil
      screen.description = "Desc"
      expect(screen.description).to eq "Desc"
    end

    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_presence_of :capacity }

    it { is_expected.to validate_numericality_of :number }
    it { is_expected.to validate_numericality_of :capacity }
  end
end
