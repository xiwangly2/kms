FROM alpine:latest

ENV TZ Asia/Shanghai

RUN /bin/sh -c 'apk --no-cache add net-tools procps wget iproute2 unzip tzdata;\
wget -q --no-check-certificate https://pan.xiwangly.top/d/%E6%9C%AC%E5%9C%B0%E7%A3%81%E7%9B%98/vlmcsd-2018.zip;\
unzip -q vlmcsd-2018.zip -d /usr/local/;\
ln -sv /usr/local/vlmcsd-2018/ /usr/local/KMS;\
chmod +x /usr/local/KMS/binaries/Linux/intel/static/*;\
apk del wget unzip;\
rm vlmcsd-2018.zip;\
/usr/local/KMS/binaries/Linux/intel/static/vlmcsd-x64-musl-static;'

ENTRYPOINT /usr/local/KMS/binaries/Linux/intel/static/vlmcsd-x64-musl-static;/bin/sh