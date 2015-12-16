equal = { children:    3, samoyeds: 2, akitas:   0,
          vizslas:     0, cars:     2, perfumes: 1 }
more  = { cats:        7, trees:    3 }
less  = { pomeranians: 3, goldfish: 5 }
lines = []
IO.foreach('input') { |line| lines << line.chomp.gsub(/Sue (\d+):/, 'Sue: \1,').split(', ').map { |e| e.split(': ') }.to_h }
lines.delete_if do |e|
  !(e.all? { |k, v| !equal.key?(k.to_sym) || v.to_i == equal[k.to_sym] } &&
    e.all? { |k, v| !more.key?(k.to_sym) || v.to_i > more[k.to_sym] } &&
    e.all? { |k, v| !less.key?(k.to_sym) || v.to_i < less[k.to_sym] })
end
lines.each { |e| puts e['Sue'] }
