# time consume: 3.6s ~ 9s
require 'active_record'
require_relative './helpers'
CSV_NAME = "user_data.csv"
CHUNK_SIZE = '10M' # no more than 1M in each chunk


ActiveRecord::Base.establish_connection(
    adapter:  "postgresql",
    host:     "localhost",
    username: "postgres",
    database: "postgres"
  )
class User < ActiveRecord::Base
end

#fast to < 1M data
def import_data(path = CSV_NAME, read_header = true)
    File.open(path, 'r') do |file|
        file.gets if (read_header)
        User.connection.raw_connection.copy_data %{copy users from stdin with csv delimiter ',' quote '"'} do
            while line = file.gets do
                User.connection.raw_connection.put_copy_data line
            end
        end
    end
end

#safe for > 5M data
def import_big_data
    # split File to multiple file
    system("split -C #{CHUNK_SIZE} -d #{CSV_NAME} 'output_temp'")

    count = 0
    file_temp = ""
    loop do
        if (count < 10)
            file_temp = "output_temp0#{count}" 
        else
            file_temp = "output_temp#{count}" 
        end
        
        if(File.exist?(file_temp)) 
            if (count == 0)
                import_data(file_temp) 
            else
                import_data(file_temp,false)
            end
            File.delete(file_temp)
            count += 1
        else
            break
        end
    end
end


begin
    print_time_spent do
        import_data
    end
end

#can be delete commit =begin && =end to see how import_big_data do
=begin
    print_time_spent do
        import_big_data
    end
=end

