class Employer < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  validates :description, presence: true
  validates :user_id, presence: true

  mount_uploader :image, ProfileImageUploader

end
