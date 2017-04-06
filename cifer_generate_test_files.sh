#!/usr/bin/env bash

# Test folder structure
# ===========================
# - test
#   - source_folder
#     - single_folder
#     - multiple_folders
#     - destructive
#     - bz2
#     - ignore_existing
#   - encrypted_output_folder
#   - decrypted_output_folder
# ===========================

# Generate test files
mkdir -p ./test/source_folder

# Single
mkdir -p \
    ./test/source_folder/single_folder/test_1/ \
    ./test/source_folder/single_folder/test_2/ \
    ./test/source_folder/single_folder/test_3/ \
    ./test/source_folder/single_folder/test_4/
printf "\nGenerating test data for 'single_folder'\n"
echo "Fusce sed velit metus. Vestibulum convallis arcu pharetra nunc aliquam, nec sagittis justo interdum. Quisque nec lobortis magna. Proin a tellus ac nisl ullamcorper euismod nec eu nulla."  | tee -a \
    ./test/source_folder/single_folder/test_1/fusce.txt \
    ./test/source_folder/single_folder/test_1/fusce1.txt \
    ./test/source_folder/single_folder/test_1/fusce2.txt \
    ./test/source_folder/single_folder/test_2/fusce.txt \
    ./test/source_folder/single_folder/test_2/fusce1.txt \
    ./test/source_folder/single_folder/test_2/fusce2.txt \
    ./test/source_folder/single_folder/test_3/fusce.txt \
    ./test/source_folder/single_folder/test_3/fusce1.txt \
    ./test/source_folder/single_folder/test_3/fusce2.txt \
    ./test/source_folder/single_folder/test_4/fusce.txt \
    ./test/source_folder/single_folder/test_4/fusce1.txt \
    ./test/source_folder/single_folder/test_4/fusce2.txt \

# Multiple
mkdir -p \
    ./test/source_folder/multiple_folders/test_1/ \
    ./test/source_folder/multiple_folders/test_2/ \
    ./test/source_folder/multiple_folders/test_3/ \
    ./test/source_folder/multiple_folders/test_4/
printf "\nGenerating test data for 'multiple_folders'\n"
echo "Fusce sed velit metus. Vestibulum convallis arcu pharetra nunc aliquam, nec sagittis justo interdum. Quisque nec lobortis magna. Proin a tellus ac nisl ullamcorper euismod nec eu nulla."  | tee -a \
    ./test/source_folder/multiple_folders/test_1/fusce.txt \
    ./test/source_folder/multiple_folders/test_1/fusce1.txt \
    ./test/source_folder/multiple_folders/test_1/fusce2.txt \
    ./test/source_folder/multiple_folders/test_2/fusce.txt \
    ./test/source_folder/multiple_folders/test_2/fusce1.txt \
    ./test/source_folder/multiple_folders/test_2/fusce2.txt \
    ./test/source_folder/multiple_folders/test_3/fusce.txt \
    ./test/source_folder/multiple_folders/test_3/fusce1.txt \
    ./test/source_folder/multiple_folders/test_3/fusce2.txt \
    ./test/source_folder/multiple_folders/test_4/fusce.txt \
    ./test/source_folder/multiple_folders/test_4/fusce1.txt \
    ./test/source_folder/multiple_folders/test_4/fusce2.txt \

# Destructive
mkdir -p \
    ./test/source_folder/destructive/test_1/ \
    ./test/source_folder/destructive/test_2/ \
    ./test/source_folder/destructive/test_3/ \
    ./test/source_folder/destructive/test_4/
