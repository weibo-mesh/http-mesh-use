# http-mesh-use

本实例将演示如何不修改一行代码的情况下，接入 Weibo-Mesh。

# 本项目模块简述

本项目模拟一个 weibo_ug 业务依赖一个 weibo_platform 提供服务的场景。
以往 weibo_ug 团队通过 HTTP 的方式调用着 weibo_platform 团队提供的一个服务（http://i.http-mesh-test.weibo.com/），
现在我们通过在服务提供方和调用方两端分别加上我们的 WeiboMesh，实现去除 四七层 转发，通过 ServiceMesh 技术来处理服务依赖关系的效果。

以往传统的 HTTP 服务提供方式可能类似 `docker-compose/regular-ngx-python-server.yaml` 所演示的那样，一个 python、Java 等的
Web 服务，前端有一个 OpenResty / Nginx 作为反向代理。现在我们使用类似 `docker-compose/http-mesh-server.yaml` 所演示的，将 python
等的 Web 服务放到 WeiboMesh 之后，导出 Motan2 协议的 RPC 服务接入到 WeiboMesh 集群中。

以往传统的 HTTP 调用，我们通过在 WeiboMesh 的 Client 端提供对 HTTP 服务的 Proxy 功能，将 HTTP 的调用通过 WeiboMesh 接入并转发。使用
类似 `docker-compose/http-mesh-client.yaml` 所演示的。

原来的 `php http-client/req-http.php` 调用，加上 WeiboMesh 在 9983 端口提供的 HTTP Proxy 服务，将 HTTP 出口流量交给 
WeiboMesh `http_proxy="127.0.0.1:9983" php http-client/req-http.php`

在这里将本项目各部分注释如下：

```bash
.
├── README-zh.md
├── README.md
├── docker-compose                          # docker-compose 目录
│   ├── http-mesh-client.yaml
│   ├── http-mesh-server.yaml
│   └── regular-ngx-python-server.yaml
├── http-client                             # Client 相关
│   ├── mesh-run-path                       # client 端 WeiboMesh 运行路径，主要存放 WeiboMesh 运行时日志等
│   └── req-http.php                        # 模拟一个依赖其他 HTTP Server（比如 http://i.http-mesh-test.weibo.com/） 的 PHP 业务方
├── http-server                             # Server 相关
│   ├── html                                # Server HTTP 服务的 WWW ROOT
│   ├── http-server.sh
│   ├── mesh-run-path
│   ├── ngx.d
│   └── proxy.go
├── mesh-confs                              # WeiboMesh 相关配置
│   ├── applications
│   ├── basic.yaml
│   ├── http
│   ├── pools
│   └── services
└── run.sh                                  # 基于 docker-compose 的启动脚本
```