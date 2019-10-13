module Api
    module V1
        class UsersController < Api::BaseController
            include Api::Users::Creatable
            include Api::Users::Updatable
            include Api::Users::Deletable
            
            def create
              begin
                create_user
              rescue => exception 
                 p  exception.inspect
                 unprocessable_entity exception.inspect
              end 
            end

            def update
              begin
                update_user
              rescue => exception 
                 p  exception.inspect
                 unprocessable_entity exception.inspect
              end 
            end 

            def destroy
              begin
                delete_user
              rescue => exception 
                p  exception.inspect
                internal_server_error exception.inspect
              end 
            end 
        end
    end
end