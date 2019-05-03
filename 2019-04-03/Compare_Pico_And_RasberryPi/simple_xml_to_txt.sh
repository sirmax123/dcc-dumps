#!/usr/bin/env bash

# Convert XML to txt in order to be able to 
# build charts with Gnu Plot tool

test -f ${1}  || exit 127

# Use gsed for Mac and sed for linux
SED=$(which gsed)
SED=${SED:-"sed"}


cat ${1} \
| ${SED} -z 's/<\/seq>\n//g'  \
| ${SED} 's/<[/]*val>/ /g' \
| ${SED} 's/<seq>//g' \
| grep -v -E 'Point|Document' > ${1}.txt
