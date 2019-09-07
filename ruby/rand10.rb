#!/usr/bin/ruby
ans = rand(10)
k = gets.to_i
if (k==ans)
    puts "Correct: #{ans}==#{k}"
else
    puts "No: #{ans}!=#{k}"
end
