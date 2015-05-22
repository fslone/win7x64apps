#!/bin/bash

#get current dir
dir=$(pwd)

zipFileLoc=zippedInstallers

#mkdir for zip files if not exists
mkdir -p $zipFileLoc

for file in $dir/*; do

	#start exe installers
	if [[ $file == *.exe ]];
	then
		"$file"
	#start exe installers
	if [[ $file == *.msi ]];
	then
		msiexec "$file"
	#move zip files into separate dir
	elif [[ $file == *.zip ]];
	then
		mv $file $zipFileLoc/
	fi

done

#change into $zipFileLoc, expand and remove all 
#archives
cd $zipFileLoc

for file in $dir/$zipFileLoc/*; do
	echo $file
	unzip $file
	rm $file
done

exit 0