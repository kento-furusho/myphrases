class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  before_save { self.email.downcase! }
  has_secure_password
  
  validates :name, presence:true, length: { maximum: 30 }
  validates :email, presence:true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  has_many :phrases
  has_many :relationships
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followings, through: :relationships, source: :follow
  has_many :followers, through: :reverses_of_relationship, source: :user
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :phrase
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_or_create_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def feed_phrases
    Phrase.where(user_id: self.following_ids + [self.id])
  end
  
  def like(phrase)
    self.favorites.find_or_create_by(phrase_id: phrase.id)
  end
  
  def unlike(phrase)
    favorite = self.favorites.find_by(phrase_id: phrase.id)
    favorite.destroy if favorite
  end
  
  def favoriting?(phrase)
    self.likes.include?(phrase)
  end
    
end
