class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 2, maximum: 20}
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }
  validates :admin, presence: true, inclusion: { in: %w(super admin user) }
end
