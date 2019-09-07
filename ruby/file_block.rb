#!/usr/bin/ruby
filename = ARGV[0]
pattern = Regexp.new(ARGV[1])
i = 0

File.open(filename, 'r').each_line do |line|
    i += 1
    puts("#{i}: #{line}") if line =~ pattern
end
