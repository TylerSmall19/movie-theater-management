require 'rails_helper'

describe Ticket do
  describe "Associations" do
    it { is_expected.to belong_to :order }
  end

  describe "Attributes" do
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :order }
  end

  describe "TODO" do
    pending "Add/Edit/Delete Screens"
    pending "Bootstrap/CSS"
    pending "Readme"
  end
end
