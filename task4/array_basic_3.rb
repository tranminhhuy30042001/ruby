numbers = [3, 5, -4, 8, 11, 1, 7, 6]
target_sum = 10


def task4(numbers, target_sum)
    hsh = Hash.new
    numbers.each do |value|
        if(hsh[value])
            return [target_sum - value,value]
        else
            hsh[target_sum - value] = 1
        end
    end
    []
end


p task4(numbers, target_sum)