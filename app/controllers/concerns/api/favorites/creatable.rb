module Api
    module Favorites
         module Creatable
            include ActiveSupport::Concern
            
            private 
              def favorite_photo
                 favorite = @current_user.favorites.build(favorite_params)
                 if favorite.save!
                    request_created
                 end
              end
         end 
    end 
end