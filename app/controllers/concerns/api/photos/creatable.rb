module Api
    module Photos
         module Creatable
            include ActiveSupport::Concern
            
            private 
              def create_photo
                 photo = @current_user.photos.build(photo_params)
                 if photo.save!
                    request_created
                 end
              end
         end 
    end 
end
