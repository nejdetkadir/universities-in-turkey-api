class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def set_default_role
    self.role ||= :user
  end
end
