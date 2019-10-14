module Api
    module Connections
        module Readable 
            include ActiveSupport::Concern 
            
            private 
              def get_connection_list 
                serialized_response = UserSerializer.new(@current_user).as_json 
                request_success_with_content( serialized_response[:connections])
              end 
        end
    end 
end