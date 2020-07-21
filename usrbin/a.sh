    # add __BASESRC__ define for code generators // line 1
    compdir=infra/test/linux/stubs/src
    srcdir=$compdir
    basesrc=infra/test/linux/stubs/src/malloc_unwrap.c
    until [ -f "$compdir/comp-mdata.pl" ] ; do
        compdir=`dirname $compdir` ;
        if [ "$compdir" = "/" -o "$compdir" = "." ] ; then
            echo "ERROR: Could not determine component directory for $basesrc" ;
            exit 1 ;
        fi
    done
    basesrc=`echo $basesrc | sed -e "s@$compdir/@@" -e 's@/@_@g' -e 's@\.@_@g'| tr 'a-z' 'A-Z'`
    BASESRCOPT="-D__BASESRC__=$basesrc"

    # N.B. the -o argument is specified first to help in debugging issues
    # related to individual targets (e.g. when a command is too long it's
    # truncated in the log, but we need to know which target is causing the
    # issue).
    # Update the echo command, whenever CC lines are modified.
    shortsrc=`basename infra/test/linux/stubs/src/malloc_unwrap.c`
    mkdir -p ./.SA_ROOT/${srcdir}
    echo "infra/test/linux/stubs/src/malloc_unwrap.c : enxr : /router/bin/gcc.c4.7.0-p1 -o infra/test/linux/stubs/obj-x86/malloc_unwrap.o -c -include ./build/icc-preincl.h -Wall -Wno-strict-aliasing -Wno-endif-labels -Wpointer-arith -Wformat -Wno-error -Wno-unused-but-set-variable -Wno-switch -Wno-error=enum-compare -Wno-error=switch -Wno-error=unused-function -ggdb2 -D__ENXR__ -D__LINUX__ -D__QNXSOL -D__IOSNG__ -D__X86__ -DTARGET_CISCO -DRM_DLLMGR_TMP= -DBUILDENV_iox -fPIC -fsigned-char -Wno-pointer-sign -Wno-error -m32 -D__ENXR_CEL62__ -DVALGRIND_NEW -Wno-pointer-sign -Wno-sign-compare -D_ENXR_NO_NPTL_ \
            $BASESRCOPT  -Iinfra/test/linux/stubs/obj-x86 -Iinfra/test/linux/stubs/src -Iinfra/test/linux/stubs/include -Iinfra/test/linux/stubs/etc -I./infra/test/linux/include-linux-common -I./infra/test/linux/include-linux -I./infra/test/linux/include-linux/os -I./build/bin-x86_64/4.7.0/include -I./infra/test/linux/obj-x86/inc-x86-linux -I./inc/linux-x86 -I./inc/linux-x86/os -I./inc/linux-x86/os/x86 -I. -I./infra/xoslib/include  infra/test/linux/stubs/src/malloc_unwrap.c" \
        >>  /tmp/sadump_xr.$shortsrc.log ;
    /router/bin/gcc.c4.7.0-p1 -o /tmp/malloc_unwrap.o -c -include ./build/icc-preincl.h -Wall -Wno-strict-aliasing -Wno-endif-labels -Wpointer-arith -Wformat -Wno-error -Wno-unused-but-set-variable -Wno-switch -Wno-error=enum-compare -Wno-error=switch -Wno-error=unused-function -ggdb2 -D__ENXR__ -D__LINUX__ -D__QNXSOL -D__IOSNG__ -D__X86__ -DTARGET_CISCO -DRM_DLLMGR_TMP= -DBUILDENV_iox -fPIC -fsigned-char -Wno-pointer-sign -Wno-error -m32 -D__ENXR_CEL62__ -DVALGRIND_NEW -Wno-pointer-sign -Wno-sign-compare -D_ENXR_NO_NPTL_ $BASESRCOPT  -Iinfra/test/linux/stubs/obj-x86 -Iinfra/test/linux/stubs/src -Iinfra/test/linux/stubs/include -Iinfra/test/linux/stubs/etc -I./infra/test/linux/include-linux-common -I./infra/test/linux/include-linux -I./infra/test/linux/include-linux/os -I./build/bin-x86_64/4.7.0/include -I./infra/test/linux/obj-x86/inc-x86-linux -I./inc/linux-x86 -I./inc/linux-x86/os -I./inc/linux-x86/os/x86 -I. -I./infra/xoslib/include  infra/test/linux/stubs/src/malloc_unwrap.c
