x = IO.readlines('input').map do |e|
  case e.split.first
  when 'hlf' then "#{e.split.last} /= 2"
  when 'tpl' then "#{e.split.last} *= 3"
  when 'inc' then "#{e.split.last} += 1"
  when 'jmp' then "line += #{e.split.last.to_i - 1}"
  when 'jie' then "line += #{e.split.last.to_i - 1} if #{e.split[1].chop}.even?"
  when 'jio' then "line += #{e.split.last.to_i - 1} if #{e.split[1].chop} == 1"
  end
end
a = 1
b = line = 0
until line >= x.length
  eval x[line]
  line += 1
end

puts "a: #{a}\tb: #{b}"
