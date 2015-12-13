p 40.times.reduce(ARGV[0]) { |a| a.gsub(/(\d)\1*/) { |m| "#{m.size}#{$1}" } }.size
