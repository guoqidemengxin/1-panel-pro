#!/bin/bash

# 定义安装函数
install_supervisor() { echo -e "\033[34m正在安装Supervisor...\033[0m"; sudo apt-get install supervisor -y; }
install_clamav() { echo -e "\033[34m正在安装ClamAV...\033[0m"; sudo apt install clamav clamav-daemon -y; sudo systemctl start clamav-daemon; sudo systemctl start clamav-freshclam.service; sudo systemctl enable clamav-daemon; sudo systemctl enable clamav-freshclam.service; }
install_pureftpd() { echo -e "\033[34m正在安装Pure-FTPd...\033[0m"; sudo apt-get install pure-ftpd -y; echo "/etc/pure-ftpd/pureftpd.pdb" > /etc/pure-ftpd/conf/PureDB; echo "yes" > /etc/pure-ftpd/conf/VerboseLog; echo "yes" > /etc/pure-ftpd/conf/NoAnonymous; echo "39000 40000" > /etc/pure-ftpd/conf/PassivePortRange; ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/50puredb; sudo systemctl start pure-ftpd.service; }
install_fail2ban() { echo -e "\033[34m正在安装Fail2ban...\033[0m"; sudo apt-get install fail2ban -y; sudo apt-get install rsyslog -y; sudo systemctl start fail2ban; sudo systemctl enable fail2ban; }

# 主程序：下载并运行 quick_start.sh 脚本
echo -e "\033[34m开始部署面板...\033[0m"
if ! curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh; then
    echo -e "\033[31m下载面板失败，请检查网络连接\033[0m"
    exit 1
fi
if ! sudo bash quick_start.sh; then
    echo -e "\033[31m安装面板失败\033[0m"
    exit 1
fi

# 解析参数并执行联动程序包安装
INSTALL_ALL=true
for arg in "$@"; do
    case $arg in
        -all)
            INSTALL_ALL=true
            ;;
        -none)
            INSTALL_ALL=false
            ;;
        supervisor|clamav|pureftpd|fail2ban)
            INSTALL_ALL=false
            eval "install_$arg"
            ;;
        *)
            echo "无效的参数: $arg"
            ;;
    esac
done

if [ "$INSTALL_ALL" = true ]; then
    install_supervisor
    install_clamav
    install_pureftpd
    install_fail2ban
fi

# 打印联动程序包安装完毕
echo -e "\033[34m所有联动程序包安装完毕。\033[0m"

# 打印用户登录信息
echo -e "\033[34m正在打印用户登录信息...\033[0m"
if USER_INFO=$(1pctl user-info 2>/dev/null); then
    echo -e "\033[34m用户登录信息如下：\033[0m"
    echo "$USER_INFO"
else
    echo -e "\033[31m获取用户登录信息失败，请手动执行 '1pctl user-info' 命令。\033[0m"
fi

# 提醒用户保存登录信息，使用红色
echo -e "\033[31m\033[1m*** 请务必保存好您的用户登录信息！ ***\033[0m"

# 打印操作完成
echo -e "\033[34m操作完成。\033[0m"
