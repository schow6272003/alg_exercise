class UserSerializer < ActiveModel::Serializer
  attributes :id,:first_name, :last_name, :connections
  has_many :photos
  def connections
    followers = object.followers.select(:id, :email, :first_name, :last_name)
    followees = object.followees.select(:id, :email, :first_name, :last_name)
    response =  { followers_count: followers.length,
                    followees_count: followees.length,
                    followers: followers,
                    followees: followees}
    return response 
  end 

end
