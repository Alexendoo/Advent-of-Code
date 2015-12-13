x = {}

File.foreach('input') do |line|
  op = line.match(/[A-Z]+|$/)[0]
  args = line.chomp.split(' ')

  x[args[-1]] =
    case op
    when 'AND' then "#{args[0]} & #{args[2]}"
    when 'OR' then "#{args[0]} | #{args[2]}"
    when 'LSHIFT' then "#{args[0]} << #{args[2]}"
    when 'RSHIFT' then "#{args[0]} >> #{args[2]}"
    when 'NOT' then "~ #{args[1]}"
    else "#{args[0]}"
    end
end

p x
# x.each_pair do |key, value|
#   x[key].gsub!(/([a-z]+)/, x)
#   puts  "#{key} => #{x[key]}"
# end
50.times do
  x['a'].gsub!(/([a-z]+)/) { '(' + x[$1] + ')' }
  p x['a']
end

p x['a']
