grep -Po '^"|"$|\\x.|\\\K.' input | tr -d '\n' | wc -m
