require 'rails_helper'

describe Movie do

  let(:title){ Faker::Book.title }
  let(:description){ Faker::Lorem.paragraph(4) }
  let(:m){ Movie.create!(title: title, description: description) }

  describe "Attributes" do
    it "has readable title and description" do
      expect(m.title).to eq title
      expect(m.description).to eq description
    end
  end
end
