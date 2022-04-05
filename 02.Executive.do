**********************************************************************************
*Association of Social Support and Cognitive Aging Modified by Sex and
*Relationship Type: A Prospective Investigation in the English Longitudinal Study
*of Ageing
**********************************************************************************

*************************************************************.
***Executive function
*************************************************************.

use "N:\Temp\MemoryFunction.dta",clear
sort idauniq
keep idauniq CF_memory1 CF_memory2 CF_memory3 CF_memory4 CF_memory5 ///
cfdscr1 cfdscr2 cfdscr3 cfdscr4 cfdscr5 ///
cflisen1 cflisen2 cflisen3 cflisen4 cflisen5 ///
cflisd1 cflisd2 cflisd3 cflisd4 cflisd5 ///
cfprmem1 cfprmem2 cfprmem3 cfprmem4 cfprmem5
save "N:\Temp\TempMemory.dta",replace

* Wave1.
clear
use idauniq indsex finstat cf* w1wgt askpx nmissed nrowclm dhager using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
renvars, lower
keep if inrange(w1wgt,0.2,8.9)
generate agegroup=0
replace agegroup=1 if inrange(dhager,50,54)
replace agegroup=2 if inrange(dhager,55,59)
replace agegroup=3 if inrange(dhager,60,64)
replace agegroup=4 if inrange(dhager,65,69)
replace agegroup=5 if inrange(dhager,70,74)
replace agegroup=6 if inrange(dhager,75,79)
replace agegroup=7 if inrange(dhager,80,102)
label define albl 1 "50-54" 2 "55-59" 3 "60-64" 4 "65-69" 5 "70-74" 6 "75-79" 7 "80+" 
label values agegroup albl

*nnmisrc (letters missed recorded).
*Higher scores = better CF (range 0 to 5).
generate nnmisrc = nmissed
recode nnmisrc (-2=-2) (-1=-1) (0/1=5) (2=4) (3=3) (4/5=2) (6/8=1) (9/max=0)
label variable nnmisrc "Number of letters missed"
label define mlbl ///
0 "9+ missed" 1 "6-8 missed" 2 "4-5 missed" ///
3 "3 missed" 4 "2 missed" 5 "0-1 missed" -1 "N/A" -2 "booklet not received"
label values nnmisrc mlbl

* CFspeed (number of items completed recorded).
* Higher scores = better CF (range 1 to 8).
generate cfspeed=nrowclm
recode cfspeed (-2=-2) (-1=-1) (0/174=0) (175/249=1) (250/274=2) (275/299=3) (300/324=4) (325/399=5) (400/449=6) (450/max=7)
label variable cfspeed "Number of items completed recorded"
label define slbl ///
0 "1-174" 1 "175-249" 2 "250-274" ///
3 "275-299" 4 "300-324" 5 "325-399" 6 "400-449" 7 "450+" -1 "NA" -2 "booklet not received"
label values cfspeed slbl

* Verbal fluency.
* Higher scores = better CF (range 1 to 9).
generate cfanig = cfani
recode cfanig (-1=-1) (-8=-8) (-9=-9) (0/7=0) (8/12=1) (13/15=2) ///
(16/17=3) (18/19=4) (20/21=5) (22/24=6) (25/29=7) (30/max=8) 
label variable cfanig "Verbal fluency (grouped)"
label define flbl ///
0 "0-7" 1 "8-12" 2 "13-15" ///
3 "16-17" 4 "18-19" 5 "20-21" 6 "22-24" 7 "25-29" 8 "30+" -1 "NA" -9 "refusal"
label values cfanig flbl

*Executive function index = (cfanig + cfspeed + nnmisrc).
*Range (0 to 20).
generate base=0
replace base=1 if (cfanig>=0) & (cfspeed>=0) & (nnmisrc>=0)
generate CF_exec1 = -11
replace  CF_exec1 = (cfanig + cfspeed + nnmisrc) if (cfanig>=0) & (cfspeed>=0) & (nnmisrc>=0)
label variable CF_exec1 "Executive function index (cognitive)"
generate wave1=1
generate age1 = dhager
rename cfanig cfanig1 
rename cfspeed cfspeed1 
rename nnmisrc missed1
keep idauniq indsex dhager age1 CF_exec1 cfanig1 cfspeed1 missed1 wave1
save "N:\Temp\Temp1.dta", replace

