class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..20
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 2, maximum: 20}
  validates :admin, inclusion: { in: ['super', "admin", 'user', nil] }
end
