x      = Hash.new { |h, k| h[k] = [] }
points = Hash.new { |h, k| h[k] = 0 }
total  = 2503
IO.foreach('input') do |line|
  n = line.scan(/\d+/).map(&:to_i)
  total.times do |t|
    x[line.split[0]] << n[0] * n[1] * (t / (n[1] + n[2])) + n[0] * [t % (n[1] + n[2]), n[1]].min
  end
end

(1...total).each do |t|
  max = x.values.map { |e| e[t] }.max
  x.select { |_k, v| v[t] == max }.each_key { |k| points[k] += 1 }
end

p points.values.max
