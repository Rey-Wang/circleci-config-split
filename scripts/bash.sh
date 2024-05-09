#!/bin/bash

# 多行文本输入
input_text="first_part1 second_part1
first_part2 second_part2
first_part3 second_part3"

echo "$input_text" | awk '{print $1 " config_" $1 " " $2}' > output_file.txt

echo "输出到 output_file.txt 文件中。"