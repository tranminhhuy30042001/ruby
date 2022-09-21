require_relative './helpers'
require 'csv'

csv_name = File.join(Dir.pwd,'user_data.csv')

begin
    print_memory_usage do
        print_time_spent do
            CSV.foreach(csv_name, headers: true) do |row| 
            end
        end
    end
rescue Exception => e
    puts 'khong the doc file'
    puts e.message
end