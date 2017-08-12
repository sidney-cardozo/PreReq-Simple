class Product < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
