require 'active_record'
require 'activerecord-import'
require "csv"
require_relative './helpers'

CSV_NAME = "user_data.csv"

#WARRING DONT CHANGE CHUNK_SIZE my code just handle only 2 threads
CHUNK_SIZE = "7M"

ActiveRecord::Base.establish_connection(
    adapter:  "postgresql",
    host:     "localhost",
    username: "postgres",
    database: "postgres"
  )
class User < ActiveRecord::Base
end

#split file to multi file
system("split -C " + CHUNK_SIZE + " -d " + CSV_NAME + " 'output'")


def run_with_multi_process(csv_name)
    columns = [:name, :email,:phone,:address,:date,:profile]

    # Can test 3 or more process but my computer must strong
    # The more threads more faster
    num_process = 2

   

    #because the file generated is 10 and we used 2 thread so need 5 loop time to do all file
    5.times do |i|
      threads = (1..num_process).map do |tx|
        Thread.new(tx) do
          csv = CSV.new(File.read(csv_name+ "0" + ((i*2)+tx-1).to_s), headers: false)
          items = csv.map {|row| row.to_a }
          User.import(columns,items,validate: false)
        end
      end
      threads.each {|t| t.join}
    end
end

begin
   print_time_spent do
      run_with_multi_process("output")
   end
rescue Exception => e
    puts 'khong the doc file'
    puts e.message
end

#delete temp file after read
10.times { |i| File.delete("output0"+i.to_s)}