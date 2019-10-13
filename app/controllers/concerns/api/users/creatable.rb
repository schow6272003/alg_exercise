module Api
    module Users
         module Creatable
            include ActiveSupport::Concern
            
            private 
              def create_user 
                 user = User.new(user_params)
                 if user.save!
                    request_created
                 end
              end
              def user_params
                 params.require(:user).permit(:first_name, :last_name, :email)
              end 
         end 
    end 
end

