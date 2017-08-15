class Pair < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :student
  validates :applicants_id, presence: true
  validates :students_id, presence: true

end