#!/bin/bash

tmp_dir=""
tmp_flag=""
input_file=""
output_file=""

while getopts ":i:o:t:" opt; do
    case $opt in
        i) input_file="$OPTARG"
        ;;
        o) output_file="$OPTARG"
        ;;
        t) tmp_dir="$OPTARG"
        ;;
        \?) echo " * usage: -i input_file -o output_file [-t tmp_file_for_sorting]" >&2
            exit 1
        ;;
    esac
done

if [ ! -n "$input_file" ]; then
    echo " * usage: -i input_file -o output_file [-t tmp_file_for_sorting]" >&2
    exit 1
fi


if [ ! -n "$output_file" ]; then
    echo " * usage: -i input_file -o output_file [-t tmp_file_for_sorting]" >&2
    exit 1
fi

if [ -n "$tmp_dir" ]; then
    tmp_flag="-T "$tmp_dir
fi

time cut -f 1,3 -s $input_file | sort $tmp_flag | uniq | cut -f 2 | sort $tmp_flag | uniq -c | sort -n -r $tmp_flag > $output_file


