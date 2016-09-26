https://stackoverflow.com/questions/20721120/how-to-split-csv-files-as-per-number-of-rows-specified

http://edmondscommerce.github.io/linux/linux-split-file-eg-csv-and-keep-header-row.html


tail -n +2 file.txt | split -l 1000 - split_
for file in split_*
do
	head -n 1 file.txt > tmp_file
	cat$file >> tmp_file mv -f tmp_file $file
done