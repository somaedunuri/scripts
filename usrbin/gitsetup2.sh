#!/bin/csh

date
setenv WORKSPACE /nobackup/$1/workspace
setenv BRANCH r65x
setenv REMOTE_REPO /auto/wsmhesketh-sjc/git/ws.git
setenv BINARIES_TAR_FILE /auto/wsmhesketh-sjc/git/wsfiles.tar
setenv REPO /nobackup/$1/ws.git
setenv BINARIES /nobackup/$1/cache
mkdir /nobackup/$1/workspace
git clone --mirror $REMOTE_REPO $REPO
mkdir -p $BINARIES
echo "Binary Extraction"
tar -xf $BINARIES_TAR_FILE -C $BINARIES
echo "Git Clone xr-dev to Workspace"
git clone $REPO -b $BRANCH $WORKSPACE
cd $WORKSPACE
pwd > .ACMEROOT/ws.root
hostname > .ACMEROOT/ws.view_servers
cp -lrf $BINARIES/. .
cd $WORKSPACE
date;
