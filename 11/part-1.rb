input = ARGV[0].dup
input.succ! until input =~ /^(?=[^iol]*$).*((.)\2.*){2}/ &&
                  (?a..?z).each_cons(3).map(&:join).any? {|x| input.include? x}
p input