* Wave 2.
clear
use idauniq dhager finstat indsex w2wgt askpx outscw2 C* n* using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
renvars,lower
rename dhager age2
keep if inrange(w2wgt,0.02,10)
keep if finstat=="C1CM"
* nnmisrc (letters missed recorded).
generate nnmisrc = nnmisse
recode nnmisrc (-2=-2) (-1=-1) (0/1=5) (2=4) (3=3) (4/5=2) (6/8=1) (9/max=0)
label variable nnmisrc "Number of letters missed"
label define ml 0 "9+ missed" 1 "6-8 missed" 2 "4-5 missed" ///
3 "3 missed" 4 "2 missed" 5 "0-1 missed" -1 "N/A" -2 "booklet not received"
label values nnmisrc mlbl

* CFspeed (number of items completed recorded).
generate cfspeed=nrowcl
recode cfspeed (-2=-2) (-1=-1) (0/174=0) (175/249=1) (250/274=2) (275/299=3) (300/324=4) (325/399=5) (400/449=6) (450/max=7)
label variable cfspeed "Number of items completed recorded"
label define slbl 0 "0-174" 1 "175-249" 2 "250-274" ///
3 "275-299" 4 "300-324" 5 "325-399" 6 "400-449" 7 "450+" -1 "NA" -2 "booklet not received"
label values cfspeed slbl

* Verbal fluency.
generate cfanig = cfani
recode cfanig (-1=-1) (-8=-8) (-9=-9) (0/7=0) (8/12=1) (13/15=2) (16/17=3) (18/19=4) (20/21=5) (22/24=6) (25/29=7) (30/max=8) 
label variable cfanig "Fluency recorded"
label define flbl 0 "0-7" 1 "8-12" 2 "13-15" ///
3 "16-17" 4 "18-19" 5 "20-21" 6 "22-24" 7 "25-29" 8 "30+" -1 "NA" -9 "refusal"
label values cfanig flbl
*Executive function index = (cfanig + cfspeed + nnmisrc).
generate base=0
replace base=1 if (cfanig>=0) & (cfspeed>=0) & (nnmisrc>=0)
generate CF_exec2=-11
replace CF_exec2 = (cfanig + cfspeed + nnmisrc) if (cfanig>=0) & (cfspeed>=0) & (nnmisrc>=0)
label variable CF_exec2 "Executive function index (cognitive)"
generate wave2=1
rename cfanig cfanig2 
rename cfspeed cfspeed2 
rename nnmisrc missed2
keep idauniq CF_exec2 wave2 age2 cfanig2 cfspeed2 missed2
save "N:\Temp\Temp2.dta", replace


* ELSA Wave 3.
clear
use  idauniq dhager finstat indsex askpx w3lwgt sc* c* n* outscw3 using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
renvars,lower
rename dhager age3
keep if finstat=="C1CM"
sort idauniq

* nnmisrc (letters missed recorded).
generate nnmisrcx = nmissed
recode nnmisrcx (-2=-2) (-1=-1) (0/1=5) (2=4) (3=3) (4/5=2) (6/8=1) (9/max=0)
label variable nnmisrcx "Number of letters missed recorded"
label define mlbl 0 "9+ missed" 1 "6-8 missed" 2 "4-5 missed" ///
3 "3 missed" 4 "2 missed" 5 "0-1 missed" -1 "N/A" -2 "booklet not received"
label values nnmisrcx mlbl

* CFspeed (number of items completed recorded).
generate cfspeedx = nrowclm
recode cfspeedx (-2=-2) (-1=-1) (0/174=0) (175/249=1) (250/274=2) (275/299=3) (300/324=4) (325/399=5) (400/449=6) (450/max=7)
label variable cfspeedx "Number of items completed recorded"
label define slbl 0 "0-174" 1 "175-249" 2 "250-274" ///
3 "275-299" 4 "300-324" 5 "325-399" 6 "400-449" 7 "450+" -1 "NA" -2 "booklet not received"
label values cfspeedx slbl

