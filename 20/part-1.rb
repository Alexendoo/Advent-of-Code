num = ARGV[0].to_i / 10
p (1..num).find { |e| (1..(e**0.5).floor).reduce(0) { |a, d| e % d == 0 ? a + d + e / d : a } > num }
