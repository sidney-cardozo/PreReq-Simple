class Student < ActiveRecord::Base
  has_many :pairs
  has_many :applicants, through: :pairs
  validates :first_name, presence: true
  validates :last_name, presence: true
  mount_uploader :image, ProfileImageUploader
end

