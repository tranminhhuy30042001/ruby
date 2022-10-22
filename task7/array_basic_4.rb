=begin
Viết chương trình trong đó có hàm nhận input đầu vào là một mảng không rỗng và các phần tử trong mảng không trùng nhau (có thể bao gồm số âm), và một con số đại diện cho tổng (target_sum).
Nếu 3 số trong một mảng có tổng bằng với target_sum, in ra mảng với 3 số đó. Nếu không có in ra mảng rỗng
Lưu ý: chỉ sử dụng tối đa 2 vòng lặp for hoặc while lồng nhau, có thể sử dụng nhiều vòng for không lồng nhau. Cần in ra các mảng thỏa tiêu chí tìm thấy
Vd: input là mảng 
  numbers = [12, 3, 1, 2, -6, 5, -8, 6]
  target_sum = 0
=> output sẽ là [[-8, 2, 6], [-8, 3, 5], [-6, 1, 5]]"
=end
numbers = [12, 3, 1, 2, -6, 5, -8, 6]
target_sum = 0

#=========================SERVICE============================
## O(n) cach 1 dung de quy
def find_three_number_array_equal_target_sum_with_recusive(output, numbers, target_sum, i = 0, j = 1, k = 2)
  return if (i >= numbers.length - 2)
  if (numbers[i] + numbers[j] + numbers[k] == target_sum)
    output.push([numbers[i], numbers[j], numbers[k]])
  end
  if (j >= (numbers.length - 2))
    i += 1
    j = i + 1
    k = j
  end
  if (k > (numbers.length - 2))
    j += 1
    k = j
  end

  find_three_number_array_equal_target_sum_with_recusive(output, numbers, target_sum, i, j, k + 1)
end

## O(n) cach 2 khong dung de quy(1 dong while)
def find_three_number_array_equal_target_sum(output, numbers, target_sum)
  # i,j,k dai dien cho vi tri 3 so can tim
  i, j, k = 0, 1, 2
  begin
    if (numbers[i] + numbers[j] + numbers[k] == target_sum)
      output.push([numbers[i], numbers[j], numbers[k]])
    end
    if (j >= (numbers.length - 2))
      i += 1
      j = i + 1
      k = j
    end
    if (k > (numbers.length - 2))
      j += 1
      k = j
    end
    k += 1
  end while i < numbers.length - 2
end
#=========================END SERVICE=========================

#=========================FUNCTION==============================
def three_number_array_sum_equal_target(numbers, target_sum)
  raise TypeError, "array can it nhat 3 gia tri trong mang" if (numbers.size < 3)
  output = Array.new
  find_three_number_array_equal_target_sum(output, numbers, target_sum)
  #phuong an de quy:
  #find_three_number_array_equal_target_sum_with_recusive(output, numbers, target_sum)
  return output
end
#=========================END FUNCTION===========================

#===========================OUTPUT===========================
p three_number_array_sum_equal_target(numbers, target_sum)
#===========================END OUTPUT===========================