printf "\nGenerating test data for 'destructive'\n"
echo "Fusce sed velit metus. Vestibulum convallis arcu pharetra nunc aliquam, nec sagittis justo interdum. Quisque nec lobortis magna. Proin a tellus ac nisl ullamcorper euismod nec eu nulla."  | tee -a \
    ./test/source_folder/destructive/test_1/fusce.txt \
    ./test/source_folder/destructive/test_1/fusce1.txt \
    ./test/source_folder/destructive/test_1/fusce2.txt \
    ./test/source_folder/destructive/test_2/fusce.txt \
    ./test/source_folder/destructive/test_2/fusce1.txt \
    ./test/source_folder/destructive/test_2/fusce2.txt \
    ./test/source_folder/destructive/test_3/fusce.txt \
    ./test/source_folder/destructive/test_3/fusce1.txt \
    ./test/source_folder/destructive/test_3/fusce2.txt \
    ./test/source_folder/destructive/test_4/fusce.txt \
    ./test/source_folder/destructive/test_4/fusce1.txt \
    ./test/source_folder/destructive/test_4/fusce2.txt \

# Tar archive mode: bz2
mkdir -p \
    ./test/source_folder/bz2/test_1/ \
    ./test/source_folder/bz2/test_2/ \
    ./test/source_folder/bz2/test_3/ \
    ./test/source_folder/bz2/test_4/
printf "\nGenerating test data for 'bz2'\n"
echo "Fusce sed velit metus. Vestibulum convallis arcu pharetra nunc aliquam, nec sagittis justo interdum. Quisque nec lobortis magna. Proin a tellus ac nisl ullamcorper euismod nec eu nulla."  | tee -a \
    ./test/source_folder/bz2/test_1/fusce.txt \
    ./test/source_folder/bz2/test_1/fusce1.txt \
    ./test/source_folder/bz2/test_1/fusce2.txt \
    ./test/source_folder/bz2/test_2/fusce.txt \
    ./test/source_folder/bz2/test_2/fusce1.txt \
    ./test/source_folder/bz2/test_2/fusce2.txt \
    ./test/source_folder/bz2/test_3/fusce.txt \
    ./test/source_folder/bz2/test_3/fusce1.txt \
    ./test/source_folder/bz2/test_3/fusce2.txt \
    ./test/source_folder/bz2/test_4/fusce.txt \
    ./test/source_folder/bz2/test_4/fusce1.txt \
    ./test/source_folder/bz2/test_4/fusce2.txt \

# Ignore existing
mkdir -p \
    ./test/source_folder/ignore_existing/test_1/ \
    ./test/source_folder/ignore_existing/test_2/ \
    ./test/source_folder/ignore_existing/test_3/ \
    ./test/source_folder/ignore_existing/test_4/
printf "\nGenerating test data for 'ignore_existing'\n"
echo "Fusce sed velit metus. Vestibulum convallis arcu pharetra nunc aliquam, nec sagittis justo interdum. Quisque nec lobortis magna. Proin a tellus ac nisl ullamcorper euismod nec eu nulla."  | tee -a \
    ./test/source_folder/ignore_existing/test_1/fusce.txt \
    ./test/source_folder/ignore_existing/test_1/fusce1.txt \
    ./test/source_folder/ignore_existing/test_1/fusce2.txt \
    ./test/source_folder/ignore_existing/test_2/fusce.txt \
    ./test/source_folder/ignore_existing/test_2/fusce1.txt \
    ./test/source_folder/ignore_existing/test_2/fusce2.txt \
    ./test/source_folder/ignore_existing/test_3/fusce.txt \
    ./test/source_folder/ignore_existing/test_3/fusce1.txt \
    ./test/source_folder/ignore_existing/test_3/fusce2.txt \
    ./test/source_folder/ignore_existing/test_4/fusce.txt \
    ./test/source_folder/ignore_existing/test_4/fusce1.txt \
    ./test/source_folder/ignore_existing/test_4/fusce2.txt \

# Clear the content of the output folders:
if [ "$(ls -A ./test/encrypted_output_folder/)" ]; then
     rm -Rf ./test/encrypted_output_folder
fi

if [ "$(ls -A ./test/decrypted_output_folder/)" ]; then
     rm -Rf ./test/decrypted_output_folder
fi

mkdir -p ./test/encrypted_output_folder
mkdir -p ./test/decrypted_output_folder

