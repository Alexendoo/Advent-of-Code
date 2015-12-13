BEGIN { FS="" }
{
  for(i=1; i<=NF; i++)
    $i == "(" ? x++ : x--
  print x
}
	
