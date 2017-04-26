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
while getopts EDu:p:t:ado: j; do
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

# ENCRYPT Mode
if [ E="ENCRYPT" ] ; then
	recipient=$u
	filepath=${p}

	if [ -d "$filepath" ]; then
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
			if [ -d "${o}" ]; then
				output_path=$o
			else
				# Output directory does not exists. Exit with error.
				echo "$o is not a directory or does not exists."
				exit 1
			fi
		fi

		# Check if user would like to overwrite existing encrypted file(s).
		existing_encrypted_file=()
		for directory in $filepath/*/; do
			if test -e "${output_path}$(basename $directory).tar.${tar_extension}.gpg"; then
				existing_encrypted_file+=("${output_path}$(basename $directory).tar.${tar_extension}.gpg")
			fi
		done


		if ! [ ${#existing_encrypted_file[@]} -eq 0 ]; then
			for i in "${existing_encrypted_file[@]}"; do 
				echo "$i"
			done

			echo "This will overwrite file(s) listed above. Continue?"
			select yn in "Yes" "No"; do			
				case $yn in
					Yes ) 
						for directory in $filepath/*/; do
							rm "${output_path}$(basename $directory).tar.${tar_extension}.gpg"
						done
						break;;
					No ) 
						echo "Will not overwrite existing files. Exiting."
						exit;;
				esac
			done
		fi

		# File path exists, do stuff
		if ! [ -z "${a}" ]; then
			# Encrypt all directory within the target path
			for directory in ${filepath}*/; do
				# Tar, encrypt and remove original tar files
				tar $tar_flag "${output_path}$(basename $directory).tar.${tar_extension}" $directory && \
					gpg -r $u --encrypt "${output_path}$(basename $directory).tar.${tar_extension}" && \
					rm "${output_path}$(basename $directory).tar.${tar_extension}"

				# Display feedback 
				if [ $? -eq 0 ]; then
					echo -e "\e[32mSucess! Output: ${output_path}$(basename $directory).tar.${tar_extension}\e[0m"
					# if `-d` flag is present
					if ! [ -z "${d}" ]; then
						echo -e "\e[33mDestructive flag detected."	
						rm -Rf $directory
						echo -e "Original directory removed: $directory\e[0m"
					fi
				else
					echo -e "\e[31mFailed to encrypt. Exiting."
					exit 1
				fi
			done
		else
			# Encrypt target directory only
			filepath=${filepath%/}
			if [ -d "$filepath" ]; then
				echo "Encrypting: $filepath"
				tar $tar_flag "${output_path}.tar.${tar_extension}" $filepath && \
					gpg -r $u --encrypt "${output_path}.tar.${tar_extension}" && \
					rm "${output_path}.tar.${tar_extension}"
				if ! [ -z "${d}" ]; then
					echo -e "\e[33mDestructive flag detected."	
					rm -Rf $filepath
					echo -e "Original directory removed: $filepath\e[0m"
				fi
			fi
		fi
	else 
		# Path doesn't exists, return error
		echo "$0 is not a directory or does not exists."
		exit 1
	fi

# DECRYPT Mode
elif [ D="DECRYPT" ]; then
	# Decrypt code
	echo "Decrypt mode"
	# for d in $filepath/*/; do
	# 	Delete encrypted files if exists
	# 	if test -e "./$filepath/$(basename $directory).tar.gz.gpg"; then
	# 		rm "./$filepath/$(basename $directory).tar.gz.gpg"
	# 	fi

	# 	  Tar and encrypt (remove the original tar afterwards)
	# 	tar -czvf "./$filepath/$(basename $directory).tar.gz" $directory && gpg -r $recipient --encrypt "./$filepath/$(basename $directory).tar.gz" && rm "./$filepath/$(basename $directory).tar.gz"	
	# done
fi

