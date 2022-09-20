MAX_LENGTH = 99
MAX_VALUE = 99999999999999
arr = Array.new

def get_integer_num(label)
    num = 0
    begin
        loop do
            print "#{label}"
            num = Integer(gets.chomp)
            break if (num <= MAX_VALUE || num >= -MAX_VALUE)
        end
    rescue
       puts 'vui long nhap kieu du lieu interger'
       retry
    end
    return num
end

puts 'nhap -1 de thoat'
(1..MAX_LENGTH).each{|i|
    input = get_integer_num("arr[#{i}]: ")
    if(input == -1)
        break;
    else
        arr.push(input)
    end
}
arr.each{ |value| print "#{value} " }
puts "\nso nho nhat trong mang la: #{arr.min}"