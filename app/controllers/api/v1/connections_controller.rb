module Api 
    module V1
        class ConnectionsController < Api::BaseController
            include Api::Actionable
            include Api::Connections::Creatable
            include Api::Connections::Deletable
            include Api::Connections::Readable

            def connection_list 
              begin
                get_connection_list
              rescue => exception 
                p exception.inspect
                unprocessable_entity exception.inspect
              end 
            end 

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
end

