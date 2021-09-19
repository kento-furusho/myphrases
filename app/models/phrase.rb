class Phrase < ApplicationRecord
  belongs_to :user
  
  validates :singer, presence: true, length: { maximum: 30 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :lyric, presence: true, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 50 }
  
end
