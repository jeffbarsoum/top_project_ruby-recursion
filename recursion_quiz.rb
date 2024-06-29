def factorial(n)
  return n if n == 1
  n * factorial(n - 1)
end


def palindrome(str)
  return true if str.nil? || str.length == 1
  ends_equal = str[0] == str[-1]
  palindrome(str[1..-2]) if ends_equal
  ends_equal
end

def bottles_of_beer_on_wall(n)
  return "no bottles of beer on the wall" if n == 0
  p "#{n} bottles of beer on the wall"
  bottles_of_beer_on_wall(n-1)
end

def fibonacci(n)
  return n if [0,1].include?(n)
  fibonacci(n-1) + fibonacci(n-2)
end

def flatten(array)
  return array unless array.is_a?(Array)
  array.length.times do |i|
    if array[i].is_a?(Array)
      element = array.slice!(i)
      element.length.times { |j| array.insert(i, element.pop) }
      flatten(array)
    end
  end
  array
end

def int_to_roman(int)
  roman_mapping = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }
  result = ""
  return result if int == 0
  return roman_mapping[int] if roman_mapping.key?(int)
  roman_mapping.each do |k, v|
    divisor = int / k
    next if divisor == 0
    new_int = int - k * divisor
    result += v * divisor
    result += int_to_roman(new_int)
    break if divisor > 0
  end
  result
end

def roman_to_int(roman)
  roman_mapping = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }
  result = 0
  return result if roman == ""
  return roman_mapping[roman] if roman_mapping.key?(result)
  roman_mapping.each do |k, v|
    rom_arr = [roman[0..1], roman[0]]
    int = nil
    rom_arr.each { |rom| int = roman_mapping[rom] if roman_mapping.key?(rom) && int.nil?  }
    next unless int > 0
    new_rom = roman.slice!(roman_mapping.key(int).length, roman.length - 1)
    result += int
    result += roman_to_int(new_rom)
    break if int > 0
  end
  # p "result: #{result}"
  result
end

def merge_sort(array)
  return array if array.length == 1
  array_a = array[0..array.length/2]
  array_b = array[array.length/2 + 1..array.length-1]
  sort_a = merge_sort(array_a)
  sort_b = merge_sort(array_b)
  p "sort_a: #{sort_a}"
  p "sort_b: #{sort_b}"
  return sort_a + sort_b if sort_a[0] <= sort_b[0]
  return sort_b + sort_a if sort_b[0] <= sort_a[0]
end

int_to_roman 2572
roman_to_int "MMDLXXII"
# merge_sort([2,3,5,4,2])
