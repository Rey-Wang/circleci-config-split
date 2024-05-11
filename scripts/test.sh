#!/bin/bash

# 原始的 mapping 字符串
mapping=".* .circleci/pants_config.yml
            scripts/.* .circleci/pants_config.yml,.circleci/web_config.yml
            src/web/.* .circleci/web_config.yml"

path_regex_list=()

while IFS= read -r line; do
    item=$(echo "$line" | awk '{print $1}')
    path_regex_list+=("$item")
done <<< "$mapping"

rewritten_regex=""
for ((i=1; i<${#path_regex_list[@]}; i++))
do
  echo "${path_regex_list[i]}"
  rewritten_regex+="(?!${path_regex_list[i]})"
done

rewritten_regex+="${path_regex_list[0]}"

echo $rewritten_regex

mapping=$(awk -v change="$rewritten_regex" 'NR==1 {$1 = change} 1' FS=" " OFS=" " <<< "$mapping")

echo "#########################################"
echo "$mapping"
echo "#########################################"

#  test change scripts