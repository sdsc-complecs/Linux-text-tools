echo 'node      time    P F'                   # Print header
for file in $(ls output.hpl*); do              # Iterate over output files
  node=$(head -1 $file)                        # Node name from first line
  t=$(awk '/WR12R2R4/ {print $6}' $file)       # Time from 6th field of WR12R2R4 line
  npass=$(grep PASSED $file| wc -l)            # Number of passed tests
  nfail=$(grep FAILED $file| wc -l)            # Number of failed tests
  echo $node $t $nfail $npass
done
