x = IO.readlines('input').map { |e| e.chomp.to_i }
p (0..x.size).flat_map { |s| x.combination(s).to_a }.select { |e| e.reduce(:+) == 150 }
  .group_by(&:size).first.last.length
