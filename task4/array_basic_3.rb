numbers = [3, 5, -4, 8, 11, 1, -1, 6]
target_sum = 10


def task4(numbers, target_sum)
    hsh = Hash.new
    numbers.each do |value|
        other_value = target_sum - value
        return [other_value,value] if(hsh[value])
        hsh[other_value] = 1
    end
    []
end


p task4(numbers, target_sum)