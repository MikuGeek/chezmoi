#!/bin/bash

# 要检查的工具列表
tools="fish (modern shell)
eza (modern ls)
fzf (fuzzy finder)
fd (find)
rg (grep)
bat (better cat and less)
zoxide (directory jumper)
atuin (terminal history)
dust (disk usage)
btop (system monitor)
yazi (file manager)
hurl (HTTP client)
starship (commandline prompt)
gh (github cli)
lazydocker (docker UI)
lazygit (git UI)
zellij (terminal multiplexer)
gcc (C compiler)
node (JavaScript runtime)
python3 (Python interpreter)
"

# 初始化变量
installed_list=""
not_installed_list=""

# 使用 Here String 将变量内容重定向为循环的输入
# 这不会为 while 循环创建子 Shell
while read -r line; do
  name=$(echo "$line" | awk '{print $1}')
  if command -v "$name" >/dev/null 2>&1; then
    installed_list="$installed_list$name "
  else
    not_installed_list="$not_installed_list$name "
  fi
done <<<"$tools"

# 在主 Shell 中打印结果，变量值已被保留
echo "✔️Installed:"
echo "${installed_list% }"

echo "❌Not installed:"
echo "${not_installed_list% }"
