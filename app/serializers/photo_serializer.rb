class PhotoSerializer < ActiveModel::Serializer
    attributes :id, :name, :url
    belongs_to :user
    has_many :favorites
  end