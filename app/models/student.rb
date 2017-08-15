class Student < ActiveRecord::Base
  has_many :applicants, through: :pairs
  validates :name, presence: true
  validates :concentration, presence: true
  validates :industry, presence: true
  validates :resume, presence: true
end

