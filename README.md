# R52

A Rails 5.2 Demo generate with scaffold

## 工具管理

/bz/tool/upload


## 签到

/jz


## 监控

/sy


## 功能

- html多页签

- weui page

- 定时任务

  with rufus-scheduler

- 自定义配置


- 文件上传
  
    配置阿里云及本地文件:

    aliyun_access_id: "xxx"

    aliyun_access_key:  "xxx"

    aliyun_bucket: "bucket_name"

    aliyun_internal: false

    aliyun_area: "cn-shanghai"

    aliyun_host: "https://oss-cn-shanghai.aliyuncs.com"

- SMTP邮件及示例发送模板
    
    配置SMTP邮件(使用ssl):

    address: "mail.126.com" 

    port:  "465" 

    user_name:  "your_name@126.com" 

    password:  "your_password"

    domain:  "126.com" 




## Docker打包

```
docker login docker.io

docker build -t cheenwe/r52 .

docker push cheenwe/r52:0.1 

```

- 其他

```
# 宿主机ip: 192.168.1.11
 
docker run -itd --name R52 -p 3210:3210  cheenwe/r52:0.1
# 防火墙放开 3210 端口
firewall-cmd --add-port=3210/tcp --permanent
 
# 问题：发现访问：192.168.1.11:3210 访问不通，关闭firewall后，又可以访问通了
 

# 解决方案，把docker0网卡添加到trusted域
firewall-cmd --permanent --zone=trusted --change-interface=docker0
# 重启加载配置
firewall-cmd --reload
```

