class Job < ActiveRecord::Base
  belongs_to :employer
  validates :position, presence: true
  validates :description, presence: true
  validates :employer_id, presence: true
  validates :requirements, presence: true
  validates :job_type, presence: true
  validates :apply_info, presence: true

  def self.search(query)
    if query
      where('description LIKE ?', "%#{query}%").order('updated_at DESC')
    else
      all.order('updated_at DESC')
    end
  end
end


