module Api
    module Favorites
        module Deletable
            include ActiveSupport::Concern
            
            private
              def unfavorite_photo
                 favorite = @current_user.favorites.find_by_id(params[:id])
                 if !favorite.blank?
                    favorite.destroy
                    request_success_no_content
                 else
                    request_not_found
                 end 
              end 
        end 
    end 
end 