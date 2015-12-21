input = IO.readlines('input').map(&:chomp).reject(&:empty?)
str = " #{input.pop} "
x = []
input.each do |e|
  str.split(/(?=#{e.split[0]})/).each_index do |i|
    next if i.zero?
    t = str.split(/(?=#{e.split[0]})/)
    t[i].sub!(e.split[0], e.split[-1])
    x << t.join.strip
  end
end
p x.uniq.count
