***************************************************************
*** This is for explaining the exporting the regression *******
*** result from the stata *************************************

*Last modified by : Binay Shankar
*Last date : 23 jan 2022

***************************************************************

cap cd "F:\Workshop For Stata - Yogdaan\Result reporting using Stata\"

use "Learn Reporting.dta"

* Let's see weather the data has some issue with uniquness 

codebook V3

* let's have a look at dependent variable (Yi)

codebook V102  V103  V104  V105  V106  V107

* let's have a look at explanatory variable (Xi)

table V59

tab V59, nolabel

table V146

tab V146, nolabel

* let's have a look at the few control variable (@)

codebook V248 V240 V253

/* So we can test hypothesis as 

Yi = constant +slope1*X1 +slope2*X2 + @(controls) + error term

so y will keep changing 

*/


* let's run the regression and export the data in excel 

reg V102 V59 V146 i.V248 i.V240 i.V253
outreg2 using "result.xls", dec(3)

reg V103 V59 V146 i.V248 i.V240 i.V253
outreg2 using "result.xls", dec(3)

reg V104 V59 V146 i.V248 i.V240 i.V253
outreg2 using "result.xls", dec(3)

reg V105 V59 V146 i.V248 i.V240 i.V253
outreg2 using "result.xls", dec(3)

reg V106 V59 V146 i.V248 i.V240 i.V253
outreg2 using "result.xls", dec(3)

reg V107 V59 V146 i.V248 i.V240 i.V253
outreg2 using "result.xls", dec(3)

* so we also need summary statistics for all the variables of interest

asdoc sum V102 V103 V104 V105 V106 V107 V59 V146 V248 V240 V253




