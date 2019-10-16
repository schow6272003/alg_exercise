module Api 
    module V1
        class CsvsController < Api::BaseController
            require "csv_lib"
            
            def index
                request_success_with_content CsvTool.get
            end 
        end
    end
end
