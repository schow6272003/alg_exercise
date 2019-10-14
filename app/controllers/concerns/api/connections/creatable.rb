module Api
    module Connections
         module Creatable
            include ActiveSupport::Concern
            
            private 
              def follow_user 
                relationship = @current_user.followee_follows.build(follow_params)
                 if relationship.save!
                    request_created
                 end
              end
         end 
    end 
end