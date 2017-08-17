class Student < ActiveRecord::Base
  has_many :pairs
  has_many :applicants, through: :pairs
  validates :name, presence: true

end

