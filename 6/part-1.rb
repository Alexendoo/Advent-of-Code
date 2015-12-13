i = 0
arr = Array.new(1000) { Array.new(1000, false) }

File.foreach('input') do |line|
  coords = line.scan(/\d+,\d+/).collect { |e| e.split(',').map(&:to_i) }
  (coords[0][0]..coords[1][0]).each do |x|
    (coords[0][1]..coords[1][1]).each do |y|
      arr[x][y] =
        case line.match(/turn on|turn off|toggle/)[0]
        when 'turn on' then true
        when 'turn off' then false
        when 'toggle' then !arr[x][y]
        end
    end
  end
end

arr.each { |x| i += x.count(true) }
p i
