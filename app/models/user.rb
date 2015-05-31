class User < ActiveRecord::Base

  has_secure_password	

  validates :email, :uniqueness => true, :allow_nil => false

  def send_password_reset
    generate_token(:password_reset_token)
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
