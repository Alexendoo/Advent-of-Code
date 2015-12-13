p IO.read('input').scan(/-?\d+/).map(&:to_i).reduce(:+)
