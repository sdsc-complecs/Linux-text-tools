for file in $(ls -1 out*); do
  node=$(head -1 $file | awk '{print $1}')
  card=$(awk '/AIP \(/ {print $4}' $file)
  tstart=$(awk '/TBEFORE/ {print $2}' $file)
  tend=$(awk '/AFTER/ {print $2}' $file)
  corr=$(awk '/Correct answers/ {print $8}' $file | tail -n 1)   # Last instance
  ach=$(awk '/Achieved sentences/ {print $3}' $file | tail -n 1) # Last instance
  t=$(expr $tend - $tstart)                     # Do math to calculate tend - tstart
  echo $node $card $corr $ach $t
done
