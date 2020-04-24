class Park < ActiveRecord::Base
  validates :name, presence: true
  validates :link, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :information, presence: true
  validates :weather, presence: true
  validates :tours_and_camping, presence: true
  validates :wildlife, presence: true
  validates :nearby_parks, presence: true
  validates :image, presence: true
  has_many :trips
  has_many :users, through: :trips
end
