FROM busybox:musl AS Builder

COPY "vlmcsd-2018.zip" "/tmp"

RUN /bin/sh -c '\
arch="$(arch)";\
unzip -q /tmp/vlmcsd-2018.zip -d /tmp;\
mkdir -p /usr/local/;\
if [[ $arch =~ "x86_64" ]];then mv /tmp/vlmcsd-2018/binaries/Linux/intel/static/vlmcsd-x64-musl-static /usr/local/vlmcsd;fi;\
if [[ $arch =~ "aarch64" ]];then mv /tmp/vlmcsd-2018/binaries/Linux/arm/little-endian/static/vlmcsd-armv7el-uclibc-static /usr/local/vlmcsd;fi;\
if [[ $arch =~ "arm" ]];then mv /tmp/vlmcsd-2018/binaries/Linux/arm/little-endian/static/vlmcsd-armv7el-uclibc-static /usr/local/vlmcsd;fi;\
if [[ $arch =~ "x86" ]];then mv /tmp/vlmcsd-2018/binaries/Linux/intel/static/vlmcsd-x86-musl-static /usr/local/vlmcsd;fi;\
if [[ $arch =~ "ppc64le" ]];then mv /tmp/vlmcsd-2018/binaries/Linux/ppc/little-endian/glibc/vlmcsd-ppc64el-glibc /usr/local/vlmcsd;fi;\
if [[ $arch =~ "s390x" ]];then mv /tmp/vlmcsd-2018/vlmcsd-2018/binaries/Linux/s390/glibc/vlmcsd-s390x-glibc /usr/local/vlmcsd;fi;\
rm /tmp/vlmcsd-2018.zip;\
rm -r /tmp/vlmcsd-2018;\
'
FROM busybox:musl

COPY --from=Builder /usr/local/vlmcsd /usr/local/vlmcsd

RUN chmod 777 /usr/local/vlmcsd

ENTRYPOINT /usr/local/vlmcsd && /bin/sh