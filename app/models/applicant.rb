class Applicant < ActiveRecord::Base
  belongs_to :user
  has_many :students, through: :pairs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  mount_uploader :image, ProfileImageUploader

  has_attached_file :image,
  default_url: "default.png"
end


