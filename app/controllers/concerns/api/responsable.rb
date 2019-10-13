module Api 
    module Responsable
        include ActiveSupport::Concern 
        
            def request_success
                render :json => { "status" => "success", "message" => "Ok"}, status: 200
            end 

            def request_success_with_content(data)
                render :json => { "status" => "success", "message" => "Ok", "data" => data}, status: 200
            end 
            def request_created 
                render :json => {"status" => "success", "message" => "Created"}, status: 201
            end 

            def request_accepted 
                render :json => { "status" => "success", "message" => "Accepted"}, status: 202
            end 

            def request_success_no_content
                render :json => { "status" => "success", "message" => "No Content"}, status: 204
            end 
    
            def bad_request
                render json: { "status" => "error", "message" => "Bad Request" }, status: 400
            end 

            def rquest_unauthorized
                render json: { "status" => "error", "message" => "Not Authorized" }, status: 401
            end 

            def request_not_found
                render :json => { "status" => "error", "message" => "Not Found"}, status: 404
            end 
        
            def unprocessable_entity(description)
                render json: { "status" => "error", "message" => "Unprocessable Entity", "description" => description }, status: 422
            end 

            def internal_server_error(description)
                render json: { "status" => "error", "message" => "Internal Server Error", "description" => description }, status: 500
            end

    end
end