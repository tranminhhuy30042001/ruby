require 'active_record'
require 'activerecord-import'
require "csv"
require_relative './helpers'

CSV_NAME = "user_data.csv"

ActiveRecord::Base.establish_connection(
    adapter:  "postgresql",
    host:     "localhost",
    username: "postgres",
    database: "postgres"
  )
class User < ActiveRecord::Base
end

print_time_spent do
    File.open(CSV_NAME, 'r') do |file|
        file.gets
        User.connection.raw_connection.copy_data %{copy users from stdin with csv delimiter ',' quote '"'} do
        while line = file.gets do
            User.connection.raw_connection.put_copy_data line
        end
    end
    end
end
