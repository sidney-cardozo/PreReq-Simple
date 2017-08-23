class Job < ActiveRecord::Base
  include PgSearch
  belongs_to :employer
  validates :position, presence: true
  validates :description, presence: true
  validates :employer_id, presence: true
  validates :requirements, presence: true
  validates :job_type, presence: true
  validates :apply_info, presence: true
  pg_search_scope :search,
                  :against => {
                    :description => 'A',
                    :position => 'B'
                    },
                  :using => {
                    :tsearch => {:dictionary => "english"}
                  }

  # def self.search(query)
  #   if query
  #    words = query.to_s.strip.split
  #    words.inject(scoped) do |combined_scope, word|
  #     combined_scope.where('description ILIKE :search or position ILIKE :search', search: "%#{query}%")
  #   end
  #   else
  #     all.order('updated_at DESC')
  #   end
  # end
end


# words = query.to_s.strip.split
#     words.inject(scoped) do |combined_scope, word|
#       combined_scope.where("quote LIKE ?", "%#{word}%")
#     end

# where('description ILIKE :search or position ILIKE :search', search: "%#{query}%").order('updated_at DESC')