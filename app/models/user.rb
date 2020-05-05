class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :trips
  has_many :parks, through: :trips
end
