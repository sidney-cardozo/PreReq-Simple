class Student < ActiveRecord::Base
  validates :name, presence: true
  validates :concentration, presence: true
  validates :industry, presence: true
  validates :resume, presence: true
end

