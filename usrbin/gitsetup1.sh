#!/bin/csh

setenv WORKSPACE /nobackup/soma/workspace
setenv BRANCH xr-dev
setenv REMOTE_REPO /auto/wsmhesketh-sjc/git/ws.git
setenv BINARIES_TAR_FILE /auto/wsmhesketh-sjc/git/wsfiles.tar
setenv REPO /nobackup/soma/ws.git
setenv BINARIES /nobackup/soma/cache
mkdir /nobackup/soma/workspace
date
git clone --mirror $REMOTE_REPO $REPO
mkdir -p $BINARIES
date
echo "Binary Extraction"
tar -xf $BINARIES_TAR_FILE -C $BINARIES
date
echo "Git Clone xr-dev to Workspace"
git clone $REPO -b $BRANCH $WORKSPACE
cd $WORKSPACE
pwd > .ACMEROOT/ws.root
hostname > .ACMEROOT/ws.view_servers
cp -lrf $BINARIES/. .
cd $WORKSPACE
date;
