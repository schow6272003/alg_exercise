module Api
    module Connections
        module Deletable
            include ActiveSupport::Concern
            
            private
              def delete_relationship
                 connection = Connection.where(:follower_id => params[:follower_id] ,:followee_id => params[:followee_id])
                 if !connection.blank?
                    connection.destroy
                    request_success_no_content
                 else
                    request_not_found
                 end 
              end 
        end 
    end 
end 