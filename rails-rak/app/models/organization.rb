class Organization < ApplicationRecord
  has_secure_password

  has_many :followings
  has_many :projects
  belongs_to :category
  has_many :donors, through: :followings
  has_many :donations, through: :projects
  has_many :events, through: :projects
  has_many :items, through: :donations
  has_many :donation_types, through: :items

  validates :organization_name, :tax_code, :email, :category, presence: true
  validates :email, :organization_name, uniqueness: true

  def closest_organizations(donor_zipcode)
    organizations_in_radius = []

    @organizations = Organization.all
    @organization_zipcodes = ZipcodeReturner.closest_zipcodes(organization_params[:donor_zipcode])

    @organizations.each do |org|
      @organization_zipcodes.each do |zip|
        if org.zip_code == zip
          organizations_in_radius << org
        end
      end 
    end
    organizations_in_radius
  end  

end