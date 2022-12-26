# Xiwangly的Windows KMS激活服务端

由[沧水的KMS服务](https://kms.cangshui.net/)修改而来

如果宿主机是CentOS之类的系统，请先在宿主机关闭SELinux

以下版本多选一

运行Alpine（默认）版本的，需要放行TCP 1688端口
```shell
docker run -itd --name=kms -p 1688:1688 --restart=always xiwangly/kms
```

运行Debian版本的，需要放行TCP 1688端口
```shell
docker run -itd --name=kms -p 1688:1688 --restart=always xiwangly/kms /sbin/init
```

使用下面的Dockerfile可以构建镜像

基于Alpine
```Dockerfile
FROM alpine:latest

ENV TZ Asia/Shanghai

RUN /bin/sh -c 'sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories;\
apk --no-cache add net-tools procps wget iproute2 unzip tzdata;\
wget --no-check-certificate https://pan.xiwangly.top/d/%E6%9C%AC%E5%9C%B0%E7%A3%81%E7%9B%98/vlmcsd-2018.zip;\
unzip -q vlmcsd-2018.zip -d /usr/local/;\
ln -sv /usr/local/vlmcsd-2018/ /usr/local/KMS;\
chmod +x /usr/local/KMS/binaries/Linux/intel/static/*;\
apk del wget unzip;\
sed -i "s/mirrors.ustc.edu.cn/dl-cdn.alpinelinux.org/g" /etc/apk/repositories;\
rm vlmcsd-2018.zip;\
/usr/local/KMS/binaries/Linux/intel/static/vlmcsd-x64-musl-static;'

ENTRYPOINT /usr/local/KMS/binaries/Linux/intel/static/vlmcsd-x64-musl-static;/bin/sh
```
基于Debian，旧的 ~~（貌似有很多bug）~~
```Dockerfile
FROM debian

RUN /bin/bash -c 'sed -i "s/deb.debian.org/mirrors.ustc.edu.cn/g" /etc/apt/sources.list;\
apt-get update;\
export DEBIAN_FRONTEND=noninteractive;\
apt-get install -y net-tools procps wget init iproute2 unzip;\
wget --no-check-certificate https://pan.xiwangly.top/d/%E6%9C%AC%E5%9C%B0%E7%A3%81%E7%9B%98/vlmcsd-2018.zip;\
unzip -q vlmcsd-2018.zip -d /usr/local/;\
rm -f vlmcsd-2018.zip;\
ln -sv /usr/local/vlmcsd-2018/ /usr/local/KMS;\
echo "export PATH=/usr/local/KMS/binaries/Linux/intel/static:\$PATH" > /etc/profile.d/vlmcs.sh;\
source /etc/profile.d/vlmcs.sh;\
chmod +x /usr/local/KMS/binaries/Linux/intel/static/*;\
wget --no-check-certificate https://pan.xiwangly.top/d/%E6%9C%AC%E5%9C%B0%E7%A3%81%E7%9B%98/kms.sh -O /etc/init.d/kms;\
chmod +x /etc/init.d/kms;\
update-rc.d kms defaults;\
vlmcsd-x64-musl-static;\
export DEBIAN_FRONTEND=;'
```

