# ClickHouse 集群部署

## 组件介绍
- clickhouse-server ClickHouse的Server端，也就是CK数据库的核心程序，相当于mysqld命令，提供数据库服务端
- clickhouse-client ClickHouse自带的client端，提供命令行的交互操作方式，来连接服务端，相当于mysql命令

## 配置文件解析
- ClickHouse有几核心的配置文件：
    - config.xml 端口配置、本地机器名配置、内存设置等
    - metrika.xml 集群配置、ZK配置、分片配置等
    - users.xml 权限、配额设置


## rpm启动方式
- 官方没有提供rpm包，但是[Altinity公司](https://packagecloud.io/Altinity/clickhouse)提供了



- 查看集群信息
```bash
select * from system.clusters;
```