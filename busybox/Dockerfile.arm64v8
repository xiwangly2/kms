FROM alpine:latest

ENV TZ Asia/Shanghai

RUN /bin/sh -c 'sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories;\
apk --no-cache add net-tools procps wget iproute2 unzip tzdata;\
wget --no-check-certificate https://raw.githubusercontent.com/xiwangly2/kms/main/src/vlmcsd-2018.zip;\
unzip -q vlmcsd-2018.zip -d /usr/local/;\
ln -sv /usr/local/vlmcsd-2018/ /usr/local/KMS;\
chmod -R +x /usr/local/KMS/binaries/Linux/*;\
apk del wget unzip;\
sed -i "s/mirrors.ustc.edu.cn/dl-cdn.alpinelinux.org/g" /etc/apk/repositories;\
rm vlmcsd-2018.zip;\
/usr/local/KMS/binaries/Linux/arm/little-endian/static/vlmcsd-armv7el-uclibc-static;'

ENTRYPOINT /usr/local/KMS/binaries/Linux/arm/little-endian/static/vlmcsd-armv7el-uclibc-static;/bin/sh