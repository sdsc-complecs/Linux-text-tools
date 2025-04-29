# Answers to exercises

### head/tail 1
Display the first three/last three lines of file.txt using the
head/tail commands.

```
head -3 file.txt  
tail -3 file.txt
```

### head/tail 2
Using a combination of head and tail, display lines 5-10 of file.txt

```
head -10 file.txt | tail -5
```

### paste 1
Use the paste command to combine the planet names, colors,
masses and duration of year into a single file using the default
delimiter and user specified delimiters. Delete rows from one of the
files and see how this affects the output.

```
paste planet-name.txt planet-mass.txt planet-year.txt planet-color.txt
paste -d ',' planet-name.txt planet-mass.txt planet-year.txt planet-color.txt
paste -d ' ', planet-name.txt planet-mass.txt planet-year.txt planet-color.txt
```

### nl 1
Add line numbers to the planet-name.txt file. Experiment with options to left justify numbering, right justify numbering with zero padding, adjust the width of the numbers (useful in combination with zero padding), change the increment and change the starting number. Consult the nl man page as needed.

```
nl planet-name.txt
nl -n ln planet-name.txt
nl -n rz planet-name.txt
nl -n rz -w 3 planet-name.txt
nl -i 10 planet-name.txt
nl -v 5 planet-name.txt
```

### sort 1
Split the file split-ex.txt into three parts using (i)
default file naming parameters, (ii) a user defined prefix
(e.g. part_), (iii) user defined suffix and numeric suffic instead of
alphabetic suffix. Repeat specifying a line length instead of number
of output files.

```
sort -k 1 produce.txt
sort -k 2 produce.txt
sort -k 3 produce.txt
sort -k 4 -n produce.txt
sort -k3,3 -k4n produce.txt
sort -k2,2 -k4n -k1,1 produce.txt
```

### shuf 1
Generate a random ordering of the lines in file.txt

```
shuf file.txt
```

### split 1
Split the file split-ex.txt into three parts using (i) default file naming parameters, (ii) a user defined prefix (e.g. part_), (iii) user defined suffix and numeric suffic instead of alphabetic suffix. Repeat specifying that each output file should contain 10 lines.

```
split -n 3 split-ex.txt
split -n 3 split-ex.txt part_
split -n 3 -d split-ex.txt part_
split -l 10 split-ex.txt
split -l 10 split-ex.txt part_
split -l 10 -d split-ex.txt part_
```

### awk 1
Write an awk one-liner to print out the first and last fields from
each record of a file. Assume that the records can contain different
numbers of fields. Test your script on fruit.txt 

```
awk '{print $1, $NF}' fruit.txt
```

### awk 2
odify the previous solution so that if the record contains a
single field, it's only printed once.

```
awk '{if (NF==1) print $1; else print $1, $NF}' fruit.txt
```

### awk 3
Modify the previous solution to print "..." between the first and
last element if the record contains more than two fields. For example,
given the file with the following contents

a  
a b  
a b c  
a b c d  

The output would be

a  
a b  
a ... c  
a ... d  

```
awk '{if (NF==1) print $1; else if (NF==2) print $1, $2; else print $1, "...", $NF}' fruit.txt 
```