* Verbal fluency.
generate cfanigx = cfani
recode cfanigx (-1=-1) (-8=-8) (-9=-9) (0/7=0) (8/12=1) (13/15=2) (16/17=3) (18/19=4) (20/21=5) (22/24=6) (25/29=7) (30/max=8) 
label variable cfanigx "Fluency recorded"
label define flbl 0 "0-7" 1 "8-12" 2 "13-15" ///
3 "16-17" 4 "18-19" 5 "20-21" 6 "22-24" 7 "25-29" 8 "30+" -1 "NA" -9 "refusal"
label values cfanigx flbl

generate base=0
replace base=1 if (cfanigx>=0) & (cfspeedx>=0) & (nnmisrcx>=0)
generate CF_exec3 = -11
replace CF_exec3 = (cfanigx + cfspeedx + nnmisrcx) if (cfanigx>=0) & (cfspeedx>=0) & (nnmisrcx>=0)
label variable CF_exec3 "Executive function index (cognitive)"
generate wave3=1
rename cfanigx cfanig3 
rename cfspeedx cfspeed3 
rename nnmisrcx missed3
keep idauniq CF_exec3 wave3 age3 cfanig3 cfspeed3 missed3
save "N:\Temp\Temp3.dta", replace


* ELSA Wave 4.
clear
use idauniq indager finstat indsex askpx sc* c* n* using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
renvars,lower
rename indager age4
keep if finstat=="C1CM"

* nnmisrc (letters missed recorded).

generate nnmisrc = nmissed
recode nnmisrc (-2=-2) (-1=-1) (0/1=5) (2=4) (3=3) (4/5=2) (6/8=1) (9/max=0)
label variable nnmisrc "Number of letters missed recorded"
label define mlbl 0 "9+ missed" 1 "6-8 missed" 2 "4-5 missed" ///
3 "3 missed" 4 "2 missed" 5 "0-1 missed" -1 "N/A" -2 "booklet not received"
label values nnmisrc mlbl

* CFspeed (number of items completed recorded).
generate cfspeed=nrowclm
recode cfspeed (-2=-2) (-1=-1) (0/174=0) (175/249=1) (250/274=2) (275/299=3) (300/324=4) (325/399=5) (400/449=6) (450/max=7)
label variable cfspeed "Number of items completed recorded"
label define slbl 0 "0-174" 1 "175-249" 2 "250-274" ///
3 "275-299" 4 "300-324" 5 "325-399" 6 "400-449" 7 "450+" -1 "NA" -2 "booklet not received"
label values cfspeed slbl

* Verbal Fluency.
generate cfanigx = cfani
recode cfanigx (-1=-1) (-8=-8) (-9=-9) (0/7=0) (8/12=1) (13/15=2) (16/17=3) (18/19=4) (20/21=5) (22/24=6) (25/29=7) (30/max=8) 
label variable cfanigx "Fluency recorded"
label define flbl 0 "0-7 animals" 1 "8-12 animals" 2 "13-15" ///
3 "16-17" 4 "18-19" 5 "20-21" 6 "22-24" 7 "25-29" 8 "30+" -1 "NA" -9 "refusal"
label values cfanigx flbl

generate base=0
replace base=1 if (cfanigx>=0) & (cfspeed>=0) & (nnmisrc>=0)

generate CF_exec4=-11
replace CF_exec4 = (cfanigx + cfspeed + nnmisrc) if (cfanigx>=0) & (cfspeed>=0) & (nnmisrc>=0)
label variable CF_exec4 "Executive function index (cognitive)"
generate wave4=1
rename cfanigx cfanig4 
rename cfspeed cfspeed4
rename nnmisrc missed4 
keep idauniq CF_exec4 wave4 age4 cfanig4 cfspeed4 missed4
save "N:\Temp\Temp4.dta", replace

* Wave 5.

use idauniq indager finstat indsex askpx cf* w5lwgt using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
keep if finstat=="C1CM"
sort idauniq
rename indager age5
merge 1:1 idauniq using "N:\ELSA\Datasets\w5_elsa_additional_cognitive_function_vars.dta"
keep if _merge==3

