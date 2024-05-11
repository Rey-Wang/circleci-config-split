mapping=".* .circleci/pants_config.yml
            scripts/.* .circleci/pants_config.yml,.circleci/web_config.yml
            src/web/.* .circleci/web_config.yml"

while IFS= read -r line; do
    # 获取每一行的第一个项
    item=$(echo "$line" | awk '{print $1}')
    # 将项添加到数组中
    items_array+=("$item")
done <<< "$mapping"

echo "${items_array[@]}"