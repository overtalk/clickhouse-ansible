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



## 基础测试
- 查看集群信息
```bash
select * from system.clusters;
```

- 集群测试
```sql
-- 在每个节点上都建表
CREATE TABLE test\
(\
    dt Date,\
    path String \
)ENGINE = ReplicatedMergeTree('/clickhouse/tables/{shard}/test','{replica}',dt, dt, 8192);


-- 在任意一个节点上建总表
CREATE TABLE test_all AS test ENGINE = Distributed(clickhouse_cluster, default, test, rand());

-- 在任意一个节点上插入数据
insert into test_all values('2019-07-10','path10')
insert into test_all values('2019-07-11','path11')
insert into test_all values('2019-07-12','path12')
insert into test_all values('2019-07-13','path13')
insert into test_all values('2019-07-14','path14')
insert into test_all values('2019-07-15','path15')
insert into test_all values('2019-07-16','path16')
insert into test_all values('2019-07-17','path17')
insert into test_all values('2019-07-18','path18')
insert into test_all values('2019-07-19','path19')
insert into test_all values('2019-07-20','path20')
insert into test_all values('2019-07-21','path21')
insert into test_all values('2019-07-22','path22')
insert into test_all values('2019-07-23','path23')
insert into test_all values('2019-07-24','path24')
insert into test_all values('2019-07-25','path25')
insert into test_all values('2019-07-26','path26')
insert into test_all values('2019-07-27','path27')
insert into test_all values('2019-07-28','path28')
insert into test_all values('2019-07-29','path29')

-- 在任意一个节点上查询数据
select * from test_all

-- 在每个节点上查询数据
select * from test
```