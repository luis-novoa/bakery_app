class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 2, maximum: 20}
  validates :password, presence: true, length: {minimum: 6, maximum: 20}
  validates :admin, presence: true
end
