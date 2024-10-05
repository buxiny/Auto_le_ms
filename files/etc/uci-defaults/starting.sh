#!/bin/bash

# 新建backup文件夹
mkdir -p /www/backup
chmod 777 /www/backup

# 覆盖keepalived.conf设置
cat << "EOF" > /etc/keepalived/keepalived.conf
! Configuration File for keepalived

global_defs {
   router_id buhome         ## 路由id：当前安装keepalived的节点主机标识符，保证全局唯一
   vrrp_version 2
}

vrrp_instance VI_1 {
    state MASTER            ## 主节点为MASTER，备份节点为BACKUP
    interface eth0          ## 绑定虚拟IP的网络接口（网卡），与本机IP地址所在的网络接口相同
    virtual_router_id 51    ## 虚拟路由ID号（主备节点一定要相同）
    priority 120            ## 优先级配置（0-254的值）
    advert_int 0.5          ## 组播信息发送间隔，俩个节点必须配置一致，默认1s
    virtual_ipaddress {
        192.168.10.10/24    ## 虚拟ipv4，可以指定多个
    }
    virtual_ipaddress_excluded {
        fe80::f10/64  ## 虚拟ipv6，可以指定多个
    }
}

# service keepalived start
# service keepalived stop
# service keepalived restart
# service keepalived reload           #重新加载
# service keepalived force-reload     #再重新加载
# /usr/sbin/keepalived
EOF

# 重启keepalived
service keepalived restart

sleep 5

opkg install http://192.168.10.6/openwrt/cdnspeedtest_2.2.5-1_x86_64.ipk

# 删除 starting.sh
rm -rf /etc/uci-defaults/starting.sh

