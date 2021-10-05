class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :phrase
  
  has_many :reverses_of_favorites, class_name: 'Favorite', foreign_key: 'phrase_id'
  
end
