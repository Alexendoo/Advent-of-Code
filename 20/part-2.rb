# Doesn't work
num = ARGV[0].to_i
p (1..num).find { |e| (1..(e**0.5).floor).select { |n| e / n <= 50 }.reduce(0) { |a, n| e % n == 0 ? a + n*11 + e*11 / n : a } > num }
