module Api
    module Users
        module Deletable
            include ActiveSupport::Concern
            
            private
              def delete_user
                 user = User.where(:id => params[:id])
                 if !user.blank?
                     user.destroy_all
                     request_success_no_content
                 else
                    request_not_found
                 end 
              end 
        end 
    end 
end 