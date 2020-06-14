FROM debian:sid

# 安装依赖
RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y

# 复制对应配置项
COPY wwwroot.tar.gz /wwwroot/wwwroot.tar.gz
COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh

# 修改权限
RUN chmod +x /entrypoint.sh



# 执行应用程序命令
CMD /entrypoint.sh
