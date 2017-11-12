require 'rails_helper'

describe Donor do
  let(:donor) { Donor.new }

  describe "validations" do
    it "is valid when an donor has a first name" do
      donor.first_name = "Bob"
      donor.valid?
      expect(donor.errors[:first_name]).to be_empty
    end
  end
end
