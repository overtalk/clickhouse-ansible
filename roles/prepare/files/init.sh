#! /bin/bash

function stop_firewall()
{
    echo '==== stop firewall ===='
    systemctl stop firewalld
    systemctl disable firewalld
}

function disable_selinux()
{
    echo '==== disable selinux ===='
    echo '==== working on dir `/etc/selinux/config ` ===='
    # sed -i 's/^SELINUX=/#&/' /etc/selinux/config
    # echo "SELINUX=disabled" >> /etc/selinux/config
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
}

function java()
{
    yum install java-1.8.0-openjdk-devel.x86_64 -y
}

function rpm()
{
    curl -s https://packagecloud.io/install/repositories/Altinity/clickhouse/script.rpm.sh | sudo bash
    # 更新 yum 源
    yum -q makecache -y --disablerepo='*' --enablerepo='Altinity_clickhouse' 
}

stop_firewall
disable_selinux
java
rpm