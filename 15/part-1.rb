x = {}
IO.foreach('input') { |line| x[line.split[0].chop] = line.scan(/-?\d+/).map(&:to_i) }
p x.keys.repeated_combination(100).collect { |c|
  (0..3).reduce(1) do |a, num|
    a * [c.uniq.reduce(0) { |acc, ing| acc + c.count(ing) * x[ing][num] }, 0].max
  end
}.max
