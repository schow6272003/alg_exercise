module Api
   module Requestable
     include ActiveSupport::Concern

        private 
         def user_params
              params.require(:user).permit(:first_name, :last_name, :email)
         end 
         
         def photo_params
            params.require(:photo).permit(:user_id, :name, :url)
         end 

         def favorite_params
            params.require(:favorite).permit(:user_id, :photo_id)
         end 

         def follow_params
            params.require(:connection).permit(:follower_id, :followee_id)
         end 
   end 
end