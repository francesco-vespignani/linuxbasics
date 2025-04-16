tail -n +2 b11.csv | sed 's/"//g'  | cut -d, -f1 | sort | uniq | while read line 
do
   # do something with $line here
   cat svg.svg | sed "s/LOVE/$line/" > images/$line.svg
   convert images/$line.svg images/$line.png
   val=$(convert images/$line.png -colorspace Gray -format "%[mean]" info:)
   echo -e "$line\t$val"
done

