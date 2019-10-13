module Api 
    module V1
        class FollowsController < Api::BaseController
            include Api::Actionable
            include Api::Connections::Creatable
            include Api::Connections::Deletable
            
            def create
              begin
                 follow_user
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

