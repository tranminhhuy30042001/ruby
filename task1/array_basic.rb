MAX_LENGTH = 99
EXIT_INPUT = -1
arr = Array.new

def get_integer_num(label)
    output = 1
    begin
        print "#{label}"
        output = Integer(gets.chomp)
        raise if (output < -1) 
    rescue
       puts 'vui long nhap kieu du lieu so nguyen'
       retry
    end
    return output
end

puts 'nhap -1 de thoat'
(1..MAX_LENGTH).each do |i|
    input = get_integer_num("arr[#{i}]: ")
    break if(input == EXIT_INPUT)
    arr.push(input)
end
arr.each{ |value| print "#{value} " }
puts "\nso nho nhat trong mang la: #{arr.min}"