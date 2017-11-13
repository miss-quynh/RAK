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
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates :organization_name, :tax_code, :email, :category, presence: true
  validates :email, :organization_name, uniqueness: true



end