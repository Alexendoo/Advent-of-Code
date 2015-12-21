boss   = IO.read('input').scan(/\d+/).map(&:to_i)
shop = {
  weapons: [[  8, 4, 0], [ 10, 5, 0], [ 25, 6, 0], [ 40, 7, 0], [ 74, 8, 0]],
  armor:   [[ 13, 0, 1], [ 31, 0, 2], [ 53, 0, 3], [ 75, 0, 4], [102, 0, 5]],
  rings:   [[ 25, 1, 0], [ 50, 2, 0], [100, 3, 0], [ 20, 0, 1], [ 40, 0, 2], [ 80, 0, 3]]
}
shop.each_key { |k| shop[k] << [0, 0, 0] unless k == :weapons }
p shop[:rings].product(*shop.values).select { |e|
  e[0] != e[-1] &&
    boss[0] / [e.reduce(0) { |a, e| a + e[1] } - boss[2], 1].max > 100 / [boss[1] - e.reduce(0) { |a, e| a + e[2] }, 1].max
}.max_by { |e| e.reduce(0) { |a, e| a + e[0] } }.reduce(0) { |a, e| a + e[0] }
