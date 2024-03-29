module Api
    module Photos
        module Deletable
            include ActiveSupport::Concern
            
            private
              def delete_photo
                 photo = @current_user.photos.find_by_id(params[:id])
                 if !photo.blank?
                    photo.destroy
                    request_success_no_content
                 else
                    request_not_found
                 end 
              end 
        end 
    end 
end 