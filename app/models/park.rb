require 'Geocoder'
class Park < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
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
  geocoded_by :name
  after_validation :geocode
  after_save :geocode

  def self.search(search)
    if search
      @parks = self.find_by(name: search)
      if @parks
        self.where(name: @parks.name)
      else
        @parks = self.all
      end
    else
      @parks = self.all
    end
    @parks
  end

end
