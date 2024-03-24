- [免责声明](#免责声明)
- [**MoviePilot 始终坚持**](#moviepilot-始终坚持)
- [MoviePilot Awesome](#moviepilot-awesome)
  - [Star History](#star-history)
  - [Thanks](#thanks)
- [部署实例](#部署实例)
  - [docker-cli 实例](#docker-cli-实例)
  - [docker-compose 实例](#docker-compose-实例)
  - [UnRaid 配置模板](#unraid-配置模板)
- [自建OCR教程](#自建ocr教程)
  - [1. 搭建OCR服务](#1-搭建ocr服务)
  - [2. 测试服务是否正常](#2-测试服务是否正常)
  - [3. MoviePilot设置](#3-moviepilot设置)
- [MoviePilot 图标地址](#moviepilot-图标地址)
- [Playwright 离线安装（通过Docker）](#playwright-离线安装通过docker)

# 免责声明

- **请勿**在任何国内平台宣传 MoviePilot，MoviePilot 仅用于学习交流使用。
- **请勿**将 MoviePilot 用于商业用途。
- **请勿**将 MoviePilot 制作为视频内容，于境内视频网站(版权利益方)传播。
- **请勿**将 MoviePilot 用于任何违反法律法规的行为。
- **请勿**将本仓库教程在国内任何平台宣传，本仓库**只**作为官方仓库部署教程补充。

# **MoviePilot 始终坚持**

- 人性化的设置方法
- 简洁明了的UI界面
- 风驰电掣的运行速度

# MoviePilot Awesome

- [MoviePilot](https://github.com/jxxghp/MoviePilot)：主仓库
- [MoviePilot-Frontend](https://github.com/jxxghp/MoviePilot-Frontend)：MoviePilot前端
- [MoviePilot-Resources](https://github.com/jxxghp/MoviePilot-Resources)：MoviePilot资源包
- [MoviePilot-OCR](https://github.com/jxxghp/MoviePilot-OCR)：MoviePilot验证码OCR识别
- [Putarku/MoviePilot-Help](https://github.com/Putarku/MoviePilot-Help)：MoviePilot配置及使用过程的中的常见问题
- [DDS-Derek/MoviePilot](https://github.com/DDS-Derek/MoviePilot/tree/docs)：MoviePilot常见问题及其解决办法 & 部分自建功能教程
- [DDS-Derek/wxchat-Docker](https://github.com/DDS-Derek/wxchat-Docker)：MoviePilot微信转发代理
- [developer-wlj/Windows-MoviePilot](https://github.com/developer-wlj/Windows-MoviePilot)：exe方式运行MoviePilot
- [PTLSP/MoviePilot-Wechat-PROXY](https://blog.ptlsp.com/moviepilotwechat)：MoviePilot企业微信推送之新手喂饭教程
- MoviePilot-Plugins：MoviePilot插件市场 `PLUGIN_MARKET=https://github.com/jxxghp/MoviePilot-Plugins,https://github.com/thsrite/MoviePilot-Plugins,https://github.com/honue/MoviePilot-Plugins,https://github.com/dandkong/MoviePilot-Plugins,https://github.com/Aqr-K/MoviePilot-Plugins,https://github.com/AnjoyLi/MoviePilot-Plugins,https://github.com/WithdewHua/MoviePilot-Plugins,https://github.com/HankunYu/MoviePilot-Plugins,https://github.com/baozaodetudou/MoviePilot-Plugins,https://github.com/almus2zhang/MoviePilot-Plugins,https://github.com/Pixel-LH/MoviePilot-Plugins,https://github.com/InfinityPacer/MoviePilot-Plugins,https://github.com/lightolly/MoviePilot-Plugins`
  - https://github.com/jxxghp/MoviePilot-Plugins
  - https://github.com/thsrite/MoviePilot-Plugins
  - https://github.com/honue/MoviePilot-Plugins
  - https://github.com/dandkong/MoviePilot-Plugins
  - https://github.com/Aqr-K/MoviePilot-Plugins
  - https://github.com/AnjoyLi/MoviePilot-Plugins
  - https://github.com/HankunYu/MoviePilot-Plugins
  - https://github.com/WithdewHua/MoviePilot-Plugins
  - https://github.com/baozaodetudou/MoviePilot-Plugins
  - https://github.com/almus2zhang/MoviePilot-Plugins
  - https://github.com/Pixel-LH/MoviePilot-Plugins
  - https://github.com/InfinityPacer/MoviePilot-Plugins
  - https://github.com/lightolly/MoviePilot-Plugins

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=jxxghp/MoviePilot&type=Date)](https://star-history.com/#jxxghp/MoviePilot)

## Thanks

<a href="https://github.com/jxxghp/MoviePilot/graphs/contributors"><img src="https://contrib.rocks/image?repo=jxxghp/MoviePilot"></a>

# 部署实例

## docker-cli 实例

```bash
docker run -itd \
    --name moviepilot \
    --hostname moviepilot \
    -p 3000:3000 \
    -v /media:/media \
    -v /moviepilot/config:/config \
    -v /moviepilot/core:/moviepilot/.cache/ms-playwright \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -e 'NGINX_PORT=3000' \
    -e 'PORT=3001'
    -e 'PUID=0' \
    -e 'PGID=0' \
    -e 'UMASK=000' \
    -e 'TZ=Asia/Shanghai' \
    -e 'PROXY_HOST=' \
    -e 'MOVIEPILOT_AUTO_UPDATE=true' \
    -e 'AUTH_SITE=iyuu' \
    -e 'IYUU_SIGN=' \
    -e 'SUPERUSER=admin' \
    -e 'API_TOKEN=moviepilot' \
    -e 'BIG_MEMORY_MODE=false' \
    -e 'DOH_ENABLE=true' \
    -e 'META_CACHE_EXPIRE=' \
    -e 'GITHUB_TOKEN=' \
    -e 'DEV=false' \
    -e 'DEBUG=false' \
    -e 'AUTO_UPDATE_RESOURCE=true' \
    -e 'TMDB_API_DOMAIN=api.themoviedb.org' \
    -e 'TMDB_IMAGE_DOMAIN=image.tmdb.org' \
    -e 'WALLPAPER=tmdb' \
    -e 'RECOGNIZE_SOURCE=themoviedb' \
    -e 'FANART_ENABLE=true' \
    -e 'SCRAP_SOURCE=themoviedb' \
    -e 'SCRAP_FOLLOW_TMDB=true' \
    -e 'AUTO_DOWNLOAD_USER=all' \
    -e 'OCR_HOST=https://movie-pilot.org' \
    -e 'DOWNLOAD_SUBTITLE=true' \
    -e 'SEARCH_MULTIPLE_NAME=true' \
    -e 'MOVIE_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/{{title}}{% if year %} ({{year}}){% endif %}{% if part %}-{{part}}{% endif %}{% if videoFormat %} - {{videoFormat}}{% endif %}{{fileExt}}' \
    -e 'TV_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/Season {{season}}/{{title}} - {{season_episode}}{% if part %}-{{part}}{% endif %}{% if episode %} - 第 {{episode}} 集{% endif %}{{fileExt}}' \
    -e 'PLUGIN_MARKET=https://github.com/jxxghp/MoviePilot-Plugins' \
    --log-driver "json-file" \
    --log-opt "max-size=5m" \
    --restart always \
    jxxghp/moviepilot:latest
```

## docker-compose 实例

[docker-compose.yml](https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/examples/docker-compose.yml)

```yaml
version: '3.3'

# MoviePilot 地址：https://github.com/jxxghp/MoviePilot

services:

    moviepilot:
        stdin_open: true
        tty: true
        container_name: moviepilot
        hostname: moviepilot
        networks:
            - moviepilot
        ports:
            - target: 3000
              published: 3000
              protocol: tcp
        volumes:
            - '/media:/media'
            - '/moviepilot/config:/config'
            - '/moviepilot/core:/moviepilot/.cache/ms-playwright'
            - '/var/run/docker.sock:/var/run/docker.sock:ro'
        environment:
            # WEB服务端口，默认3000，可自行修改，不能与API服务端口冲突
            - 'NGINX_PORT=3000'
            # API服务端口，默认3001，可自行修改，不能与WEB服务端口冲突
            - 'PORT=3001'
            # 运行程序用户的uid，默认0
            - 'PUID=0'
            # 运行程序用户的gid，默认0
            - 'PGID=0'
            # 掩码权限，默认000，可以考虑设置为022
            - 'UMASK=000'
            # 时区
            - 'TZ=Asia/Shanghai'
            # 重启时自动更新，true/release/dev/false，默认release，需要能正常连接Github 注意：如果出现网络问题可以配置PROXY_HOST
            - 'MOVIEPILOT_AUTO_UPDATE=true'
            # 网络代理，访问themoviedb或者重启更新需要使用代理访问，格式为http(s)://ip:port、socks5://user:pass@host:port
            - 'PROXY_HOST='
            # 认证站点
            - 'AUTH_SITE=iyuu'
            - 'IYUU_SIGN='
            # 超级管理员用户名，默认admin，安装后使用该用户登录后台管理界面，注意：启动一次后再次修改该值不会生效，除非删除数据库文件！
            - 'SUPERUSER=admin'
            # API密钥，默认moviepilot，在媒体服务器Webhook、微信回调等地址配置中需要加上?token=该值，建议修改为复杂字符串
            - 'API_TOKEN=moviepilot'
            # 大内存模式，默认为false，开启后会增加缓存数量，占用更多的内存，但响应速度会更快
            - 'BIG_MEMORY_MODE=false'
            # DNS over HTTPS开关，true/false，默认true，开启后会使用DOH对api.themoviedb.org等域名进行解析，以减少被DNS污染的情况，提升网络连通性
            - 'DOH_ENABLE=true'
            # 元数据识别缓存过期时间（小时），数字型，不配置或者配置为0时使用系统默认（大内存模式为7天，否则为3天），调大该值可减少themoviedb的访问次数
            - 'META_CACHE_EXPIRE='
            # Github token，提高自动更新、插件安装等请求Github Api的限流阈值，格式：ghp_****
            - 'GITHUB_TOKEN='
            # 开发者模式，true/false，默认false，开启后会暂停所有定时任务
            - 'DEV=false'
            # debug模式，开启后会输出debug日志
            - 'DEBUG=false'
            # 启动时自动检测和更新资源包（站点索引及认证等），true/false，默认true，需要能正常连接Github
            - 'AUTO_UPDATE_RESOURCE=true'
            # TMDB API地址，默认api.themoviedb.org，也可配置为api.tmdb.org、tmdb.movie-pilot.org 或其它中转代理服务地址，能连通即可
            - 'TMDB_API_DOMAIN=api.themoviedb.org'
            # TMDB图片地址，默认image.tmdb.org，可配置为其它中转代理以加速TMDB图片显示，如：static-mdb.v.geilijiasu.com
            - 'TMDB_IMAGE_DOMAIN=image.tmdb.org'
            # 登录首页电影海报，tmdb/bing，默认tmdb
            - 'WALLPAPER=tmdb'
            #  媒体信息识别来源，themoviedb/douban，默认themoviedb，使用douban时不支持二级分类
            - 'RECOGNIZE_SOURCE=themoviedb'
            # Fanart开关，true/false，默认true，关闭后刮削的图片类型会大幅减少
            - 'FANART_ENABLE=true'
            # 刮削元数据及图片使用的数据源，themoviedb/douban，默认themoviedb
            - 'SCRAP_SOURCE=themoviedb'
            # 新增已入库媒体是否跟随TMDB信息变化，true/false，默认true，为false时即使TMDB信息变化了也会仍然按历史记录中已入库的信息进行刮削
            - 'SCRAP_FOLLOW_TMDB=true'
            # 远程交互搜索时自动择优下载的用户ID（消息通知渠道的用户ID），多个用户使用,分割，设置为 all 代表全部用户自动择优下载，未设置需要手动选择资源或者回复0才自动择优下载
            - 'AUTO_DOWNLOAD_USER=all'
            # OCR识别服务器地址，格式：http(s)://ip:port，用于识别站点验证码实现自动登录获取Cookie等，不配置默认使用内建服务器https://movie-pilot.org
            - 'OCR_HOST=https://movie-pilot.org'
            # 下载站点字幕，true/false，默认true
            - 'DOWNLOAD_SUBTITLE=true'
            # 搜索时是否使用多个名称搜索，true/false，默认true，开启后会使用多个名称进行搜索，搜索结果会更全面，但会增加搜索时间；关闭时只要其中一个名称搜索到结果或全部名称搜索完毕即停止
            - 'SEARCH_MULTIPLE_NAME=true'
            # 电影重命名格式
            - 'MOVIE_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/{{title}}{% if year %} ({{year}}){% endif %}{% if part %}-{{part}}{% endif %}{% if videoFormat %} - {{videoFormat}}{% endif %}{{fileExt}}'
            # 电视剧重命名格式
            - 'TV_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/Season {{season}}/{{title}} - {{season_episode}}{% if part %}-{{part}}{% endif %}{% if episode %} - 第 {{episode}} 集{% endif %}{{fileExt}}'
            # 插件市场仓库地址，仅支持Github仓库main分支，多个地址使用,分隔
            - 'PLUGIN_MARKET=https://github.com/jxxghp/MoviePilot-Plugins'
        logging:
            driver: json-file
            options:
                max-size: 5m
        restart: always
        image: jxxghp/moviepilot:latest

networks:
  moviepilot:
    name: moviepilot
```

## UnRaid 配置模板

[Unraid-MoviePilot.xml](https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/examples/Unraid-MoviePilot.xml) by 群友支持

1. <img src="https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/img/1.png" alt="步骤01" width="600">
打开Unraid的Web控制页面，右上角找到“终端”并打开

2. <img src="https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/img/2.png" alt="步骤02" width="600">
复制如下一键命令，粘贴进“终端”并回车执行

**Github源**
```bash
curl -sL https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/examples/Unraid-MoviePilot.xml -o /boot/config/plugins/dockerMan/templates-user/MoviePilot.xml
```
**国内加速源**
```bash
curl -sL https://ghproxy.com/https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/examples/Unraid-MoviePilot.xml -o /boot/config/plugins/dockerMan/templates-user/MoviePilot.xml
```

3. <img src="https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/img/3.png" alt="步骤03" width="600">
打开Docker页面，下方找到添加容器并点击

4. <img src="https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/img/4.png" alt="步骤04" width="600">
在页面中找到“选择一个模板”，点开并选择“MoviePilot”

5. <img src="https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/img/5.png" alt="步骤05" width="600">
依照MoviePilot项目中作者的说明进行修改并填写

# 自建OCR教程

## 1. 搭建OCR服务

**docker-cli**

```bash
docker run -itd \
    --name moviepilot-ocr \
    --hostname moviepilot-ocr \
    -p 9899:9899 \
    --log-driver "json-file" \
    --log-opt "max-size=5m" \
    --restart always \
    jxxghp/moviepilot-ocr:latest
```

**docker-compose**

```yaml
version: '3.3'
services:
    moviepilot-ocr:
        container_name: moviepilot-ocr
        hostname: moviepilot-ocr
        ports:
            - '9899:9899'
        logging:
            driver:
                - json-file
            options:
                max-size: 5m
        restart: always
        stdin_open: true
        tty: true
        image: 'jxxghp/moviepilot-ocr:latest'
```

## 2. 测试服务是否正常

如图使用[此](https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/ocr_test.exe)程序进行测试

地址为`http(s)://ip:port`的形式

![](https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/img/ocr_test.png)

## 3. MoviePilot设置

启动时添加以下环境变量
```bash
-e OCR_HOST=http(s)://ip:port
```

# MoviePilot 图标地址

[https://raw.githubusercontent.com/jxxghp/MoviePilot-Frontend/main/public/logo.png](https://raw.githubusercontent.com/jxxghp/MoviePilot-Frontend/main/public/logo.png)

![](https://raw.githubusercontent.com/jxxghp/MoviePilot-Frontend/main/public/logo.png)

# Playwright 离线安装（通过Docker）

```bash
docker run -d \
    --name=playwright-downloader \
    -e PUID=1000 \
    -e PGID=1000 \
    -e UMASK=022 \
    -v /your/moviepilot/dir:/downloads \
    ddsderek/moviepilot:playwright
```

```yaml
version: '3.3'
services:
    moviepilot:
        container_name: playwright-downloader
        environment:
            - PUID=1000
            - PGID=1000
            - UMASK=022
        volumes:
            - '/your/moviepilot/dir:/downloads'
        stdin_open: true
        tty: true
        image: 'ddsderek/moviepilot:playwright'
```

- `-e PUID` 与MP一致
- `-e PGID` 与MP一致
- `-e UMASK` 与MP一致
- `-v /downloads` 映射到主机的目录与MP的`/moviepilot`或者`/moviepilot/.cache/ms-playwright`映射到主机的目录一致

运行完成后即可删除容器和镜像
