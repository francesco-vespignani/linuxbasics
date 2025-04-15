datadir='data1'
MAXCOUNT=1000

rm -Rf $datadir

mkdir $datadir

for d in $(seq 0 1 32); 
do
    printf "$datadir/S%03d" $d | xargs mkdir
    count=1
    filename=$(printf "$datadir/S%03d/behav.txt" $d)
    while [ "$count" -le $MAXCOUNT ]      # Generate 10 ($MAXCOUNT) random integers.
    do
  	number=$RANDOM
  	let "bool = $RANDOM % 2"
  	printf $number\\t$bool\\n >> $filename
  	let "count += 1"  # Increment count.
    done
    
done
done

