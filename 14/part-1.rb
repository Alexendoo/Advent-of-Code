x = []
t = 2503
IO.foreach('input') do |line|
  n = line.scan(/\d+/).map(&:to_i)
  x << n[0] * n[1] * (t / (n[1] + n[2])) + n[0] * [t % (n[1] + n[2]), n[1]].min
end
p x.max
