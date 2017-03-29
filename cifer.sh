#!/usr/bin/env bash

# Variable declaration
mode=""
user_id=""
target_path=""

# Function declaration
function usage() { 
	echo "Usage: $0 [-E | -D] [-u <email|user_id>] [-p <file_path>]" 1>&2; exit 1; 
}

# Check if directory exists
function directory_exists() {
	if [ -d "$0" ]; then
		return true
	else 
		return false
	fi
}

# Gather flag inputs
while getopts EDu:p:t:adi o; do
	case $o in
		E) E="ENCRYPT" ;;
		D) D="DECRYPT" ;;
		u) u=$OPTARG ;;
		p) p=$OPTARG ;;
		t) t="$OPTARG" ;;
		a) a="$OPTARG" ;;
		d) d="$OPTARG" ;;
		i) i="$OPTARG" ;;
	esac
done

# Validation: Required flags
if [ -z "${E}" ] || [ -z "${D}" ] && [ -z "${u}" ] || [ -z "${p}" ]; then
    usage
fi

if [ E="ENCRYPT" ] ; then
	# Encrypt code
	recipient=$u
	filepath=$p

	if [ -d "$filepath" ]; then
		# File path exists, do stuff
		echo "doing stuff"
	else 
		echo "$0 is not a directory or does not exists."
		exit 1
	fi
	# for d in $filepath/*/; do
	# 	# Delete encrypted files if exists
	# 	if test -e "./$filepath/$(basename $d).tar.gz.gpg"; then
	# 		rm "./$filepath/$(basename $d).tar.gz.gpg"
	# 	fi

	# 	# Tar and encrypt (remove the original tar afterwards)
	# 	tar -czvf "./$filepath/$(basename $d).tar.gz" $d && gpg -r $recipient --encrypt "./$filepath/$(basename $d).tar.gz" && rm "./$filepath/$(basename $d).tar.gz"	
	# done
# elif [ D="DECRYPT" ]; then
	# Decrypt code

fi

# for d in $filepath/*/; do
# 	# Delete encrypted files if exists
# 	if test -e "./$filepath/$(basename $d).tar.gz.gpg"; then
# 		rm "./$filepath/$(basename $d).tar.gz.gpg"
# 	fi

# 	# Tar and encrypt (remove the original tar afterwards)
# 	tar -czvf "./$filepath/$(basename $d).tar.gz" $d && gpg -r $recipient --encrypt "./$filepath/$(basename $d).tar.gz" && rm "./$filepath/$(basename $d).tar.gz"	
# done

