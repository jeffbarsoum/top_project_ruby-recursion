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
