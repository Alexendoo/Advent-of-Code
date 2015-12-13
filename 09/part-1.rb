graph = Hash.new { |h, k| h[k] = {} }
final = Float::INFINITY
IO.foreach('input') do |line|
  x = line.chomp.split
  graph[x[2]][x[0]] = graph[x[0]][x[2]] = x[4].to_i
end

graph.keys.permutation(graph.length) do |seq|
  total = 0
  total += graph[seq.shift][seq.first] while seq.length > 1
  final = total < final ? total : final
end

p final
