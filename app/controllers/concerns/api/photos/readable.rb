module Api
    module Photos
         module Readable
            include ActiveSupport::Concern
            include Rails.application.routes.url_helpers
            
            private 
              def get_time_lines
                 photos =  @current_user.photos.page(params[:page]).per(params[:limit])
                 if photos.blank?
                    request_not_found
                 else
                  request_success_with_content get_response(photos, page, limit)
                 end
              end

              def get_response(photos, page, limit)
                options = {each_serializer: PhotoSerializer, serialization_context: ActiveModelSerializers::SerializationContext.new(request)}
                result  = ActiveModelSerializers::SerializableResource.new(photos,  options).as_json
                {records: result[:data], links: result[:links]}
               end 
         end 
    end 
end