* nnmisrc (letters missed recorded).
* CFspeed (number of items completed recorded).
recode nnmisrc (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define mlbl 0 "9+ missed" 1 "6-8 missed" 2 "4-5 missed" ///
3 "3 missed" 4 "2 missed" 5 "0-1 missed" -1 "N/A" -2 "booklet not received"
label values nnmisrc mlbl

* Verbal Fluency.
generate cfanigX = cfani
recode cfanigX (-1=-1) (-8=-8) (-9=-9) (0/7=0) (8/12=1) (13/15=2) (16/17=3) (18/19=4) (20/21=5) (22/24=6) (25/29=7) (30/max=8) 
label variable cfanigX "Fluency recorded"
label define flbl 0 "0-7" 1 "8-12" 2 "13-15" ///
3 "16-17" 4 "18-19" 5 "20-21" 6 "22-24" 7 "25-29" 8 "30+" -1 "NA" -9 "refusal"
label values cfanigX flbl

* CFspeed (number of items completed recorded).
recode cfspeed (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) (8=7)
label define slbl 0 "0-174" 1 "175-249" 2 "250-274" ///
3 "275-299" 4 "300-324" 5 "325-399" 6 "400-449" 7 "450+" -1 "NA" -2 "booklet not received"
label values cfspeed slbl
generate base=0
replace base=1 if (cfanigX>=0) & (cfspeed>=0) & (nnmisrc>=0)

generate CF_exec5=-11
replace CF_exec5 = (cfanigX + cfspeed + nnmisrc) if (cfanigX>=0) & (cfspeed>=0) & (nnmisrc>=0)
label variable CF_exec5 "Executive function index (cognitive)"
generate wave5=1
rename cfanigX cfanig5 
rename cfspeed cfspeed5 
rename nnmisrc missed5 
keep idauniq CF_exec5 wave5 age5 cfanig5 cfspeed5 missed5 w5lwgt
save "N:\Temp\Temp5.dta", replace



* Put the datasets together.

use "N:\Temp\Temp1.dta", clear
merge 1:1 idauniq using "N:\Temp\Temp2.dta" 
keep if _merge==1|_merge==3
drop _merge
merge 1:1 idauniq using "N:\Temp\Temp3.dta" 
keep if _merge==1|_merge==3
drop _merge
merge 1:1 idauniq using "N:\Temp\Temp4.dta" 
keep if _merge==1|_merge==3
drop _merge
merge 1:1 idauniq using "N:\Temp\Temp5.dta" 
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\SocialParticipation.dta" 
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\CloseRelationships.dta" 
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\SocialContact.dta"
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\Positiveinteraction.dta"
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\CESD.dta"
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\ADL.dta"
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\iADL.dta"
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\wealth.dta"
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\couple.dta"
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\topqual.dta"
keep if _merge==1|_merge==3
count
drop _merge
merge 1:1 idauniq using "N:\Temp\TempMemory.dta"
keep if _merge==1|_merge==3
count
drop _merge
generate allwaves=0
replace allwaves=1 if (wave1==1) & (wave2==1) & (wave3==1) & (wave4==1) & (wave5==1)
tab1 allwaves

* Social Participation.
mvdecode SPart1 SPart2 SPart3 SPart4 SPart5,mv(-2)
egen spmean = rowmean(SPart1 SPart2 SPart3 SPart4 SPart5) 
summ spmean
generate sppm = spmean - r(mean)
* Number of close ties.
egen scmean = rowmean(SC_close1 SC_close2 SC_close3 SC_close4 SC_close5) 
summ scmean 
generate scpm = scmean - r(mean)
* Frequency of contacts.
replace SC_contact1=. if SC_contact1<0
replace SC_contact2=. if SC_contact2<0
replace SC_contact3=. if SC_contact3<0
replace SC_contact4=. if SC_contact4<0
replace SC_contact5=. if SC_contact5<0
egen sfmean = rowmean(SC_contact1 SC_contact2 SC_contact3 SC_contact4 SC_contact5)
summ sfmean
generate sfpm = sfmean - r(mean)
* Positive support (all).
replace PSall1=. if PSall1<0
replace PSall2=. if PSall2<0
replace PSall3=. if PSall3<0
replace PSall4=. if PSall4<0
replace PSall5=. if PSall5<0
egen psamean = rowmean(PSall1 PSall2 PSall3 PSall4 PSall5)
summ psamean
generate psapm = psamean - r(mean)
* Negative support (all).
replace NSall1=. if NSall1<0
replace NSall2=. if NSall2<0
replace NSall3=. if NSall3<0
replace NSall4=. if NSall4<0
replace NSall5=. if NSall5<0
egen nsamean = rowmean(NSall1 NSall2 NSall3 NSall4 NSall5)
summ nsamean
generate nsapm = nsamean - r(mean)
* Spouse (positive).
replace PS_Spouse1=. if PS_Spouse1<0
replace PS_Spouse2=. if PS_Spouse2<0
replace PS_Spouse3=. if PS_Spouse3<0
replace PS_Spouse4=. if PS_Spouse4<0
replace PS_Spouse5=. if PS_Spouse5<0
egen pssmean = rowmean(PS_Spouse1 PS_Spouse2 PS_Spouse3 PS_Spouse4 PS_Spouse5)
summ pssmean
generate psspm = pssmean - r(mean)
* Spouse (negative).
replace NS_Spouse1=. if NS_Spouse1<0
replace NS_Spouse2=. if NS_Spouse2<0
replace NS_Spouse3=. if NS_Spouse3<0
replace NS_Spouse4=. if NS_Spouse4<0
replace NS_Spouse5=. if NS_Spouse5<0
egen nssmean = rowmean(NS_Spouse1 NS_Spouse2 NS_Spouse3 NS_Spouse4 NS_Spouse5)
summ nssmean
generate nsspm = nssmean - r(mean)
* Children (positive).
replace PS_Child1=. if PS_Child1<0
replace PS_Child2=. if PS_Child2<0
replace PS_Child3=. if PS_Child3<0
replace PS_Child4=. if PS_Child4<0
replace PS_Child5=. if PS_Child5<0
egen pscmean = rowmean(PS_Child1 PS_Child2 PS_Child3 PS_Child4 PS_Child5) 
summ pscmean
generate pscpm = pscmean - r(mean)
* Children (negative)
replace NS_Child1=. if NS_Child1<0
replace NS_Child2=. if NS_Child2<0
replace NS_Child3=. if NS_Child3<0
replace NS_Child4=. if NS_Child4<0
replace NS_Child5=. if NS_Child5<0
egen nscmean = rowmean(NS_Child1 NS_Child2 NS_Child3 NS_Child4 NS_Child5) 
summ nscmean
generate nscpm = nscmean - r(mean)
* Family (positive)
replace PS_Family1=. if PS_Family1<0
replace PS_Family2=. if PS_Family2<0
replace PS_Family3=. if PS_Family3<0
replace PS_Family4=. if PS_Family4<0
replace PS_Family5=. if PS_Family5<0
egen psrmean = rowmean(PS_Family1 PS_Family2 PS_Family3 PS_Family4 PS_Family5)
summ psrmean
gen psrpm = psrmean - r(mean)
* Family (negative)
replace NS_Family1=. if NS_Family1<0
replace NS_Family2=. if NS_Family2<0
replace NS_Family3=. if NS_Family3<0
replace NS_Family4=. if NS_Family4<0
replace NS_Family5=. if NS_Family5<0
egen nsrmean = rowmean(NS_Family1 NS_Family2 NS_Family3 NS_Family4 NS_Family5)
summ nsrmean
generate nsrpm = nsrmean - r(mean)
* Friend (positive)
replace PS_Friend1=. if PS_Friend1<0
replace PS_Friend2=. if PS_Friend2<0
replace PS_Friend3=. if PS_Friend3<0
replace PS_Friend4=. if PS_Friend4<0
replace PS_Friend5=. if PS_Friend5<0
egen psfmean = rowmean(PS_Friend1 PS_Friend2 PS_Friend3 PS_Friend4 PS_Friend5)
summ psfmean
generate psfpm = psfmean - r(mean)
* Friend (negative)
replace NS_Friend1=. if NS_Friend1<0
replace NS_Friend2=. if NS_Friend2<0
replace NS_Friend3=. if NS_Friend3<0
replace NS_Friend4=. if NS_Friend4<0
replace NS_Friend5=. if NS_Friend5<0
egen nsfmean = rowmean(NS_Friend1 NS_Friend2 NS_Friend3 NS_Friend4 NS_Friend5)
summ nsfmean
generate nsfpm = nsfmean - r(mean)

* CESD; ADL.
replace CESD1=. if CESD1<0
replace CESD2=. if CESD2<0
replace CESD3=. if CESD3<0
replace CESD4=. if CESD4<0
replace CESD5=. if CESD5<0
replace ADL1=. if ADL1<0
replace ADL2=. if ADL2<0
replace ADL3=. if ADL3<0
replace ADL4=. if ADL4<0
replace ADL5=. if ADL5<0

* Recode age variables.
replace age4 = 68 if idauniq == 106246
replace age3 = 74 if idauniq ==117755
replace age4 = 66 if idauniq ==106062

*age (99= over 90 at assessment)
recode age2 99=93 if age1==99            // n =40 
recode age3 99=95 if age1==99            // n = 28
recode age4 99=97 if age1==99            // n = 15
recode age5 -7=99 if age1==99            // n = 6
recode age1 99=91 
recode age5 -7=90 if inrange(age4,87,89)           //n=80
recode age4 99= 90 if inrange(age3, 87,89)         //n=70
recode age5 -7=92 if age4==90                      //n=44
recode age4 99= 92 if age3==90                      //n=8
recode age5 -7=94 if age4==92                        //n=3
recode age3 99= 91 if inrange(age2, 88,89)            //n=32
recode age4 99=93 if age3==91                     //n=16
recode age5 -7=95 if age4==93                      //n=11
recode age5 -7=90 if age4==. & inrange(age3, 84,86)         //n=5
recode age5 -7=93 if age4==. & inrange(age3, 87,91)           //n=9
recode age2 99= 90 if inrange(age1, 87,89)
recode age3 99=92 if age2==90
recode age4 99=94 if age3==92
recode age5 -7=96 if age4==94
replace age3 = 90 in 10442
replace age4 = 92 in 10442
replace age5 = 94 in 10442
replace age4 = 90 in 11029
replace age5 = 92 in 11029
replace age2= 90 in 11180
replace age3 = 92 in 11180
replace age5 = 96 in 11180
replace age5 = 89 in 539
replace age5 = 90 in 2702
replace age5 = 93 in 5833
replace age5 = 90 in 6602
replace age4 = 90 in 7282
replace age5 = 92 in 7282 
replace age3 = 91 in 7848
replace age5 = 95 in 7848
replace age4 = 93 in 8928
replace age5 = 95 in 8928
replace age5 = 96 in 10329
replace age3 = 62 in 2536
replace age3 = 70 in 8619
replace age3 = 82 in 132
replace age3 = 62 in 7893
recode age2 99=92 if age1==90  // n=9
replace age2 = 86 in 3752
replace age2 = 84 in 7315
replace age3 = 86 in 7315
recode age3 99=94 if age2==92 
recode age3 99=93  if inrange(age1, 87,90)  // n=13
replace age4 = 90 in 858
replace age4 = 95 in 1560
replace age4 = 89 in 2488
replace age4 = 95 in 7167
replace age4 = 93 in 7824
replace age4 = 95 in 9524
* clean the age variables.
gen time1=age1-age1
gen time2=age2-age1
gen time3=age3-age1
gen time4=age4-age1
gen time5=age5-age1
gen agebl_65=age1-65
gen agesq = agebl_65*agebl_65
save "N:\Temp\ExecutiveFunction.dta", replace


********************************
*Executive function
********************************
use "N:\Temp\ExecutiveFunction.dta", clear

sort idauniq
merge m:1 idauniq using "N:\Temp\wave_1_weight_exclude.dta"
drop _merge
drop if exclude==1
drop ADL2 ADL3 ADL4 ADL5 CESD2 CESD3 CESD4 CESD5

reshape long time CF_exec CF_memory cfdscr cflisen cflisd cfprmem SPart SC_close SC_closea SC_contact ///
         PSall NSall PS_Spouse NS_Spouse PS_Child NS_Child PS_Family NS_Family PS_Friend NS_Friend cfanig cfspeed missed ///
		, i(idauniq) j(occasion)
		
xtset idauniq occasion
sort idauniq occasion 
*Social support
gen psawp = PSall - psamean
gen nsawp = NSall - nsamean
gen psswp = PS_Spouse - pssmean
gen nsswp = NS_Spouse - nssmean
gen pscwp = PS_Child - pscmean
gen nscwp = NS_Child - nscmean
gen psrwp = PS_Family - psrmean
gen nsrwp = NS_Family - nsrmean
gen psfwp = PS_Friend - psfmean
gen nsfwp = NS_Friend - nsfmean
recode CF_exec (-11=.)
mvdecode wealthq1,mv(-3)

* Basic model.
xtmixed CF_exec || idauniq:, variance ml covariance(un) residuals(independent)

* All covariates included (n=10,241)
xtmixed CF_exec c.time  ///
      c.agebl_65 c.agesq i.indsex c.topqual c.ADL1 c.CESD1 c.wealthq1 ///
	  c.psapm  c.psawp c.nsapm c.nsawp ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
gen sample1 = e(sample)




***************
* Table 1.
**************
summ CF_exec [aweight=w1wgt] if (occasion==1) & (sample1==1)
summ CF_exec [aweight=w1wgt] if (occasion==2) & (sample1==1)
summ CF_exec [aweight=w1wgt] if (occasion==3) & (sample1==1)
summ CF_exec [aweight=w1wgt] if (occasion==4) & (sample1==1)
summ CF_exec [aweight=w1wgt] if (occasion==5) & (sample1==1)

mvdecode CF_memory, mv(-11/-1)
summ CF_memory [aweight=w1wgt] if (occasion==1) & (sample1==1)
summ CF_memory [aweight=w1wgt] if (occasion==2) & (sample1==1)
summ CF_memory [aweight=w1wgt] if (occasion==3) & (sample1==1)
summ CF_memory [aweight=w1wgt] if (occasion==4) & (sample1==1)
summ CF_memory [aweight=w1wgt] if (occasion==5) & (sample1==1)

* Positive support (all sources)
summ psamean [aweight=w1wgt] if (occasion==1 & sample1==1)
summ psamean [aweight=w1wgt] if (occasion==2 & sample1==1)
summ psamean [aweight=w1wgt] if (occasion==3 & sample1==1)
summ psamean [aweight=w1wgt] if (occasion==4 & sample1==1)
summ psamean [aweight=w1wgt] if (occasion==5 & sample1==1)

* Negative support (all sources)
summ nsamean [aweight=w1wgt] if (occasion==1 & sample1==1)
summ nsamean [aweight=w1wgt] if (occasion==2 & sample1==1)
summ nsamean [aweight=w1wgt] if (occasion==3 & sample1==1)
summ nsamean [aweight=w1wgt] if (occasion==4 & sample1==1)
summ nsamean [aweight=w1wgt] if (occasion==5 & sample1==1)

* Age, years.
summ age1 [aweight=w1wgt] if (occasion==1) & (sample1==1)
summ age2 [aweight=w1wgt] if (occasion==2) & (sample1==1)
summ age3 [aweight=w1wgt] if (occasion==3) & (sample1==1)
summ age4 [aweight=w1wgt] if (occasion==4) & (sample1==1)
summ age5 [aweight=w1wgt] if (occasion==5) & (sample1==1)

* %Male.
tab indsex [aweight=w1wgt] if (occasion==1) & (sample1==1)
tab indsex [aweight=w1wgt] if (occasion==2) & (sample1==1)
tab indsex [aweight=w1wgt] if (occasion==3) & (sample1==1)
tab indsex [aweight=w1wgt] if (occasion==4) & (sample1==1)
tab indsex [aweight=w1wgt] if (occasion==5) & (sample1==1)

* % NoQual.
tab topqual [aweight=w1wgt] if (occasion==1) & (sample1==1)
tab topqual [aweight=w1wgt] if (occasion==2) & (sample1==1)
tab topqual [aweight=w1wgt] if (occasion==3) & (sample1==1)
tab topqual [aweight=w1wgt] if (occasion==4) & (sample1==1)
tab topqual [aweight=w1wgt] if (occasion==5) & (sample1==1)

* %LowWealth.
tab wealthq1 [aweight=w1wgt] if (occasion==1) & (sample1==1)
tab wealthq1 [aweight=w1wgt] if (occasion==2) & (sample1==1)
tab wealthq1 [aweight=w1wgt] if (occasion==3) & (sample1==1)
tab wealthq1 [aweight=w1wgt] if (occasion==4) & (sample1==1)
tab wealthq1 [aweight=w1wgt] if (occasion==5) & (sample1==1)

* CESD.
summ CESD1 [aweight=w1wgt] if (occasion==1 & sample1==1)
summ CESD1 [aweight=w1wgt] if (occasion==2 & sample1==1)
summ CESD1 [aweight=w1wgt] if (occasion==3 & sample1==1)
summ CESD1 [aweight=w1wgt] if (occasion==4 & sample1==1)
summ CESD1 [aweight=w1wgt] if (occasion==5 & sample1==1)

* ADLs.
summ ADL1 [aweight=w1wgt] if (occasion==1 & sample1==1)
summ ADL1 [aweight=w1wgt] if (occasion==2 & sample1==1)
summ ADL1 [aweight=w1wgt] if (occasion==3 & sample1==1)
summ ADL1 [aweight=w1wgt] if (occasion==4 & sample1==1)
summ ADL1 [aweight=w1wgt] if (occasion==5 & sample1==1)


***********
**Table 2 
***********
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psapm c.time#c.psapm c.psawp c.time#c.psawp c.psapm#c.psawp ///
c.nsapm c.time#c.nsapm c.nsawp c.time#c.nsawp c.nsapm#c.nsawp ///
if sample1==1 ///
,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)


