input = IO.readlines('input').map(&:chomp).reject(&:empty?)
target = " #{input.pop} "
x = [' e ']
count = 0
until x.include? target
  y = []
  p count
  count += 1
  x.dup.each do |str|
    input.each do |e|
      str.split(/(?=#{e.split[0]})/).each_index do |i|
        next if i.zero?
        t = str.split(/(?=#{e.split[0]})/)
        t[i].sub!(e.split[0], e.split[-1])
        y << t.join
      end
    end
  end
  x.replace y.uniq
end
p count
