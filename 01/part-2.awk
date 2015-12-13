BEGIN { FS="" }
{
  for(i=1; i<=NF; i++) {
    $i == "(" ? x++ : x--
    if (x < 0) {
      print i
      exit
    }
  }
}
	
