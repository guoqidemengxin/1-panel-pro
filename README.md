# 1Panel Pro

#### 介绍
1Panel快速部署脚本
#### 使用场景
1Panel支持与部分软件联动，但需要自己安装，本项目帮您快速部署 :heart_eyes: 
#### 软件架构
支持x86_64、aarch64、armv7l、ppc64le、s390x 支持主流 Linux 发行版本（基于 Debian / RedHat，包括国产操作系统） [（与官方一致）](https://1panel.cn/docs/installation/online_installation/)


#### 主站
| 地区 | 链接|
|---------------|--------------------------------|
| 日本-腾讯云（木空CDN）| https://1panel.xyz0.cn.eu.org/ |
| 中国-江苏-镇江（炎火云）| https://2zuh7.2.996h.cn/       |

 **PS：证书过期，流量超标等请发起Issues** 
#### 可视化安装
| 地区 | 链接|
|---------------|--------------------------------|
| 日本-腾讯云（木空CDN）| https://1panel.xyz0.cn.eu.org/diy |
| 中国-江苏-镇江（炎火云）| https://2zuh7.2.996h.cn/diy      |
 
**PS：证书过期，流量超标等请发起Issues** 
#### 手动安装
1.下载脚本（开源托管平台，镇江，日本）

```
wget -qO 1Panel.sh 下载链接
```

2.添加可执行权限

```
sudo chmod +x 1Panel.sh
```

3.执行脚本

```
./1Panel.sh + 参数 
```
| 安装选项 | 参数 |
|---------------|-------------|
| 不安装supervisor | -supervisor |
| 不安装clamav     | -clamav     |
| 不安装pureftpd   | -pureftpd   |
| 不安装fail2ban   | -fail2ban   |
| 不安装所有联动软件包 | -none       |
| 安装所有联动软件包| -all |
