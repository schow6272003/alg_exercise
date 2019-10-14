module Api
    module Photos
         module Readable
            include ActiveSupport::Concern
            include Rails.application.routes.url_helpers
            
            private 
              def get_time_lines
                 page = params[:page]
                 limit = params[:limit]
                 offset =  (page.to_i - 1) * limit.to_i
               
                  photos = @current_user.photos.page(page).per(limit)
               #   photos =  @current_user.photos.limit(limit).offset(offset)
                 if photos.blank?
                    request_not_found
                 else
                  
                  response = photos
                  #   response = parse_paginating(photos, page, limit, @current_user.id)
                    request_success_with_content response 
                 end
              end

              def parse_paginating(records, page, limit, user_id)
                total_records = Photo.all.count
                divider, remainder = total_records.divmod(limit.to_i)
                total_pages =  divider + remainder
                next_page =  page.to_i + 1
                next_link = "#{request.base_url}#{api_v1_get_time_lines_path}?user_id=#{user_id}&page=#{next_page}&limit=#{limit}"
                {
                  records: records,
                  total_records: total_records,
                  paginating: { 
                      total_pages: total_pages,
                      next: next_link}
                }
              end 
         end 
    end 
end