class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :email, uniqueness: { case_sensitive: false}
  validates :email, presence: true
  validates :password, length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    user = User.where('lower(email) = lower(?)', email.strip).first
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
