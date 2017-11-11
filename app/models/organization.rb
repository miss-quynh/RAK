class Organization < ApplicationRecord
  has_many :followings
  has_many :projects
  belongs_to :category
  has_many :donors, through: :followings
  has_many :donations, through: :projects
  has_many :events, through: :projects
  has_many :items, through: :donations
  has_many :donation_types, through: :items

  validates :name, :tax_code, :email, :category, presence: true
  validates :email, :name, uniqueness: true

end