#!/bin/bash

if [[ -z $1 ]]
then 
	echo "zero parametrs!"
	exit 0
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ]
then 
	echo "<size> <dir>"
	echo " size is desired size in format 'XxY' ex. '100x500'"
	echo " dir is directory in which every image would be resized"
	exit 0
fi

count=0 # Counter of processed images
amount=$(ls $2 | wc -l) # Count amount of images in directory
echo "$count/$amount images converted"
for file in $(ls $2)
do 
	ext="${file##*.}" # Extension of image
	name="${file%.*}" # Name of image without extension
	./magick $2/$file -resize "$1" $2/$name-$1.$ext # Resizing image
	count=$((count+1)) # Increment amount of processed images
	echo "$count/$amount images converted"
done
