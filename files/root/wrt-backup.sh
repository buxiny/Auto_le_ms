#!/bin/bash

# 备份本地all
rm -rf /www/backup/*

#tar -czvf /www/backup/wrt-all-$(date +%Y%m%d%H%M).tar.gz \

7z a -mhe -spf /www/backup/wrt-all-$(date +%Y%m%d%H%M).7z \
-p"!NUYkP36EdQw^" \
'-xr!adlist' \
'-xr!anti-ad-domains.txt' \
/root/*.sh \
/etc/AdGuardHome.yaml \
/etc/dnsmasq.conf \
/etc/hosts \
/etc/config/AdGuardHome \
/etc/config/dhcp \
/etc/config/dropbear \
/etc/config/filebrowser \
/etc/config/firewall \
/etc/config/keepalived \
/etc/config/mosdns \
/etc/config/passwall \
/etc/config/shadowsocksr \
/etc/config/network \
/etc/config/upnpd \
/etc/config/zerotier \
/root/.ssh \
/root/cloudflarespeedtest \
/etc/ssrplus \
/etc/keepalived/keepalived.conf \
/etc/mosdns/ \
/usr/bin/7z \
/www/openwrt \
/var/spool/cron/crontabs/root \
/usr/share/passwall/rules/direct_ip \
/usr/share/passwall/rules/direct_host

# 7z x archives.7z -spf  解压到原路径

# Cdnspeedtest
cd /root/cloudflarespeedtest/
./cfst_hosts.sh
