require 'rails_helper'

describe Category do
  let(:category) { Category.create!(category_name: "Healthcare") }

  describe "validations" do
    it { should have_many(:organizations) }

    it { should have_many(:projects).through(:organizations)}
  end

  describe "validations" do
    it { should validate_presence_of(:category_name) }
  end

end