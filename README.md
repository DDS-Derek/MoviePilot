- [免责声明](#免责声明)
- [**MoviePilot 始终坚持**](#moviepilot-始终坚持)
- [MoviePilot Awesome](#moviepilot-awesome)
  - [Star History](#star-history)
  - [Thanks](#thanks)
- [部署实例](#部署实例)
  - [docker-cli 实例](#docker-cli-实例)
  - [docker-compose 实例](#docker-compose-实例)
  - [UnRaid 配置模板](#unraid-配置模板)
  - [Win Docker Desktop 实例](#win-docker-desktop-实例)
- [目录挂载解释](#目录挂载解释)
  - [实例一](#实例一)
  - [实例二 by 群友支持](#实例二-by-群友支持)
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
- MoviePilot-Plugins：MoviePilot插件市场 `PLUGIN_MARKET=https://github.com/jxxghp/MoviePilot-Plugins,https://github.com/thsrite/MoviePilot-Plugins,https://github.com/honue/MoviePilot-Plugins,https://github.com/dandkong/MoviePilot-Plugins,https://github.com/Aqr-K/MoviePilot-Plugins,https://github.com/AnjoyLi/MoviePilot-Plugins,https://github.com/WithdewHua/MoviePilot-Plugins,https://github.com/HankunYu/MoviePilot-Plugins,https://github.com/baozaodetudou/MoviePilot-Plugins,https://github.com/almus2zhang/MoviePilot-Plugins`
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
    -v /media:/media \
    -v /moviepilot/config:/config \
    -v /moviepilot/core:/moviepilot/.cache/ms-playwright \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -e 'PUID=1000' \
    -e 'PGID=1000' \
    -e 'UMASK=022' \
    -e 'TZ=Asia/Shanghai' \
    -e 'MOVIEPILOT_AUTO_UPDATE=release' \
    -e 'AUTO_UPDATE_RESOURCE=true' \
    -e 'NGINX_PORT=3000' \
    -e 'SUPERUSER=admin' \
    -e 'WALLPAPER=tmdb' \
    -e 'API_TOKEN=moviepilot' \
    -e 'PROXY_HOST=' \
    -e 'TMDB_API_DOMAIN=api.themoviedb.org' \
    -e 'DOWNLOAD_PATH=/media/downloads' \
    -e 'DOWNLOAD_MOVIE_PATH=/media/downloads/movies' \
    -e 'DOWNLOAD_TV_PATH=/media/downloads/tv' \
    -e 'DOWNLOAD_ANIME_PATH=/media/downloads/anime' \
    -e 'DOWNLOAD_SUBTITLE=false' \
    -e 'DOWNLOAD_CATEGORY=false' \
    -e 'DOWNLOADER_MONITOR=true' \
    -e 'SUBSCRIBE_MODE=spider' \
    -e 'SUBSCRIBE_RSS_INTERVAL=30' \
    -e 'SCRAP_METADATA=true' \
    -e 'SCRAP_FOLLOW_TMDB=true' \
    -e 'TORRENT_TAG=MOVIEPILOT' \
    -e 'LIBRARY_PATH=/media' \
    -e 'LIBRARY_MOVIE_NAME=movies' \
    -e 'LIBRARY_TV_NAME=tv' \
    -e 'LIBRARY_ANIME_NAME=anime' \
    -e 'LIBRARY_CATEGORY=false' \
    -e 'TRANSFER_TYPE=link' \
    -e 'OVERWRITE_MODE=size' \
    -e 'COOKIECLOUD_HOST=http://cookiecloud:8088/cookie' \
    -e 'COOKIECLOUD_KEY=xxxxxxxxxxxxxxxxx' \
    -e 'COOKIECLOUD_PASSWORD=xxxxxxxxxxxxxxxx' \
    -e 'COOKIECLOUD_INTERVAL=20' \
    -e 'SUBSCRIBE_SEARCH=false' \
    -e 'USER_AGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36' \
    -e 'AUTO_DOWNLOAD_USER=' \
    -e 'FANART_ENABLE=true' \
    -e 'PLUGIN_MARKET=https://github.com/jxxghp/MoviePilot-Plugins' \
    -e 'MESSAGER=telegram' \
    -e 'TELEGRAM_TOKEN=xxxxxxxxxxxxx' \
    -e 'TELEGRAM_CHAT_ID=xxxxxxxxxxxxx' \
    -e 'TELEGRAM_USERS=xxxxxxxxxxxxx' \
    -e 'TELEGRAM_ADMINS=xxxxxxxxxxxxx' \
    -e 'WECHAT_CORPID=' \
    -e 'WECHAT_APP_SECRET=' \
    -e 'WECHAT_APP_ID=' \
    -e 'WECHAT_TOKEN=' \
    -e 'WECHAT_ENCODING_AESKEY=' \
    -e 'WECHAT_ADMINS=' \
    -e 'WECHAT_PROXY=' \
    -e 'SLACK_OAUTH_TOKEN=' \
    -e 'SLACK_APP_TOKEN=' \
    -e 'SLACK_CHANNEL=' \
    -e 'SYNOLOGYCHAT_WEBHOOK=' \
    -e 'SYNOLOGYCHAT_TOKEN=' \
    -e 'DOWNLOADER=qbittorrent' \
    -e 'QB_HOST=http://qbittorrent:8080' \
    -e 'QB_USER=admin' \
    -e 'QB_PASSWORD=adminadmin' \
    -e 'QB_CATEGORY=false' \
    -e 'QB_SEQUENTIAL=true' \
    -e 'QB_FORCE_RESUME=false' \
    -e 'TR_HOST=' \
    -e 'TR_USER=' \
    -e 'TR_PASSWORD=' \
    -e 'MEDIASERVER=emby' \
    -e 'EMBY_HOST=http://emby:8096' \
    -e 'EMBY_PLAY_HOST=' \
    -e 'EMBY_API_KEY=xxxxxxxxxxxxx' \
    -e 'JELLYFIN_HOST=' \
    -e 'JELLYFIN_PLAY_HOST' \
    -e 'JELLYFIN_API_KEY=' \
    -e 'PLEX_HOST=' \
    -e 'PLEX_PLAY_HOST=' \
    -e 'PLEX_TOKEN=' \
    -e 'MEDIASERVER_SYNC_INTERVAL=6' \
    -e 'GITHUB_TOKEN=' \
    -e 'AUTH_SITE=iyuu' \
    -e 'IYUU_SIGN=xxxxxxxxxxxxx' \
    -e 'BIG_MEMORY_MODE=false' \
    -e 'MOVIE_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/{{title}}{% if year %} ({{year}}){% endif %}{% if part %}-{{part}}{% endif %}{% if videoFormat %} - {{videoFormat}}{% endif %}{{fileExt}}' \
    -e 'TV_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/Season {{season}}/{{title}} - {{season_episode}}{% if part %}-{{part}}{% endif %}{% if episode %} - 第 {{episode}} 集{% endif %}{{fileExt}}' \
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
        ports:
            - target: 3000
              published: 3000
              protocol: tcp
        environment:
            - 'PUID=1000'
            - 'PGID=1000'
            - 'UMASK=022'
            - 'TZ=Asia/Shanghai'
            # 重启更新
            - 'MOVIEPILOT_AUTO_UPDATE=release'
            # 自动检测和更新资源包（站点索引及认证等），`true`/`false`，默认`true`，需要能正常连接Github，仅支持Docker
            - 'AUTO_UPDATE_RESOURCE=true'
            # WEB服务端口
            - 'NGINX_PORT=3000'
            # 超级管理员用户名
            - 'SUPERUSER=admin'
            # 登录首页电影海报，`tmdb`/`bing`，默认`tmdb`
            - 'WALLPAPER=tmdb'
            # API密钥，在媒体服务器Webhook、微信回调等地址配置中需要加上?token=该值，建议修改为复杂字符串
            - 'API_TOKEN=moviepilot'
            # 网络代理（可选）
            # - 'PROXY_HOST='
            # TMDB API地址
            - 'TMDB_API_DOMAIN=api.themoviedb.org'
            # 下载保存目录
            - 'DOWNLOAD_PATH=/media/downloads'
            - 'DOWNLOAD_MOVIE_PATH=/media/downloads/movies'
            - 'DOWNLOAD_TV_PATH=/media/downloads/tv'
            - 'DOWNLOAD_ANIME_PATH=/media/downloads/anime'
            # 下载站点字幕
            - 'DOWNLOAD_SUBTITLE=false'
            # 下载二级分类开关
            - 'DOWNLOAD_CATEGORY=false'
            # 下载器监控
            - 'DOWNLOADER_MONITOR=true'
            - 'SUBSCRIBE_MODE=spider'
            - 'SUBSCRIBE_RSS_INTERVAL=30'
            # 刮削入库的媒体文件
            - 'SCRAP_METADATA=true'
            - 'SCRAP_FOLLOW_TMDB=true'
            # 种子标签
            - 'TORRENT_TAG=MOVIEPILOT'
            # 媒体库目录
            - 'LIBRARY_PATH=/media'
            - 'LIBRARY_MOVIE_NAME=movies'
            - 'LIBRARY_TV_NAME=tv'
            - 'LIBRARY_ANIME_NAME=anime'
            # 媒体库二级分类开关
            - 'LIBRARY_CATEGORY=false'
            # 转移方式，支持link/copy/move/softlink
            - 'TRANSFER_TYPE=link'
            # 转移覆盖模式，默认为`size`，支持`nerver`/`size`/`always`，分别表示`不覆盖`/`根据文件大小覆盖（大覆盖小）`/`总是覆盖`
            - 'OVERWRITE_MODE=size'
            # CookieCloud服务器地址（默认可以不用修改）
            - 'COOKIECLOUD_HOST=http://cookiecloud:8088/cookie'
            # CookieCloud用户KEY
            - 'COOKIECLOUD_KEY=xxxxxxxxxxxxxxxxx'
            # CookieCloud端对端加密密码
            - 'COOKIECLOUD_PASSWORD=xxxxxxxxxxxxxxxx'
            # CookieCloud同步间隔（分钟）
            - 'COOKIECLOUD_INTERVAL=20'
            # CookieCloud对应的浏览器UA，可选，设置后可增加连接站点的成功率，同步站点后可以在管理界面中修改
            - 'USER_AGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'
            - 'SUBSCRIBE_SEARCH=false'
            # 交互搜索自动下载用户ID，使用,分割
            - 'AUTO_DOWNLOAD_USER='
            # Fanart开关，`true`/`false`，默认`true`，关闭后刮削的图片类型会大幅减少
            - 'FANART_ENABLE=true'

            # 插件市场仓库地址，多个地址使用`,`分隔
            - 'PLUGIN_MARKET=https://github.com/jxxghp/MoviePilot-Plugins'

            # 消息通知渠道，支持 telegram/wechat/slack/synologychat
            - 'MESSAGER=telegram'
            - 'TELEGRAM_TOKEN=xxxxxxxxxxxxx'
            - 'TELEGRAM_CHAT_ID=xxxxxxxxxxxxx'
            - 'TELEGRAM_USERS=xxxxxxxxxxxxx'
            - 'TELEGRAM_ADMINS=xxxxxxxxxxxxx'
            # - 'WECHAT_CORPID='
            # - 'WECHAT_APP_SECRET='
            # - 'WECHAT_APP_ID='
            # - 'WECHAT_TOKEN='
            # - 'WECHAT_ENCODING_AESKEY='
            # - 'WECHAT_ADMINS='
            # - 'WECHAT_PROXY='
            # - 'SLACK_OAUTH_TOKEN='
            # - 'SLACK_APP_TOKEN='
            # - 'SLACK_CHANNEL='
            # - 'SYNOLOGYCHAT_WEBHOOK='
            # - 'SYNOLOGYCHAT_TOKEN='

            # 下载器，支持qbittorrent/transmission
            - 'DOWNLOADER=qbittorrent'
            - 'QB_HOST=http://qbittorrent:8080'
            - 'QB_USER=admin'
            - 'QB_PASSWORD=adminadmin'
            - 'QB_CATEGORY=false'
            - 'QB_SEQUENTIAL=true'
            - 'QB_FORCE_RESUME=false'
            # - 'TR_HOST='
            # - 'TR_USER='
            # - 'TR_PASSWORD='

            # 媒体服务器，支持emby/jellyfin/plex
            - 'MEDIASERVER=emby'
            - 'EMBY_HOST=http://emby:8096'
            - 'EMBY_PLAY_HOST='
            - 'EMBY_API_KEY=xxxxxxxxxxxxx'
            # - 'JELLYFIN_HOST='
            # - 'JELLYFIN_PLAY_HOST='
            # - 'JELLYFIN_API_KEY='
            # - 'PLEX_HOST='
            # - 'PLEX_PLAY_HOST='
            # - 'PLEX_TOKEN='

            # 媒体服务器同步间隔（小时），默认`6`，留空则不同步
            - 'MEDIASERVER_SYNC_INTERVAL=6'
            # 媒体服务器同步黑名单，多个媒体库名称使用,分割
            - 'MEDIASERVER_SYNC_BLACKLIST='

            # Github token，提高请求api限流阈值 ghp_****
            - 'GITHUB_TOKEN='

            # 认证站点，认证资源`v1.1.1`支持`iyuu`/`hhclub`/`audiences`/`hddolby`/`zmpt`/`freefarm`/`hdfans`/`wintersakura`/`leaves`/`ptba`：1ptba /`icc2022`/`ptlsp`/`xingtan`/`ptvicomo`/`agsvpt`
            - 'AUTH_SITE=iyuu'
            - 'IYUU_SIGN=xxxxxxxxxxxxx'
            # 大内存模式
            - 'BIG_MEMORY_MODE=false'
            # 电影重命名格式
            - 'MOVIE_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/{{title}}{% if year %} ({{year}}){% endif %}{% if part %}-{{part}}{% endif %}{% if videoFormat %} - {{videoFormat}}{% endif %}{{fileExt}}'
            # 电视剧重命名格式
            - 'TV_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/Season {{season}}/{{title}} - {{season_episode}}{% if part %}-{{part}}{% endif %}{% if episode %} - 第 {{episode}} 集{% endif %}{{fileExt}}'
        restart: always
        stdin_open: true
        tty: true
        volumes:
            - './moviepilot/config:/config'
            - './moviepilot/core:/moviepilot/.cache/ms-playwright'
            - '/var/run/docker.sock:/var/run/docker.sock:ro'
            - './media:/media'
        networks:
            - moviepilot
        hostname: moviepilot
        container_name: moviepilot
        image: 'jxxghp/moviepilot:latest'
        logging:
            driver: "json-file"
            options:
                max-size: "5m"

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

**注意事项：Qbt下载器需要映射一个与 MoviePilot 中 `DOWNLOAD_PATH` 变量一样的路径，下方是举例。**
> 假设 MoviePilot 中映射宿主机路径`/mnt/user/Files`至docker内路径`/Files`，`DOWNLOAD_PATH`变量填写路径为`/Files/Downloads`（`Downloads`为`Files`下的二级目录，宿主机实际目录则为`/mnt/user/Files/Downloads`）
> 则Qbt下载器也需要映射一个相同的路径，即映射宿主机路径`/mnt/user/Files/Downloads`至QBT docker内路径`/Files/Downloads`

## Win Docker Desktop 实例
[docker-desktop.yml](https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/examples/docker-desktop.yml)
```yaml
# by 群友支持

    # 首先挂载目录，以F盘为例，只提需要注意的参数，其余参数均按照项目README填写

    volumes:
      - /F/:/F/ #建议直接挂载磁盘，否则-1报错
    
    environment:
      PUID: 1000
      PGID: 1000
      UMASK: 000
      DOWNLOAD_PATH: 'F:\downloads'   # Win下载器目录，必须与外置下载器目录一致，否则推送下载路径报错
      LIBRARY_PATH: '/F/media'    # 媒体目录
      TRANSFER_TYPE: 'link'           # 使用硬连接
      DOWNLOADER_MONITOR: false       # 设置参数关闭下载器监控，否则会转移两次，路径报错

      # 在插件内安装目录监控，监控 /F/downloads 等挂载进容器的下载目录
      # 转移模式选择兼容模式
```

# 目录挂载解释

## 实例一

```bash
media
├── downloads
│   ├── movies
│   ├── tv
│   └── anime
├── movies
├── tv
└── anime

media/movies , media/tv 和 media/anime 是硬链接后文件路径
media/downloads/movies , media/downloads/tv 和 media/downloads/anime 是下载路径

moviepilot目录挂载及相关环境变量设置：
-v ./media:/media
-e DOWNLOAD_PATH=/media/downloads
-e DOWNLOAD_MOVIE_PATH=/media/downloads/movies
-e DOWNLOAD_TV_PATH=/media/downloads/tv
-e DOWNLOAD_ANIME_PATH=/media/downloads/anime
-e LIBRARY_PATH=/media
-e LIBRARY_MOVIE_NAME=/media/movies
-e LIBRARY_TV_NAME=/media/tv
-e LIBRARY_ANIME_NAME=/media/anime

下载器目录挂载：
-v ./media/downloads:/media/downloads
```

![](https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/img/hardlink_v_1.jpg)

## 实例二 by 群友支持

![](https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/img/hardlink_v_2.jpg)

[docker-compose.yml](https://raw.githubusercontent.com/DDS-Derek/MoviePilot/docs/examples/docker-compose-hardlink.yml) 实例

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
