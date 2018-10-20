class User < ApplicationRecord
  has_one :address, dependent: :destroy
  validates :email, presence: true, format: {with: /^\S+@\S+\.\S+$/, multiline: true}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        nickname:     auth.extra.raw_info.name,
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end


  has_many :items, dependent: :destroy
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"

  has_one :customer

  validates :email,
            presence: true,
            format: { with: /^\S+@\S+\.\S+$/ , multiline: true }
end
