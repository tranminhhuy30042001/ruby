MAX_INPUT = 99
MIN_INPUT = 0
RANGE_RANDOM = 1..9

begin #check input n
    print "Nhap n(n <= #{MAX_INPUT}): "
    arr_size = Integer(gets.chomp,10)
    raise if (arr_size > MAX_INPUT || arr_size < MIN_INPUT)
rescue
    puts "n phai <= #{MAX_INPUT}"
    retry
end
  
arr = Array.new(arr_size) { rand(RANGE_RANDOM) }

p arr

sub_arr = []
arr.each_with_index do |element, index|
    sub_arr.push(element)
    next if(arr[index+1] && element < arr[index+1])
    puts "mảng con tăng #{index}:#{sub_arr}" 
    sub_arr = []
end