************************
*Web Table 2
**Interactions with sex.
************************
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psapm c.time#c.psapm c.psawp c.time#c.psawp c.psapm#c.psawp ///
c.psapm#i.indsex c.psapm#c.time#i.indsex ///
c.psawp#i.indsex c.psawp#c.time#i.indsex ///
c.psapm#c.psawp#i.indsex ///
c.nsapm c.time#c.nsapm c.nsawp c.time#c.nsawp c.nsapm#c.nsawp ///
c.nsapm#i.indsex c.nsapm#c.time#i.indsex ///
c.nsawp#i.indsex c.nsawp#c.time#i.indsex ///
c.nsapm#c.nsawp#i.indsex ///
if (sample1==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 

*number of tests with those with covariate values.

preserve
keep if sample1==1
collapse (sum) practice=sample1,by(idauniq)
save "N:\Temp\Temp2.dta", replace
restore
merge m:1 idauniq using "N:\Temp\Temp2.dta"


********************************************************************
* Table 3: source-specific
* Web Table 4: took part in all 5 waves
* Web Table 5: source-specific with adjustment for practice effects
********************************************************************

*Spouse:Men.
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Spouse:Men (practice effects).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp i.practice ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Spouse:Men (all 5 waves).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp ///
if (sample1==1 & indsex==1 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 
 
*Spouse:Women.
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Spouse:Women (practice effects).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp i.practice ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Spouse:Women (all 5 waves).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp ///
if (sample1==1 & indsex==2 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 
 
 *Children:Men.
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Children:Men (practice effects)
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp i.practice ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 
*Children:Men (all 5 waves)
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp ///
if (sample1==1 & indsex==1 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 
*Children:Women.
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Children:Women (practice effects).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp i.practice ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Children:Women (all 5 waves)
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp ///
if (sample1==1 & indsex==2 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 

*Family:Men.
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Family:Men (practice effects).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp i.practice ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 
*Family:Men (all waves).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp ///
if (sample1==1 & indsex==1 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 
*Family:Women.
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 
*Family:Women (practice effects).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp i.practice ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Family:women (all waves).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp ///
if (sample1==1 & indsex==2 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 
 
*Friends:Men.
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Friends:Men (practice effects).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp i.practice ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Friends:Men (all waves).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp ///
if (sample1==1 & indsex==1 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 
*Friends:Women.
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Friends:Women (practice effects).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp i.practice ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 
*Friends:Women (all waves).
xtmixed CF_exec c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp ///
if (sample1==1 & indsex==2 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 

































 
 
 
 
 
 
 
 
 

































 

 










