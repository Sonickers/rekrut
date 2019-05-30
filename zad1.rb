def fizz_buzz
  (1..100).each do |d|
    if d % 3 == 0 && d % 5 == 0
      puts "FizzBuzz"
    elsif d != 3 && d % 3 == 0
      puts "Fizz"
    elsif d != 5 && d % 5 == 0
      puts "Buzz"
    else
      puts d
    end
  end
end

fizz_buzz()