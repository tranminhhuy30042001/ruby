
begin #check input n
    print 'Nhap n(n <= 99): '
    arr_size = Integer(gets.chomp,10)
    raise if (arr_size > 99 || arr_size < 0)
rescue
    puts 'n phai <= 99'
    retry
end
  
arr = Array.new(arr_size) { rand(1...9) }

p arr

sub_arr = []
arr.each_with_index do |element, index|
    sub_arr.push(element)
    next if(arr[index+1] != nil && element < arr[index+1])
    puts "mảng con tăng #{index}:#{sub_arr}" 
    sub_arr = []
end