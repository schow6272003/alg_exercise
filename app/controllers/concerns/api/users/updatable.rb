module Api
    module Users
        module Updatable
            include ActiveSupport::Concern
            
            private 
                def update_user
                    user = User.find_by_id(params[:id])
                    if !user.blank?
                      user.tap { |user| user.update(user_params)}
                      request_accepted
                    else 
                      request_not_found
                    end 
                end 
        end
    end 
end