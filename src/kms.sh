#!/bin/bash
# chkconfig: 2345 55 25
# description: kms

### BEGIN INIT INFO
# Provides:kms
# Required-Start:$all
# Required-Stop:$all
# Default-Start:2 3 4 5
# Default-Stop:0 1 6
# Short-Description:starts kms
# Description:starts the kms
### END INIT INFO

export PATH=/usr/local/KMS/binaries/Linux/intel/static:\$PATH
vlmcsd-x64-musl-static