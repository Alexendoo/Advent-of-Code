count = 0
robo_x = robo_y = 0
santa_x = santa_y = 0

grid = {}
grid[0] = Hash.new(0)
grid[0][0] = 1

STDIN.each_char do |char|
  case char
  when '>'
    count.even? ? robo_x += 1 : santa_x += 1
  when '<'
    count.even? ? robo_x -= 1 : santa_x -= 1
  when '^'
    count.even? ? robo_y += 1 : santa_y += 1
  when 'v'
    count.even? ? robo_y -= 1 : santa_y -= 1
  end
  grid[robo_x] = Hash.new(0) unless grid[robo_x].is_a?(Hash)
  grid[santa_x] = Hash.new(0) unless grid[santa_x].is_a?(Hash)
  count.even? ? grid[robo_x][robo_y] += 1 : grid[santa_x][santa_y] += 1
  count += 1
end

count = 0
grid.keys.each do |x|
  grid[x].keys.each do |y|
    count += 1 if grid[x][y] > 0
  end
end
puts count
