# 文件: ~/.zsh_functions/ssh_tunnel.zsh

# 函数: 建立 SSH 端口转发
# 参数1: 远程主机名 (例如: yq80)
# 参数2: 远程端口号 (例如: 6006)
function ssh_tunnel() {
  # 检查是否提供了所有必需的参数
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "用法: ssh_tunnel <远程主机名> <远程端口>"
    echo "示例: ssh_tunnel yq80 6006"
    return 1
  fi

  # 将参数赋值给变量
  local remote_host="$1"
  local remote_port="$2"

  # 本地转发端口, 默认和远程一致
  local local_port=$((remote_port))

  echo "正在建立 SSH 隧道..."
  echo "  - 远程主机: ${remote_host}"
  echo "  - 远程端口: ${remote_port}"
  echo "  - 本地端口: ${local_port}"
  echo "按下 Ctrl+C 即可关闭隧道。"

  # 执行 SSH 端口转发命令
  ssh -N -L "${local_port}:127.0.0.1:${remote_port}" "${remote_host}"

  echo "SSH 隧道已关闭。"
}
