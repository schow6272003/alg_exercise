class CsvTool
    require "csv"

    def self.get
        response = Array.new
        filename = File.join Rails.root, '/public/csv/', 'data.csv' 
        text = File.read(filename).force_encoding('MacRoman').encode('UTF-8')
            CSV.parse(text, headers: true, :col_sep => ", ") do |row|
            response << row.to_hash
        end  
        response
    end
end 