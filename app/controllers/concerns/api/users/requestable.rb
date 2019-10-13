module Api
    module Users
         module Requestable
            include ActiveSupport::Concern
            
            private 
              def user_params
                 params.require(:user).permit(:first_name, :last_name, :email)
              end 
         end 
    end 
end