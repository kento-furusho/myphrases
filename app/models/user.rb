class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  before_save { self.email.downcase! }
  has_secure_password
  
  validates :name, presence:true, length: { maximum: 30 }
  validates :email, presence:true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  has_many :phrases
end
