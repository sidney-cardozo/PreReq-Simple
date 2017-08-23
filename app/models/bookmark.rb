class Applicant < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :job
  validates :applicant_id, presence: true
  validates :job_id, presence: true
end