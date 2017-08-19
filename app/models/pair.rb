class Pair < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :student
  validates :applicant_id, presence: true
  validates :student_id, presence: true
  validates :story, length: {maximum: 400}
end