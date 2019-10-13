class Photo < ApplicationRecord
   belongs_to :user
   has_many :favorites
   validates :name, presence: true
   validates :url, presence: true
end
