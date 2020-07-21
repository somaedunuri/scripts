#
# This scripts accepts list of ddts as input file and generates list of
# ddts which has $$IGNORE as Release-notes
#

setenv QDDTS /vws/aak/qddts

rm relnote.yes relnote.none relnote.ignore relnote.prefcs

cat $1 | /vws/aak/qddts/bin/relnote_sep.pl relnote.yes relnote.ignore relnote.none relnote.prefcs

cat relnote.ignore relnote.prefcs

