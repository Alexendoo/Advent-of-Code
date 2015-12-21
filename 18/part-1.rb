@input = IO.readlines('input')
@size = @input.count

def neighbors(x, y)
  ([0, x - 1].max..[x + 1, @size - 1].min).map do |xx|
    ([0, y - 1].max..[y + 1, @size - 1].min).map do |yy|
      (xx != x || yy != y) ? @state[xx][yy] : false
    end.count(true)
  end.reduce(:+)
end

def step
  @state = @state.each_with_index.map do |e, x|
    e.each_with_index.map do |e, y|
      neighbor_count = neighbors(x, y)

      e ? (neighbor_count == 2 || neighbor_count == 3) : neighbor_count == 3
    end
  end
end

def force_lights(lights)
  lights.each { |v| @state[v[0]][v[1]] = true }
end

[[], [[0, 0], [0, @size - 1], [@size - 1, 0], [@size - 1, @size - 1]]].each do |always_on|
  @state = @input.map { |str| str.chomp.split('').map { |s| s == '#' } }
  force_lights(always_on)

  100.times { step; force_lights(always_on) }
  puts @state.map { |s| s.count(true) }.reduce(:+)
end
