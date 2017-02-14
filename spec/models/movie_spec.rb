require 'rails_helper'

describe Movie do

  let(:title){ Faker::Book.title }
  let(:description){ Faker::Lorem.paragraph(4) }
  let(:m){ build(:movie, title: title, description: description) }

  describe "Attributes" do
    it "has readable title" do
      expect(m.title).to eq title
    end

    it "has readable description" do
      expect(m.description).to eq description
    end
  end
end
