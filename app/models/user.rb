class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false}
  validates :email, presence: true
  validates :password, length: { minimum: 4 }
  enum role: [ :applicant, :employer, :admin ]

  mount_uploader :image, ProfileImageUploader

  def self.authenticate_with_credentials(email, password)
    user = User.where('lower(email) = lower(?)', email.strip).first
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
