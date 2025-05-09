# Answers to exercises

### head/tail 1
Display the first three/last three lines of file-short.txt using the
head/tail commands.

```
head -3 file-short.txt  
tail -3 file-short.txt
```

### head/tail 2
Using a combination of head and tail, display lines 5-10 of file-short.txt

```
head -10 file-short.txt | tail -5
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
The produce.txt file contains the name, color, country of origin, and price for various fruits. Using the sort command, (i) sort by name, (ii) color, (iii) origin, (iv) price, (v) origin and then price, (vi) color, price and name. Keep in mind that price is a numerical value.

```
sort -k 1 produce.txt
sort -k 2 produce.txt
sort -k 3 produce.txt
sort -k 4 -n produce.txt
sort -k3,3 -k4n produce.txt
sort -k2,2 -k4n -k1,1 produce.txt
```

### shuf 1
Generate a random ordering of the lines in file-short.txt

```
shuf file-short.txt
```

### split 1
Split the file file-long.txt into three parts using (i) default file naming parameters, (ii) a user defined prefix (e.g. part_), (iii) user defined suffix and numeric suffix instead of alphabetic suffix. Repeat specifying that each output file should contain 10 lines.

```
split -n 3 file-long.txt
split -n 3 file-long.txt part_
split -n 3 -d file-long.txt part_
split -l 10 file-long.txt
split -l 10 file-long.txt part_
split -l 10 -d file-long.txt part_
```

### grep 1
List all planets from planet-name.txt that (i) contain the letter 'n',
(ii) do not contain the letter 'n', (iii) end with the letter 's', and
(iv) start with a vowel. We haven't covered character classes yet -
relevant to the last question - but you can use [AEIOU] in place of
the single character.

```
grep 'n' planet-name.txt
grep -v 'n' planet-name.txt
grep 's$' planet-name.txt 
grep '^[AEIOU]' planet-name.txt
```

### grep 2
List all lines from file-short.txt that contain the digit '2' along
with the preceding and following line. Does the order of the options
matter? What happens if there is no following line? Repeat searching
for the digit '5' in file-long.txt. What are the implications of
multiple consecutive lines containing a '5'?

```
grep '2' -A1 -B1 file-short.txt
grep '5' -B1 -A1 file-long.txt
```

### sed 1
Apply sed to the file produce.txt to (i) replace all occurrences of
apple with grape and (ii) replace all occurrences of apple with grape
only if country of origin is Canada.

```
sed 's/apple/grape/' produce.txt
sed '/Canada/ s/apple/grape/' produce.txt
```

### sed 2
Apply sed to file-long.txt to (i) replace Line with Record and (ii)
replace Line with Record only if the number following line starts with
the digit '4'.

```
sed 's/Line/Record/' file-long.txt
sed 's/Line 4/Record 4/' file-long.txt
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
