module Api
    module V1
        class FavoritesController < Api::BaseController
            include Api::Actionable
            include Api::Favorites::Creatable
            include Api::Favorites::Deletable
            
            def create
              begin
                favorite_photo
              rescue => exception 
                p exception.inspect
                unprocessable_entity exception.inspect
              end 
            end 

            def destroy
              begin
                unfavorite_photo
              rescue => exception 
                p exception.inspect
                internal_server_error exception.inspect
              end 
            end 
        end
    end
end