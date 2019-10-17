#AGL Coding Challenges
This repository contains code base for two coding exercises from AGL coding challenges:
- CSV read and parsing exericse.
- Selfiegram API is a simplified version of Instagram API to access to data, manage user account and connections.

##Set up and run the app

```
git clone https://github.com/schow6272003/alg_exercise.git
cd selfiegram
bundle install
rake db:migrate
rake db:seed
rails s
```

##CSV Challange
###Endpoint
```
http://localhost:3000/api/v1/csvs
```
###Solution:
```
/lib/csv_lib.rb  #CSV lib location on app
```
```ruby
response = Array.new
filename = File.join Rails.root, '/public/csv/', 'data.csv' 
text = File.read(filename).force_encoding('MacRoman').encod('UTF-8')
CSV.parse(text, headers: true, :col_sep => ", ") do |row|
  response << row.to_hash
end  
```
##Selfiegram API Challenge
###Photos Endpoints: 
#### Get User Photos Timeline
```
url: http://localhost:3000/api/v1/time_lines
method: Get
request params:
{ 
   user_id: 1,
   page: 1, 
   limit: 5
}
```
#### Upload Photo
```
url: http://localhost:3000/api/v1/photos
method: Post
request params:
{ 
   user_id: 1,
   photo: { name: "Lake Forest Trip", 
            url: "https://picsum.photos/200"
          }
}
```
#### Delete Photo
```
url: http://localhost:3000/api/v1/photos/:id
method: Delete
request params:
{ 
   user_id: 1,
   id: 12 (Photo Id)
}
```
###User Endpoints: 
#### Register User
```
url: http://localhost:3000/api/v1/users
method: Post
request params:
{ 
   user: { first_name: Kevin,
           last_name: Johnson,
           email: kj@gmail.com
	     } 
}
```
#### Update User
```
url: http://localhost:3000/api/v1/users/:id
method: Put
request params:
{ 
   id: 1 (user id),
   user: { first_name: Kevin,
           last_name: Johnson,
           email: kj@gmail.com
	     } 
}
```
#### Delete User
```
url: http://localhost:3000/api/v1/users/:id
method: Delete
request params:
{ 
   id: 1 (user id)
}
```
###Favorite Endpoints: 
#### Favorite a photo
```
url: http://localhost:3000/api/v1/favorites
method: Post
request params:
{ 
   user_id: 1,
   favorite: { 
              photo_id: 123
             }
}
```
#### Unfavorite a photo
```
url: http://localhost:3000/api/v1/favorites/:id
method: Delete
request params:
{ 
   id: 1
}
```
### User Connection Endpoints: 
#### Follow a user
```
url: http://localhost:3000/api/v1/connections
method: Post
request params:
{ 
   user_id: 1,
   connection: { follower_id: 1,
                 followee_id  5
               }
}
```
#### Unfollow a user
```
url: http://localhost:3000/api/v1/connections/unfollow
method: Delete
request params:
{ 
   user_id: 1,
   connection: { follower_id: 1,
                 followee_id: 5
               }
}
```
#### List all followers and followees of a user
```
url: http://localhost:3000/api/v1/connection_list
method: Get
request params:
{ 
   user_id: 1
}
```

