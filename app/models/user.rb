class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 0, admin: 1 }
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
<<<<<<< HEAD

  has_many :posts
=======
>>>>>>> 6017c66 (feat: users)
end
