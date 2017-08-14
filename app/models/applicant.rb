class Applicant < ActiveRecord::Base
  belongs_to :user
  has_many :pairs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
end


