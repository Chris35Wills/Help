# Bash cheat sheet (Software carpentry course notes)
# Grace Cox (demonstrator)
====================================================

ctrl+e -> jump to end of line

##Lengths and sorting

wc *.pdb # line/word/character count for specified files
wc -l *.pdb # line count for specified files
wc -l *.pdb> lengths.txt # redirect stdout to file
cat lengths.txt # view file

sort -n lengths.txt # sort list (lengths of things in lengths.txt)
sort -n lengths.txt > sorted.txt
head -1 sorted.txt # get top of sorted.txt (in this case the shortest)

sort -n lengths.txt | head -1 # use pipe to get top of the lengths file (saves development of temp file "sorted.txt")

### Piping

wc -1 *.pdb | sort -n | head -1 # saves the need to create any of the temp files (lengths.txt and sortd.txt) above - sorts word and line count and prints out the first in the sorted list

wc -l *.txt | sort -n | tail -5

ls *[AB].txt # list all txt files with either A or B before the ".txt"

wc -l * | sort -n | head -3 #  find the 3 files which have the least number of lines


##############

animals.txt:

2012-11-05,deer
2012-11-05,rabbit
2012-11-05,raccoon
2012-11-06,rabbit
2012-11-06,deer
2012-11-06,fox
2012-11-07,rabbit
2012-11-07,bear

cut -d , -f 2 animals.txt | sort | uniq # gets second column, sorts it (alphabet) and gets rid of duplicates

################
## Loops

#Get first 3 lines of each file (f_1 and f_2)

for filenmae in f_1 f_2
do
head -3 $filename
done

--or--

for filenmae in *.dat; do; head -3 $filename; done

################
## Echo command!
## Shows what will come out of command without doing it!

for filenmae in *.dat; do echo cp $filenmae original-$filename; done

#goostats.sh is a program that needs to be run on each file in a directory
#Only interested in files *A.txt and *B.txt
#Print filenames per step to show things are happening!

for datafile in *[AB].txt; do echo $datafile ; bash goostats $datafile stats-$datafile; done




