boss = IO.read('input').scan(/\d+/).map(&:to_i)
shop = IO.read('shop').split(/\n\n/).map { |e| e.scan(/(?<!\+)\d+/).map(&:to_i).each_slice(3).to_a }

shop.each_index { |i| shop[i] << [0, 0, 0] unless i.zero? }
p shop[-1].product(*shop).select { |e|
  (e[0] != e[-1] || e[0] == [0, 0, 0]) &&
    boss[0] / [e.reduce(0) { |a, e| a + e[1] } - boss[2], 1].max <= 100 / [boss[1] - e.reduce(0) { |a, e| a + e[2] }, 1].max
}.min_by { |e| e.reduce(0) { |a, e| a + e[0] } }.reduce(0) { |a, e| a + e[0] }
