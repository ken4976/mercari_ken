class Address < ApplicationRecord
  belongs_to :user
  validates :postal_code, presence: true, format: { with: /^\d{3}[-]\d{4}$/ , multiline: true }
  validates :area, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true

end
