class Trip < ActiveRecord::Base
  validates :review, presence: true
  validates :visit_date, presence: true
  validates :user_id, presence: true
  validates :park_id, presence: true
  belongs_to :user
  belongs_to :park
end
