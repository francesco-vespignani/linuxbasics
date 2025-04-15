
##  Manipulating (relatively)  large text files

The file freqlistITWAC.txt contains a list of frequencies of Italian words taken from the [itwac corpus](https://www.sketchengine.eu/itwac-italian-corpus/). To  give a look to the file use ``more''.

To see how big and long it is try this:

~~~
du -h freqlistITWAC.txt
wc -l freqlistITWAC.txt 
~~~

Try to read it with R, microsoft excel....

``` R
##  read database

t = read.table('freqlistITWAC.txt')
colnames(t) = c('freq','word','cat')
t$len = nchar(t$word)
t$logf = log(t$freq)


##  usage

t1 [t1$word  == 'cane',]
t1 [t1$len  == 4 & t$logf <11.7 & t$logf>11.5,]

```


Let's see what we can  do  with coreutils.

Select fileds with cut, transform tu uppercase with awk.

The big advantage is to test the effect of the script with more before it completely reads the file (lazy).

```bash

cut -f 2 freqlistITWAC.txt | more

```

Add an header with echo and change field separators to commas (by the way I suggest to use tab) ,  by the way'

```bash

echo 'sreq,word,pos' > prova.csv; cat freqlistITWAC.txt | tr '\t' ',' >>  prova.csv
more prova.csv
rm prova.csv

```


Selecting row with grep,  search for dogs (cane)

```bash

cat freqlistITWAC.txt | grep -e 'cane' | more
cat freqlistITWAC.txt | grep -e '\scane\s' | more

```


*Exercise*,  try to understand what I am doing here

``` bash

cat freqlistITWAC.txt | grep -e '[^a-zA-Z]cane[^a-zA-Z]' | grep -v -e '^1\s' | more


```

More on [regexp](https://www.gnu.org/software/gnulib/manual/html_node/Regular-expressions.html)


Using awk  to manipulate files.


Adding number of character count.

``` bash

cat freqlistITWAC.txt | awk '{print $0, length($2)}' | more


```

*Exercise* try print $0 $1, $2 ... and reorder the column as word, pos, nchar and freq,  use sort to order row by char and then by freq (man sort)

Using grep and awk  to select rows


``` bash

cat freqlistITWAC.txt | grep -E 'gh[ei]|ch[ei]' | more

cat freqlistITWAC.txt | grep -E 'gh[ei]|ch[ei]' | awk '($1>30 && $1<30000){print $0} |more

cat freqlistITWAC.txt | grep -E 'gh[ei]|ch[ei]' | grep 'NOUN$' | awk '($1>30 && $1<30000){print $0}' |more

tac freqlistITWAC.txt | grep -E 'gh[ei]|ch[ei]' | grep 'NOUN$' | awk '($1>30 && $1<30000){print $0}' |more

```

*Exercise*  select only words less than 10 char long and print numer of characters, then sort then alphabetically.

See more suggestions on how to select on fileds with awk or sed [here](https://stackoverflow.com/questions/17001849/awk-partly-string-match-if-column-word-partly-matches)



##  Create many files

See the script [manyfiles](manyfiles.sh) which generate a  directory with subdirectories containing simulated random data.

For random number generation see [randomvar](https://tldp.org/LDP/abs/html/randomvar.html)

**Exercise**: Suppose these are data which represent single subjects data,  build a single file containing all data with a further filed coulm indicating the number of the subject which is encoded as directory name.

Sime hints,  try these commands.


``` bash

find data1/ | grep .txt
find data1/ | grep .txt
find data1/ | grep .txt | sed 's/data1\///' | sed 's/\/behav.txt//'

awk '{printf $0; printf "\t"; printf FILENAME; printf "\n"}' data1/S001/behav.txt 
awk '{printf $0; printf "\t"; printf "pippo"; printf "\n"}' data1/S001/behav.txt

```






   


