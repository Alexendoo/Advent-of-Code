x = IO.readlines('input').map { |e| e.chomp.to_i }
p (0..x.size).flat_map { |s| x.combination(s).to_a }.count { |e| e.reduce(:+) == 150 }
