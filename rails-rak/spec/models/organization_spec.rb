require 'rails_helper'

describe Organization do
  let(:organization) { Organization.new }

  describe "associations" do
    it "has many followings" do
      organization.followings.new
      expect(organization.followings).not_to be_empty
    end

    it "has many projects" do
      organization.projects.new
      expect(organization.followings).not_to be_empty
    end

    it "belongs to category" do
      organization.category.new
      expect(organization.category).not_to be nil
    end

    it "has many donors" do
      organization.donor.new
      expect(organization.donor).not_to be_empty
    end

    it "has many donations" do
      organization.donations.new
      expect(organization.donations).not_to be_empty
    end

    it "has many events" do
      organization.events.new
      expect(organization.events).not_to be_empty
    end

    it "has many items" do
      organization.items.new
      expect(organization.items).not_to be_empty
    end

    # it "has many donation types" do
    #   organization.donation_types.new
    #   expect(organization.donation_types).not_to be_empty
    # end

    it { should have_many(:donation_types).through(:items)}

    end

  describe "validations" do
    it "is valid when an organization has a name" do
      organization.organization_name = "Red Cross"
      organization.valid?
      expect(organization.errors[:organization]).to be_empty
    end

    it "is valid when an organization has a tax code number" do
      organization.tax_code = "14569"
      organization.valid?
      expect(organization.errors[:organization]).to be_empty
    end

    it "is valid when an organization has an email address" do
      organization.email = "redcross@help.com"
      organization.valid?
      expect(organization.errors[:organization]).to be_empty
    end

    it "is valid when an organization has a category" do
      organization.category = "Healthcare"
      organization.valid?
      expect(organization.errors[:organization]).to be_empty
    end
  end

end
