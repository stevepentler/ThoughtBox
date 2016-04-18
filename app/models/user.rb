class User < ActiveRecord::Base
  has_many :links
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :title, presence: true
  validates :viewwed, presence: true
end
