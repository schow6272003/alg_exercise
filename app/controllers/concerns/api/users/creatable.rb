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
         end 
    end 
end

