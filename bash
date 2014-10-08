~~~~~~~~~
Bash help
~~~~~~~~~

Basic loop:

for i in 5; do echo "$i"; done
for i in (20..100); do echo "$i"; done

for i in `ls mosaic_scriptedb0*.dem`
do
echo $i
done

Leading zeros

digits = 000
for i in {1..170}; do printf "%0*d\n" ${#max} $i ;done 
# prints all values 1-170 with as many digits as are in variable "digits"

for i in {99..100}; do j= printf "%0*d\n" ${#max} $i ; done   


Bespoke operations

# Change characters in filenames - all instances of 25 changed to 50

for i in *25*; do mv "$i" "${i//25/50}"; done 

#Change endings of a suite of files and copy one file using the name (useful for
duplicating .hdr files)

for i in *percent.bin; do
	base=`basename $i .bin`
	cp file.hdr $base.hdr
done

#Concatenate bands to a specific output file
for i in {160..170}; do cat mosaic_scripted_b$((i++)).dem > /geog/data/sirius/epsilon/ggwillc/KNS_hyperspectral_extra_processing_outputs/KNS_201a_bands160..190.bin ;done 

#Concatenate specific bands in range to a specific output file - ensuring $i accounts for leading zeros 
max=000
echo " " > output_leading0.txt
for i in {20..190}; do printf "%0*d\n" ${#max} $i >> output_leading0.txt; done
for i in `cat output_leading0.txt`; do echo mosaic_scripted_b"$i".bin; done
for i in `cat output_leading0.txt`; do cat mosaic_scripted_b"$i".dem >> /geog/data/sirius/epsilon/ggwillc/KNS_hyperspectral_extra_processing_outputs/KNS_201a_bands_20..190.dem; done

cat mosaic_scripted_b* > test



