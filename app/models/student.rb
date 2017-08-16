class Student < ActiveRecord::Base
  has_many :applicants, through: :pairs
  validates :name, presence: true

end

