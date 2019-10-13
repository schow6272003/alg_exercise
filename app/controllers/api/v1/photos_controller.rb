module Api 
    module V1
        class PhotosController < Api::BaseController
            include Api::Actionable
            include Api::Photos::Creatable
            include Api::Photos::Deletable
            include Api::Photos::Readable

            def time_lines
              begin
                if (params[:page].to_i < 1) || (params[:limit].to_i < 1) || params[:page].blank? || params[:user_id].blank? ||  params[:limit].blank?
                  bad_request
                else  
                  get_time_lines
                end 
              rescue => exception 
                p exception.inspect
                internal_server_error exception.inspect
              end 
            end
            
            def create 
              begin
                create_photo
              rescue => exception 
                p exception.inspect
                unprocessable_entity exception.inspect
              end 
            end

            def destroy
              begin
                 delete_photo
              rescue => exception 
                 p exception.inspect
                 internal_server_error exception.inspect
              end 
            end 
        end
    end 
end