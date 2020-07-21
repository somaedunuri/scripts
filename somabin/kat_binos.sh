echo "Tools " ; date;
/auto/binos-tools/bin/gmk -jmakej TARGET=ppc TOOLS=1 tools
echo "i686 sdk-all " ; date;
/auto/binos-tools/bin/gmk -jmakej TARGET=i686 sdk-all
echo "x86_64 sdk-all " ; date;
/auto/binos-tools/bin/gmk -jmakej TARGET=x86_64 sdk-all
echo "i686 all-ngwc " ; date;
/auto/binos-tools/bin/gmk -jmakej TARGET=i686 all all-ngwc 
echo "x86_64 all-ngwc " ; date;
/auto/binos-tools/bin/gmk -jmakej TARGET=x86_64 all all-ngwc 
date;

