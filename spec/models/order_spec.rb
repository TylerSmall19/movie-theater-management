describe Order do
  describe "Attributes" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :credit_card }
    it { is_expected.to validate_presence_of :expiration }
  end

  describe "#last_four_of_card" do
    it "Should display last four digits of CC" do
      order = build(:order)
      expect(order.last_four_of_card).to match order.credit_card[-4..-1]
      expect(order.last_four_of_card.length).to be 4
    end
  end

  describe "Associations" do
    it { is_expected.to belong_to :showtime }
    it { is_expected.to have_many :tickets }
  end
end
