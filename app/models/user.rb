class User < ApplicationRecord
    has_many :photos, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :follower_follows, foreign_key: :followee_id, :class_name => "Connection"  
    has_many :followers, through: :follower_follows, source: :follower, dependent: :destroy
    has_many :followee_follows, foreign_key: :follower_id, :class_name => "Connection"  
    has_many :followees, through: :followee_follows, source: :followee, dependent: :destroy

    validates  :email, presence: true
    validates  :first_name, presence: true
    validates  :last_name, presence: true
end
