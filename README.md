目录挂载解释

```bash
宿主机文件结构推荐：
media
├── downloads
│   ├── movies
│   └── tv
├── movies
└── tv

media/movies 和 media/tv 是硬链接后文件路径
media/downloads/movies 和 media/downloads/tv 是下载路径

moviepilot目录挂载及相关环境变量设置：
-v ./media:/media
-e DOWNLOAD_PATH=/media/downloads
-e DOWNLOAD_MOVIE_PATH=/media/downloads/movies
-e DOWNLOAD_TV_PATH=/media/downloads/tv
-e LIBRARY_PATH=/media
-e LIBRARY_MOVIE_NAME=/media/movies
-e LIBRARY_TV_NAME=/media/tv

下载器目录挂载：
-v ./media/downloads:/media/downloads
```

docker-compose 实例

```yaml
version: '3.3'

# MoviePilot 地址：https://github.com/jxxghp/MoviePilot
# Emby 镜像地址：https://hub.docker.com/r/emby/embyserver
# CookieCloud 地址：https://github.com/easychen/CookieCloud
# qBittorrent 镜像地址：https://github.com/DDS-Derek/dockerfiles/tree/master/qbittorrent
# 此 docker compose 文件 by DDSRem

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
            - 'MOVIEPILOT_AUTO_UPDATE=true'
            # 重启更新是否使用国内加速
            - 'MOVIEPILOT_CN_UPDATE=false'
            # WEB服务端口
            - 'NGINX_PORT=3000'
            # 超级管理员用户名
            - 'SUPERUSER=admin'
            # 超级管理员初始密码
            - 'SUPERUSER_PASSWORD=password'
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
            # 下载站点字幕
            - 'DOWNLOAD_SUBTITLE=false'
            # 下载二级分类开关
            - 'DOWNLOAD_CATEGORY=false'
            # 入库刷新媒体库
            - 'REFRESH_MEDIASERVER=true'
            # 刮削入库的媒体文件
            - 'SCRAP_METADATA=true'
            # 种子标签
            - 'TORRENT_TAG=MOVIEPILOT'
            # 媒体库目录
            - 'LIBRARY_PATH=/media'
            - 'LIBRARY_MOVIE_NAME=movies'
            - 'LIBRARY_TV_NAME=tv'
            # 媒体库二级分类开关
            - 'LIBRARY_CATEGORY=false'
            # 转移方式，支持link/copy/move/softlink
            - 'TRANSFER_TYPE=link'
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

            # 消息通知渠道，支持 telegram/wechat/slack
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

            # 下载器，支持qbittorrent/transmission
            - 'DOWNLOADER=qbittorrent'
            - 'QB_HOST=http://qbittorrent:8080'
            - 'QB_USER=admin'
            - 'QB_PASSWORD=adminadmin'
            # - 'TR_HOST='
            # - 'TR_USER='
            # - 'TR_PASSWORD='

            # 媒体服务器，支持emby/jellyfin/plex
            - 'MEDIASERVER=emby'
            - 'EMBY_HOST=http://emby:8096'
            - 'EMBY_API_KEY=xxxxxxxxxxxxx'
            # - 'JELLYFIN_HOST='
            # - 'JELLYFIN_API_KEY='
            # - 'PLEX_HOST='
            # - 'PLEX_TOKEN='

            # 认证站点，支持hhclub/audiences/hddolby/zmpt/freefarm/hdfans/wintersakura/leaves/1ptba/icc2022/iyuu
            - 'AUTH_SITE=iyuu'
            - 'IYUU_SIGN=xxxxxxxxxxxxx'
            # 大内存模式
            - 'BIG_MEMORY_MODE=false'
            # 电影重命名格式
            - 'MOVIE_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/{{title}}{% if year %} ({{year}}){% endif %}{% if part %}-{{part}}{% endif %}{% if videoFormat %} - {{videoFormat}}{% endif %}{{fileExt}}'
            # 电视剧重命名格式
            - 'TV_RENAME_FORMAT={{title}}{% if year %} ({{year}}){% endif %}/Season {{season}}/{{title}} - {{season_episode}}{% if part %}-{{part}}{% endif %}{% if episode %} - 第 {{episode}} 集{% endif %}{{fileExt}}'
        restart: always
        tty: true
        volumes:
            - './moviepilot/config:/config'
            - './moviepilot/core:/moviepilot/.cache/ms-playwright'
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

    cookiecloud:
        container_name: cookiecloud
        hostname: cookiecloud
        restart: always
        tty: true
        networks:
            - moviepilot
        environment:
            - 'API_ROOT=/cookie'
        ports:
            - target: 8088
              published: 8088
              protocol: tcp
        image: 'easychen/cookiecloud:latest'
        logging:
            driver: "json-file"
            options:
                max-size: "5m"

    emby:
        container_name: emby
        ports:
            - target: 8096
              published: 8096
              protocol: tcp
            - target: 8920
              published: 8920
              protocol: tcp
            - target: 1900
              published: 1900
              protocol: udp
            - target: 7359
              published: 7359
              protocol: udp
        volumes:
            - './emby/config:/config'
            - './media:/data'
        environment:
            - TZ=Asia/Shanghai
            - UID=1000
            - GID=1000
            - GIDLIST=1000(nas),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),120(lpadmin),131(lxd),132(sambashare)
            # - 'HTTP_PROXY=http://你的代理IP:你的代理端口/'
            # - 'HTTPS_PROXY=http://你的代理IP:你的代理端口/'
        # devices:
        #     - '/dev/dri:/dev/dri'
        restart: always
        hostname: emby
        networks:
            - moviepilot
        image: 'emby/embyserver:latest'
        logging:
            driver: "json-file"
            options:
                max-size: "5m"

    qbittorrent:
        image: 'nevinee/qbittorrent:latest'
        container_name: qbittorrent
        restart: always
        tty: true
        hostname: qbittorrent
        volumes:
            - './qbittorrent/config:/data'
            - './media/downloads:/media/downloads'
        tmpfs:
            - '/tmp'
        environment:
            - 'WEBUI_PORT=8080'
            - 'BT_PORT=49678'
            - 'PUID=1000'
            - 'PGID=1000'
        ports:
            - target: 8080
              published: 8080
              protocol: tcp
            - target: 49678
              published: 49678
              protocol: tcp
            - target: 49678
              published: 49678
              protocol: udp
        networks:
            - moviepilot
        logging:
            driver: "json-file"
            options:
                max-size: "5m"

networks:
  moviepilot:
    name: moviepilot
```

