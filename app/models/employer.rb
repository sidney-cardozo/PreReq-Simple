class Employer < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  validates :description, presence: true
  validates :user_id, presence: true
  validates :icon_url, presence: true


end
