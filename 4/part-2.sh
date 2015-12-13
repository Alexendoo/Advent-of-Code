i=0; secret=iwrupvqb; until [[ $(echo -n $secret$i | md5sum) == 000000* ]]; do let i++; done; echo $i
