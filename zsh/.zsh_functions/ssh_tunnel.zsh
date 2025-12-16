# 文件: ~/.zsh_functions/ssh_tunnel.zsh

# 函数: 建立 SSH 端口转发
# 参数1: 本地端口号 (例如: 6007)
# 参数2: 远程主机名 (例如: yq80)
# 参数3: 远程端口号 (例如: 6006)
function ssh_tunnel() {
  # 检查是否提供了所有必需的参数
  if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "用法: ssh_tunnel <本地端口> <远程主机名> <远程端口>"
    echo "示例: ssh_tunnel 6007 yq80 6006"
    echo " (表示将 yq80 上的 6006 端口转发到本地的 6007 端口)"
    return 1
  fi

  # 将参数赋值给变量
  local local_port="$1"
  local remote_host="$2"
  local remote_port="$3"

  echo "正在建立 SSH 隧道..."
  echo "  - 远程主机: ${remote_host}"
  echo "  - 远程端口: ${remote_port}"
  echo "  - 本地端口: ${local_port}"
  echo "按下 Ctrl+C 即可关闭隧道。"

  # 执行 SSH 端口转发命令
  # 格式: ssh -N -L 本地端口:127.0.0.1:远程端口 远程主机
  ssh -N -L "${local_port}:127.0.0.1:${remote_port}" "${remote_host}"

  echo "SSH 隧道已关闭。"
}
