#
# Script to generate 12.0S Sev1 and Sev2 ddts with and without Release Notes
#

setenv QDDTS /vws/aak/qddts

findbug -p CSC.sys -fAOINPW "((Version has 12.0) && ((Version has S) && (Version hasno ST && Version hasno SC && Version hasno SL)) && (Severity == 1 || Severity == 2))" | bugval Identifier >sev1sev2.open

rm relnote.none relnote.yes relnote.ignore 

cat sev1sev2.open | /vws/aak/qddts/bin/relnote_sep.pl relnote.yes relnote.ignore relnote.none

cat relnote.none | bugval Identifier Severity Status Engineer Headline | sort +3 
rm sev1sev2.open 

