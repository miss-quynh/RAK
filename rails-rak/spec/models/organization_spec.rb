require 'rails_helper'

describe Organization do

  let(:organization) { Organization.create!(organization_name: "Red Cross",
                                            tax_code: 94124,
                                            email: "rc@rc.com",
                                            url: "redcross.com",
                                            mission_statement: "hello",
                                            password: "password",
                                            category_id: category.id) }
  let(:event) { Event.create!(event_name: "NorCal Fires") }
  let(:following) {Following.create!(donor_id: donor.id, organization_id: organization.id)}
  let(:project) { Project.create!(project_name: "Northern California", street_address: "100 Main Street", city: "Napa", state: "CA", zip_code: 95448, description: "Fire", organization_id: organization.id, event_id: event_id) }
  let(:category) { Category.create!(category_name: "Healthcare") }
  let(:donor) { Donor.create!(first_name: "Bob", last_name: "Smith", email: "bob@bob.com", street_address: "100 Market Street", city: "Napa", state: "CA", zip_code: 95548, password: "password") }
  let(:donations) { Donation.create!(item_id: item.id, project_id: project.id, quantity_requested: 100, quantity_received: 50) }
  let(:items) { Item.create!(item_name: "water bottles", image: "case of Aquafina", donation_type_id: donation_type.id) }
  let(:donation_type) { Donation_type.create!(type_name: "Aquafina") }


  describe "associations" do
    it "has many followings" do
      expect(organization.followings).to match_array [following]
    end

    it "has many projects" do
      expect(organization.projects).to match_array [project]
    end

    it "belongs to category" do
      expect(organization.category).to eq category
    end

    it "has many donors" do
      expect(organization.donor).to match_array [donor]
    end

    it { should have_many(:donations).through(:projects)}

    # it "has many donations" do
    #   expect(organization.donations).to match_array [donations]
    # end

    it "has many events" do
      expect(organization.event).to match_array [events]
    end

    it "has many items" do
      expect(organization.items).to match_array [item]
    end

    # it { should have_many(:donation_types).through(:items)}

    end

  # describe "validations" do
  #   it "is valid when an organization has a name" do
  #     organization.organization_name = "Red Cross"
  #     organization.valid?
  #     expect(organization.errors[:organization]).to be_empty
  #   end

  #   it "is valid when an organization has a tax code number" do
  #     organization.tax_code = "14569"
  #     organization.valid?
  #     expect(organization.errors[:organization]).to be_empty
  #   end

  #   it "is valid when an organization has an email address" do
  #     organization.email = "redcross@help.com"
  #     organization.valid?
  #     expect(organization.errors[:organization]).to be_empty
  #   end

    # it "is valid when an organization has a category" do
    #   organization.category = "Healthcare"
    #   organization.valid?
    #   expect(organization.errors[:organization]).to be_empty
    # end
  # end

end
