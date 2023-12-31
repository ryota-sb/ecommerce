class Customer < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :status
  end

  enum status: {
    normal: 0,
    withdrawn: 1,
    banned: 2
  }

  has_many :cart_items, dependent: :destroy
end
