*******************************************************
**** This do file is as supplement fo the *************
**** stata workshop organised by Yogdaan **************

// Last modfied Date: 18th Jan, 2022
// Last modified by: Binay Shankar


*I am going to use some data

*I am going to use some data

// I am going to use some data

/*
fjhs hjsg jkgsad



I am going to use some data
*/



sysuse educ99gdp.dta
set more off
codebook
table country
table public
table private


log using "F:\Covid ii vaccine uptake\Binay_RA_Stata_Test.smcl"

*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// For Part 1 - 1 Importing the data set //


cap cd "F:\Workshop For Stata - Yogdaan\"

// for a //

// Importing csv data and changing that into dta format //

*import delimited "F:\Covid ii vaccine uptake\coding_challenge\Part 1\New Variables.csv"
*or
import delimited "F:\Workshop For Stata - Yogdaan\New Variables.csv", clear

// labelling variable //



label variable uniqueid "Unique ID"
label variable surveytime2 "Survey Time"
label variable thanavisitreason_other2 "Another Vi"
label variable thanavisitreason_other2 "Another Visit"
label variable exit "Already Interviewed (0=No,1=Yes)"
label variable base_age "Age_Respondent"
label variable base_income "Income"
label variable base_educ "Education"
encode base_educ, gen( base_educ_e )
tab base_educ_e
tab base_educ_e, nolabel
label values base_educ_e .
tab base_educ_e
drop base_educ
rename base_educ_e base_educ

save "New Varaibles.dta"

clear

* (b)merge with main data set 

//browse data just to see the unique id are not in string //

use "Main Dataset.dta"
br

codebook uniqueid

use "New Varaibles.dta", clear
br

codebook uniqueid


// merging 1:1 against unique id //

use "Main Dataset.dta", clear

*merge 1:1 uniqueid using "F:\Covid ii vaccine uptake\coding_challenge\Part 1\New Varaibles.dta"
*or
merge 1:1 uniqueid using "New Varaibles.dta"

save "Main Dataset.dta", replace

* (c) append new observations

// browsing the new observations just to see //

clear
use "New Observations.dta"
br

// appending the new observations //

use "Main Dataset.dta", clear

*append using "F:\Covid ii vaccine uptake\coding_challenge\Part 1\New Observations.dta"
*or
append using "New Observations.dta"

save "Main Dataset.dta", replace

destring, replace

*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

codebook

translate "path.smcl" "samepath.pdf"

