y, x = IO.read('input').scan(/\d+/).map(&:to_i)
code = 20151125
((x + y) * (x + y - 1) / 2 - y).times { code = code * 252533 % 33554393 }
p code
