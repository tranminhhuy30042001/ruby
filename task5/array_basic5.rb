a = [5, 1, 22, 26, 6, -1, 8, 10]
b = [1, 6, -1, 10]


def check(a,b)
    return false if(b.length > a.length)
    count = 0
    a.each do |value|
        count += 1 if (value == b[count])        
        return true if(count == b.length)
    end
end

p check(a,b)
