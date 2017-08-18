class Applicant < ActiveRecord::Base
  belongs_to :user
  has_many :pairs
  has_many :students, through: :pairs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true

  mount_uploader :image, ProfileImageUploader
end


