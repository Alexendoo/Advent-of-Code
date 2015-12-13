i = 0
arr = Array.new(1000) { Array.new(1000, 0) }

File.foreach('input') do |line|
  coords = line.scan(/\d+,\d+/).collect { |e| e.split(',').map(&:to_i) }
  (coords[0][0]..coords[1][0]).each do |x|
    (coords[0][1]..coords[1][1]).each do |y|
      arr[x][y] =
        case line.match(/turn on|turn off|toggle/)[0]
        when 'turn on' then arr[x][y] + 1
        when 'turn off' then arr[x][y] == 0 ? 0 : arr[x][y] - 1
        when 'toggle' then arr[x][y] + 2
        end
    end
  end
end

arr.each { |x| x.each { |y| i += y } }
p i
