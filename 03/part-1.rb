x = y = 0

grid = {}

grid[x] = Hash.new(0)
grid[x][y] = 1

STDIN.each_char do |char|
  case char
  when '>'
    x += 1
  when '<'
    x -= 1
  when '^'
    y -= 1
  when 'v'
    y += 1
  end
  grid[x] = Hash.new(0) unless grid[x].is_a?(Hash)
  grid[x][y] += 1
end

count = 0
grid.keys.each do |xx|
  grid[xx].keys.each do |yy|
    count += 1 if grid[xx][yy] > 0
  end
end
puts count
