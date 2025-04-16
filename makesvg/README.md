# image generation

[SVG](https://it.wikipedia.org/wiki/Scalable_Vector_Graphics) is a standard (like pdf) for vector graphics, widely used in the web.

Imagine a pupillometry experiment in which you present on the screen sequences of syllables (white on a black background) with a given font, font size and resolution and we want to get a measure of how many pixels are on (white) for each frame or the average brightness.

We will generate/simulate the pictures and compute the number of white pixels using the bash.

See the [svg.svg](svg.svg) example file. 

**Exercise:** change font, font size, screen resolution

Run the following commands

```
rm -Rf images
mkdir images
cat svg.svg | sed 's/LOVE/CHE/' > images/CHE.svg
```

If you open the svg file and zoom you willn ever see pixels (it is a vector image),  to convert into a raster image use convert

```
convert images/CHE.svg images/CHE.png

file images/CHE.svg
file images/CHE.png


```

Try to zoom on the png image now

**Exercise:**  Change the output format and resolution

Count the white pixels, see this [post](https://www.imagemagick.org/discourse-server/viewtopic.php?t=11304),  hopefully the following is doing the job

```
convert images/CHE.png -colorspace Gray -format "%[mean]" info:
 
convert images/CHE.png -colorspace Gray -format "%[mean*w*h]" info:
```

**Exercise:**  Create a file with brighness information from the syllables in file b11.csv

Hints...

Remove header, cell protection ", get only syllables


```

tail -n +2 b11.csv | sed 's/"//g'  | cut -d, -f1

```

To loop over lines of a file

```
cat b11.csv | while read line 
do
   # do something with $line here
   echo $line
done
```

See [calc.sh](calc.sh) for a  partial solution

**Exercise:** Use [ffmpeg](https://ffmpeg.org/) with the png files to create a movie with syllabes pictures presented at a fixed rate.


