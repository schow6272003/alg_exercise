module Api
    module Actionable
        extend ActiveSupport::Concern

        included do
         before_action :authenticate_user
        end 
        
        private
          def authenticate_user
            @current_user = User.find_by_id(params[:user_id])
            if @current_user.blank? 
                rquest_unauthorized
            end 
          end 

    end 
 end