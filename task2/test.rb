require 'csv'
require_relative './helpers'

csv_name = File.join(Dir.pwd,'user_data.csv')

class Array
    def in_groups(num_groups)
        return [] if num_groups == 0
        slice_size = (self.size/Float(num_groups)).ceil
        groups = self.each_slice(slice_size).to_a
      end
end


puts -123