p IO.read('shop').split(/\n\n/).map { |e| e.scan(/\d+/).map(&:to_i).each_slice(3).to_a }
