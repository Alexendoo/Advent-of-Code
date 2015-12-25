x = IO.readlines('input').map(&:to_i)
target = x.reduce(:+) / 3
num = (1..x.size).find { |n| x.combination(n).map { |e| e.reduce(:+) }.include? target }
p x.combination(num).select { |e| e.reduce(:+) == target }.map { |e| e.reduce(:*) }.min
