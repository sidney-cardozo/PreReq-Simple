class Pair < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :student
  validates :applicant_id, presence: true
  validates :student_id, presence: true
  validates :summary_story, presence: true

end