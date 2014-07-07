def sum_digits(number)
  digit_sum = 0
  number_array = number.to_s.split(//)
  while number_array.empty? == false
    first_index_number = number_array.shift
    digit_sum += first_index_number.to_i
  end
    puts digit_sum

  if digit_sum > 9
    sum_digits(digit_sum)
  end
end

# sum_digits(412345)

def inject_sum_digits(number)
  num_to_string_array = number.to_s.split(//)
  number_array = num_to_string_array.map do |x| x.to_i end
  digit_sum = number_array.reduce(:+)
  puts digit_sum

  if digit_sum > 9
    inject_sum_digits(digit_sum)
  end
end

  # digit_sum = number.inject(0) do |sum, value|
  #   sum.to_s+value
  # end 
  # digit_sum = number_array.each{|x| x.to_i}
  # digit_sum.inject(:+)
inject_sum_digits(12345)
