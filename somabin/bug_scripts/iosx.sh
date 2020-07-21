#!/bin/sh +x

QDDTS=/vws/aak/qddts
EBASE=/auto/cweb0/www-home/virtual/wwwin-release/relops/IOSX/ddts1/bin
export QDDTS EBASE

if [ "-$QDDTS" = "-" ]; then
    echo "QDDTS environmental variable not set"         >&2
    exit 1
else
    . $QDDTS/lib/sh_init
fi

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.02              and  \
		Component:$1		 minus  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.02              and  \
		Component:$1		   and  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.03              and  \
		Component:$1		 minus  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.03              and  \
		Component:$1		   and  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.04              and  \
		Component:$1		 minus  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.04              and  \
		Component:$1		   and  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.05              and  \
		Component:$1		 minus  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.05              and  \
		Component:$1		   and  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.06              and  \
		Component:$1		 minus  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

query.pl                                        \
        Project:CSC.ena and Severity:1,2,3 and 	\
                Version:03.06              and  \
		Component:$1		   and  \
                Found:customer-use    	 minus  \
		Impact:not	| wc

