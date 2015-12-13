x = Hash.new { |h, k| h[k] = {} }

IO.foreach('input') do |line|
  y = line.chomp.chop.split
  x[y.first][y.last] = y[3].to_i * (y[2] == 'lose' ? -1 : 1)
end

p x.keys.permutation.map { |perm|
  perm.reduce(0) { |a, e|
    a + x[e][perm.rotate.at(perm.index(e))] + x[e][perm.rotate(-1).at(perm.index(e))]
  }
}.max
