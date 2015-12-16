x = {}
IO.foreach('input') { |line| x[line.split[0].chop] = line.scan(/-?\d+/).map(&:to_i) }
p x.keys.repeated_combination(100).collect { |c|
  if c.uniq.reduce(0) { |a, e| a + c.count(e) * x[e].last } == 500
    (0..3).reduce(1) do |a, num|
      a * [c.uniq.reduce(0) { |acc, ing| acc + c.count(ing) * x[ing][num] }, 0].max
    end
  else
    0
  end
}.max
