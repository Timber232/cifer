#!/usr/bin/env bash

# Variable declaration
mode=""
user_id=""
target_path=""

# Function declaration
function usage() { 
	echo "Usage: $0 [-E | -D] [-u <email|user_id>] [-p <file_path>]" 1>&2; exit 1; 
}

# Gather flag inputs
while getopts EDu:p:t:adio: j; do
	case $j in
		E) E="ENCRYPT" ;;
		D) D="DECRYPT" ;;
		u) u=$OPTARG ;;
		p) p=$OPTARG ;;
		o) o=$OPTARG ;;
		t) t=$OPTARG ;;
		a) a="a" ;;
		d) d="d" ;;
		i) i="i" ;;
	esac
done

# Validation: Required flags
if [ -z "${E}" ] || [ -z "${D}" ] && [ -z "${u}" ] || [ -z "${p}" ]; then
    usage
fi

# ENCRYPT mode
if ! [ -z "${E}" ] ; then
	recipient=$u
	filepath=${p}

	if [ -d "$filepath" ]; then
		# File path exists, do stuff
		if ! [ -z "${a}" ]; then
			for d in ${filepath}*/; do
				tar_flag="-czvf" 
				tar_extension="gz"
				output_path=$filepath

				# if `-t` flag is present
				if ! [ -z "${t}" ] && [ $t="bz2" ]; then
					tar_flag="-cjvf"
					tar_extension="bz2"
				fi

				# if `-o` flag is present
				if ! [ -z "${o}" ]; then
				# TODO: make sure that this filepath exists
					output_path=$o
				fi 

				# Tar, encrypt and remove original tar files
				tar $tar_flag "${output_path}$(basename $d).tar.${tar_extension}" $d && \
					gpg -r $u --encrypt "./${output_path}$(basename $d).tar.${tar_extension}" && \
					rm "./${output_path}/$(basename $d).tar.${tar_extension}"
			done
		else
			echo "Encrypting: ${filepath}"
		fi
	else 
		# Path doesn't exists, return error
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

