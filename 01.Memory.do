**********************************************************************************************
*** AJE Paper
*Association of Social Support and Cognitive Aging Modified by Sex and Relationship Type: 
*A Prospective Investigation in the English Longitudinal Study of Ageing 
**********************************************************************************************

clear
use idauniq w1wgt hedib01-hedib10 using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
* Exclude osteoporosis.
egen exclude = anycount(hedib01-hedib10),values(6 8 9)
recode exclude (2=1)
keep idauniq w1wgt exclude
save "N:\Temp\wave_1_weight_exclude",replace

*merge 1:1 idauniq using "C:\Temp\SocialParticipation.dta" 
*merge 1:1 idauniq using "C:\Temp\CloseRelationships.dta" 
*merge 1:1 idauniq using "C:\Temp\SocialContact.dta"
*merge 1:1 idauniq using "C:\Temp\Positiveinteraction.dta"
*merge 1:1 idauniq using "C:\Temp\CESD.dta"
*merge 1:1 idauniq using "C:\Temp\ADL.dta"
*merge 1:1 idauniq using "C:\Temp\iADL.dta"
*merge 1:1 idauniq using "C:\Temp\wealth.dta"
*merge 1:1 idauniq using "C:\Temp\couple.dta"
*merge 1:1 idauniq using "C:\Temp\topqual.dta"
*merge 1:1 idauniq using "C:\Temp\TempMemory.dta"

*************************
*Social Participation.
*************************

* Wave 1.
clear
use idauniq indsex finstat spcaa spcac spcab1 spcab2 spcab3 scorg1 scorga2 scorg1-scorg8 spcin ///
spcinb sprest sprestb spmus spmusb sptea spteab w1wgt askpx scptpa1-scptpa9 using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
renvars, lower
keep if inrange(w1wgt,0.2,8.9)
rename scorga2 scorg2
* social participation.
* scorg1-scorg8
gen spa = -2
gen spb = -2
gen spc = -2
gen spd = -2
gen spe = -2
gen spf = -2
gen spg = -2
gen sph = -2
generate baseSP=0
replace baseSP=1 if (scorg1>=0) & (scorg2>=0) & (scorg3>=0) & (scorg4>=0) & (scorg5>=0) & (scorg6>=0) & (scorg7>=0) & (scorg8>=0)
replace spa = 0 if scorg1==0
replace spb = 0 if scorg2==0
replace spc = 0 if scorg3==0
replace spd = 0 if scorg4==0
replace spe = 0 if scorg5==0
replace spf = 0 if scorg6==0
replace spg = 0 if scorg7==0
replace sph = 0 if scorg8==0
replace spa = 1 if scorg1==1
replace spb = 1 if scorg2==1
replace spc = 1 if scorg3==1
replace spd = 1 if scorg4==1
replace spe = 1 if scorg5==1
replace spf = 1 if scorg6==1
replace spg = 1 if scorg7==1
replace sph = 1 if scorg8==1
generate SPart1 = -2
replace SPart1 = (spa + spb + spc + spd + spe + spf + spg + sph) if baseSP==1
label variable SPart1 "Social participation at Wave 1"
keep idauniq SPart1
save "N:\Temp\Temp1.dta", replace

* Wave 2.
clear
use idauniq finstat indsex w2wgt askpx s* er*  using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
renvars,lower
keep if inrange(w2wgt,0.02,10)
keep if finstat=="C1CM"
*social participation.
*scorg1-scorg8
rename scorg01 scorg1
rename scorg02 scorg2
rename scorg03 scorg3
rename scorg04 scorg4
rename scorg05 scorg5
rename scorg06 scorg6
rename scorg07 scorg7
rename scorg08 scorg8 
gen spa = -2
gen spb = -2
gen spc = -2
gen spd = -2
gen spe = -2
gen spf = -2
gen spg = -2
gen sph = -2
generate baseSP=0
replace baseSP=1 if (scorg1>=0) & (scorg2>=0) & (scorg3>=0) & (scorg4>=0) & (scorg5>=0) & (scorg6>=0) & (scorg7>=0) & (scorg8>=0)
replace spa = 0 if scorg1==0
replace spb = 0 if scorg2==0
replace spc = 0 if scorg3==0
replace spd = 0 if scorg4==0
replace spe = 0 if scorg5==0
replace spf = 0 if scorg6==0
replace spg = 0 if scorg7==0
replace sph = 0 if scorg8==0
replace spa = 1 if scorg1==1
replace spb = 1 if scorg2==1
replace spc = 1 if scorg3==1
replace spd = 1 if scorg4==1
replace spe = 1 if scorg5==1
replace spf = 1 if scorg6==1
replace spg = 1 if scorg7==1
replace sph = 1 if scorg8==1
generate SPart2 = -2
replace SPart2 = (spa + spb + spc + spd + spe + spf + spg + sph) if baseSP==1
label variable SPart2 "Social participation at Wave 2"
keep idauniq SPart2
save "N:\Temp\Temp2.dta", replace

* Wave 3.
clear
use idauniq finstat indsex w3lwgt askpx s* er*  using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
renvars,lower
keep if finstat=="C1CM"
* social participation.
* scorg1-scorg8
rename scorg01 scorg1
rename scorg02 scorg2
rename scorg03 scorg3
rename scorg04 scorg4
rename scorg05 scorg5
rename scorg06 scorg6
rename scorg07 scorg7
rename scorg08 scorg8 
gen spa = -2
gen spb = -2
gen spc = -2
gen spd = -2
gen spe = -2
gen spf = -2
gen spg = -2
gen sph = -2
generate baseSP=0
replace baseSP=1 if (scorg1>=0) & (scorg2>=0) & (scorg3>=0) & (scorg4>=0) & (scorg5>=0) & (scorg6>=0) & (scorg7>=0) & (scorg8>=0)
replace spa = 0 if scorg1==0
replace spb = 0 if scorg2==0
replace spc = 0 if scorg3==0
replace spd = 0 if scorg4==0
replace spe = 0 if scorg5==0
replace spf = 0 if scorg6==0
replace spg = 0 if scorg7==0
replace sph = 0 if scorg8==0
replace spa = 1 if scorg1==1
replace spb = 1 if scorg2==1
replace spc = 1 if scorg3==1
replace spd = 1 if scorg4==1
replace spe = 1 if scorg5==1
replace spf = 1 if scorg6==1
replace spg = 1 if scorg7==1
replace sph = 1 if scorg8==1
generate SPart3 = -2
replace SPart3 = (spa + spb + spc + spd + spe + spf + spg + sph) if baseSP==1
label variable SPart3 "Social participation at Wave 3"
keep idauniq SPart3
save "N:\Temp\Temp3.dta", replace

* Wave 4.
clear
use idauniq indsex finstat w4lwgt askpx s* er*  using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
renvars,lower
keep if finstat=="C1CM"
* social participation.
* scorg1-scorg8
rename scorg01 scorg1
rename scorg02 scorg2
rename scorg03 scorg3
rename scorg04 scorg4
rename scorg05 scorg5
rename scorg06 scorg6
rename scorg07 scorg7
rename scorg08 scorg8 
gen spa = -2
gen spb = -2
gen spc = -2
gen spd = -2
gen spe = -2
gen spf = -2
gen spg = -2
gen sph = -2
generate baseSP=0
replace baseSP=1 if (scorg1>=0) & (scorg2>=0) & (scorg3>=0) & (scorg4>=0) & (scorg5>=0) & (scorg6>=0) & (scorg7>=0) & (scorg8>=0)
replace spa = 0 if scorg1==0
replace spb = 0 if scorg2==0
replace spc = 0 if scorg3==0
replace spd = 0 if scorg4==0
replace spe = 0 if scorg5==0
replace spf = 0 if scorg6==0
replace spg = 0 if scorg7==0
replace sph = 0 if scorg8==0
replace spa = 1 if scorg1==1
replace spb = 1 if scorg2==1
replace spc = 1 if scorg3==1
replace spd = 1 if scorg4==1
replace spe = 1 if scorg5==1
replace spf = 1 if scorg6==1
replace spg = 1 if scorg7==1
replace sph = 1 if scorg8==1
generate SPart4 = -2
replace SPart4 = (spa + spb + spc + spd + spe + spf + spg + sph) if baseSP==1
label variable SPart4 "Social participation at Wave 4"
keep idauniq SPart4
save "N:\Temp\Temp4.dta", replace

*Wave 5.
clear
use idauniq finstat indsex w5lwgt askpx s* er*  using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
renvars,lower
keep if finstat=="C1CM"
rename scorg01 scorg1
rename scorg02 scorg2
rename scorg03 scorg3
rename scorg04 scorg4
rename scorg05 scorg5
rename scorg06 scorg6
rename scorg07 scorg7
rename scorg08 scorg8 
gen spa = -2
gen spb = -2
gen spc = -2
gen spd = -2
gen spe = -2
gen spf = -2
gen spg = -2
gen sph = -2
generate baseSP=0
replace baseSP=1 if (scorg1>=0) & (scorg2>=0) & (scorg3>=0) & (scorg4>=0) & (scorg5>=0) & (scorg6>=0) & (scorg7>=0) & (scorg8>=0)
replace spa = 0 if scorg1==0
replace spb = 0 if scorg2==0
replace spc = 0 if scorg3==0
replace spd = 0 if scorg4==0
replace spe = 0 if scorg5==0
replace spf = 0 if scorg6==0
replace spg = 0 if scorg7==0
replace sph = 0 if scorg8==0
replace spa = 1 if scorg1==1
replace spb = 1 if scorg2==1
replace spc = 1 if scorg3==1
replace spd = 1 if scorg4==1
replace spe = 1 if scorg5==1
replace spf = 1 if scorg6==1
replace spg = 1 if scorg7==1
replace sph = 1 if scorg8==1
generate SPart5 = -2
replace SPart5 = (spa + spb + spc + spd + spe + spf + spg + sph) if baseSP==1
label variable SPart5 "Social participation at Wave 5"
keep idauniq SPart5
save "N:\Temp\Temp5.dta", replace

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
keep idauniq SPart1 SPart2 SPart3 SPart4 SPart5
sort idauniq
save "N:\Temp\SocialParticipation.dta", replace


*Close relationships.
*Have any children? How many close to.
*Have any friends? How many close to.
*Have any family members / relatives? How many close to.
*How close to spouse?

* Wave 1.
clear
use idauniq finstat scnosc scnoscc indager sc_rec w1wgt askpx scqola scchd scfrd scfam scchdm scfrdm scfamm scptr scptrg  using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
generate flag=0
replace flag=1 if inrange(scchd,1,2)|inrange(scfrd,1,2)|inrange(scfam,1,2)|inrange(scptr,1,2)
keep if flag==1
* Domains.
generate a1=.
generate b1=.
generate c1=.
generate d1=.
replace a1=0 if scchd==2
replace b1=0 if scfrd==2
replace c1=0 if scfam==2
replace d1=0 if scptr==2
replace a1=1 if scchd==1
replace b1=1 if scfrd==1
replace c1=1 if scfam==1
replace d1=1 if scptr==1

* # close ties.
generate a2=.
generate b2=.
generate c2=.
generate d2=.

* Children (a).
replace a2=0 if scchd==2
replace a2=0 if scchd==1 & scchdm==0
replace a2=0 if scchd==1 & scchdm==-9
replace a2=0 if scchd==1 & scchdm==-8
replace a2=scchdm if scchd==1 & scchdm>=1
egen Za2 = std(a2) if a2>=0

* Friends (b).
replace b2=0 if scfrd==2
replace b2=0 if (scfrd==1 & scfrdm==0)
replace b2=0 if (scfrd==1 & scfrdm==-9)
replace b2=scfrdm if (scfrd==1 & scfrdm>=1)
egen Zb2 = std(b2) if b2>=0

* Family (c).
replace c2=0 if (scfam==1 & scfamm==0)
replace c2=0 if (scfam==2)
replace c2=0 if (scfam==1 & scfamm==-9)
replace c2=scfamm if (scfam==1 & scfamm>=1)
egen Zc2 = std(c2) if c2>=0

* Spouse (d).
replace d2=0 if (scptr==1) & inrange(scptrg,3,4)
replace d2=0 if (scptr==2) 
replace d2=0 if (scptr==1) & scptrg==-9
replace d2=1 if (scptr==1) & inrange(scptrg,1,2)

egen domains = rowtotal(a1 b1 c1 d1)
egen close = rowtotal(Za2 Zb2 Zc2)
replace close = (close + d2) if inrange(scptr,1,2)

generate SC_close1 = .
replace SC_close1 = (close/domains) 
replace SC_close1=0 if (domains==0)
label variable SC_close1 "Close relationships at Wave 1 (children, friends, family,spouse)"

* Unstandardized.
egen closea = rowtotal(a2 b2 c2)
replace closea = (closea + d2) if inrange(scptr,1,2)
generate SC_closea1 = .
replace SC_closea1 = (closea/domains) 
replace SC_closea1=0 if (domains==0)
generate wave1=1
keep idauniq wave1 SC_close1 SC_closea1
save "N:\Temp\Temp1.dta", replace

* Wave 2.
clear
use idauniq finstat w2wgt askpx scchd scfrd scfam scchdm scfrdm scfamm scptr scptrg using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
keep if inrange(w2wgt,0.1,20)
keep if finstat=="C1CM"
generate flag=0
replace flag=1 if inrange(scchd,1,2)|inrange(scfrd,1,2)|inrange(scfam,1,2)|inrange(scptr,1,2)
keep if flag==1
* Domains.
generate a1=.
generate b1=.
generate c1=.
generate d1=.
replace a1=0 if scchd==2
replace b1=0 if scfrd==2
replace c1=0 if scfam==2
replace d1=0 if scptr==2
replace a1=1 if scchd==1
replace b1=1 if scfrd==1
replace c1=1 if scfam==1
replace d1=1 if scptr==1
* # close ties.
generate a2=.
generate b2=.
generate c2=.
generate d2=.
* Children (a).
replace a2=0 if scchd==2
replace a2=0 if scchd==1 & scchdm==0
replace a2=0 if scchd==1 & scchdm==-9
replace a2=0 if scchd==1 & scchdm==-8
replace a2=scchdm if scchd==1 & scchdm>=1
egen Za2 = std(a2) if a2>=0

* Friends (b).
replace b2=0 if scfrd==2
replace b2=0 if (scfrd==1 & scfrdm==0)
replace b2=0 if (scfrd==1 & scfrdm==-9)
replace b2=scfrdm if (scfrd==1 & scfrdm>=1)
egen Zb2 = std(b2) if b2>=0

* Family (c).
replace c2=0 if (scfam==1 & scfamm==0)
replace c2=0 if (scfam==2)
replace c2=0 if (scfam==1 & scfamm==-9)
replace c2=scfamm if (scfam==1 & scfamm>=1)
egen Zc2 = std(c2) if c2>=0

* Spouse (d).
replace d2=0 if (scptr==1) & inrange(scptrg,3,4)
replace d2=0 if (scptr==2) 
replace d2=0 if (scptr==1) & scptrg==-9
replace d2=1 if (scptr==1) & inrange(scptrg,1,2)
egen domains = rowtotal(a1 b1 c1 d1)
egen close = rowtotal(Za2 Zb2 Zc2)
replace close = (close + d2) if inrange(scptr,1,2)

generate SC_close2 = .
replace SC_close2 = (close/domains) 
replace SC_close2=0 if (domains==0)
label variable SC_close2 "Close relationships at Wave 2 (children, friends, family,spouse)"

* Unstandardized.
egen closea = rowtotal(a2 b2 c2)
replace closea = (closea + d2) if inrange(scptr,1,2)
generate SC_closea2 = .
replace SC_closea2 = (closea/domains) 
replace SC_closea2=0 if (domains==0)
generate wave2=1
keep idauniq wave2 SC_close2 SC_closea2
save "N:\Temp\Temp2.dta", replace

* Wave 3.

clear
use idauniq finstat w3lwgt askpx scchd scfrd scfam scchdm scfrdm scfamm scptr scptrg using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
keep if finstat=="C1CM"
generate flag=0
replace flag=1 if inrange(scchd,1,2)|inrange(scfrd,1,2)|inrange(scfam,1,2)|inrange(scptr,1,2)
keep if flag==1

* Domains.
generate a1=.
generate b1=.
generate c1=.
generate d1=.
replace a1=0 if scchd==2
replace b1=0 if scfrd==2
replace c1=0 if scfam==2
replace d1=0 if scptr==2
replace a1=1 if scchd==1
replace b1=1 if scfrd==1
replace c1=1 if scfam==1
replace d1=1 if scptr==1
* # close ties.
generate a2=.
generate b2=.
generate c2=.
generate d2=.
* Children (a).
replace a2=0 if scchd==2
replace a2=0 if scchd==1 & scchdm==0
replace a2=0 if scchd==1 & scchdm==-9
replace a2=0 if scchd==1 & scchdm==-8
replace a2=scchdm if scchd==1 & scchdm>=1
egen Za2 = std(a2) if a2>=0
* Friends (b).
replace b2=0 if scfrd==2
replace b2=0 if (scfrd==1 & scfrdm==0)
replace b2=0 if (scfrd==1 & scfrdm==-9)
replace b2=scfrdm if (scfrd==1 & scfrdm>=1)
egen Zb2 = std(b2) if b2>=0
* Family (c).
replace c2=0 if (scfam==1 & scfamm==0)
replace c2=0 if (scfam==2)
replace c2=0 if (scfam==1 & scfamm==-9)
replace c2=scfamm if (scfam==1 & scfamm>=1)
egen Zc2 = std(c2) if c2>=0
* Spouse (d).
replace d2=0 if (scptr==1) & inrange(scptrg,3,4)
replace d2=0 if (scptr==2) 
replace d2=0 if (scptr==1) & scptrg==-9
replace d2=1 if (scptr==1) & inrange(scptrg,1,2)
egen domains = rowtotal(a1 b1 c1 d1)
egen close = rowtotal(Za2 Zb2 Zc2)
replace close = (close + d2) if inrange(scptr,1,2)
generate SC_close3 = .
replace SC_close3 = (close/domains) 
replace SC_close3=0 if (domains==0)
label variable SC_close3 "Close relationships at Wave 3 (children, friends, family,spouse)"

* Unstandardized.
egen closea = rowtotal(a2 b2 c2)
replace closea = (closea + d2) if inrange(scptr,1,2)
generate SC_closea3 = .
replace SC_closea3 = (closea/domains) 
replace SC_closea3=0 if (domains==0)
generate wave3=1
keep idauniq wave3 SC_close3 SC_closea3
save "N:\Temp\Temp3.dta", replace


* Wave 4.
clear
use idauniq finstat w4lwgt askpx scchd scfrd scfam scchdm scfrdm scfamm scptr scptrg using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
keep if finstat=="C1CM"
generate flag=0
replace flag=1 if inrange(scchd,1,2)|inrange(scfrd,1,2)|inrange(scfam,1,2)|inrange(scptr,1,2)
keep if flag==1

* Domains.
generate a1=.
generate b1=.
generate c1=.
generate d1=.
replace a1=0 if scchd==2
replace b1=0 if scfrd==2
replace c1=0 if scfam==2
replace d1=0 if scptr==2
replace a1=1 if scchd==1
replace b1=1 if scfrd==1
replace c1=1 if scfam==1
replace d1=1 if scptr==1
* # close ties.
generate a2=.
generate b2=.
generate c2=.
generate d2=.
* Children (a).
replace a2=0 if scchd==2
replace a2=0 if scchd==1 & scchdm==0
replace a2=0 if scchd==1 & scchdm==-9
replace a2=0 if scchd==1 & scchdm==-8
replace a2=scchdm if scchd==1 & scchdm>=1
egen Za2 = std(a2) if a2>=0
* Friends (b).
replace b2=0 if scfrd==2
replace b2=0 if (scfrd==1 & scfrdm==0)
replace b2=0 if (scfrd==1 & scfrdm==-9)
replace b2=scfrdm if (scfrd==1 & scfrdm>=1)
egen Zb2 = std(b2) if b2>=0
* Family (c).
replace c2=0 if (scfam==1 & scfamm==0)
replace c2=0 if (scfam==2)
replace c2=0 if (scfam==1 & scfamm==-9)
replace c2=scfamm if (scfam==1 & scfamm>=1)
egen Zc2 = std(c2) if c2>=0
* Spouse (d).
replace d2=0 if (scptr==1) & inrange(scptrg,3,4)
replace d2=0 if (scptr==2) 
replace d2=0 if (scptr==1) & scptrg==-9
replace d2=1 if (scptr==1) & inrange(scptrg,1,2)
egen domains = rowtotal(a1 b1 c1 d1)
egen close = rowtotal(Za2 Zb2 Zc2)
replace close = (close + d2) if inrange(scptr,1,2)
generate SC_close4 = .
replace SC_close4 = (close/domains) 
replace SC_close4=0 if (domains==0)
label variable SC_close4 "Close relationships at Wave 4 (children, friends, family,spouse)"

* Unstandardized.
egen closea = rowtotal(a2 b2 c2)
replace closea = (closea + d2) if inrange(scptr,1,2)
generate SC_closea4 = .
replace SC_closea4 = (closea/domains) 
replace SC_closea4=0 if (domains==0)
generate wave4=1
keep idauniq wave4 SC_close4 SC_closea4
save "N:\Temp\Temp4.dta", replace

* Wave 5.
clear
use idauniq finstat w5lwgt askpx scchd scfrd scfam scchdm scfrdm scfamm scptr scptrg using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
keep if finstat=="C1CM"
generate flag=0
replace flag=1 if inrange(scchd,1,2)|inrange(scfrd,1,2)|inrange(scfam,1,2)|inrange(scptr,1,2)
keep if flag==1
* Domains.
generate a1=.
generate b1=.
generate c1=.
generate d1=.
replace a1=0 if scchd==2
replace b1=0 if scfrd==2
replace c1=0 if scfam==2
replace d1=0 if scptr==2
replace a1=1 if scchd==1
replace b1=1 if scfrd==1
replace c1=1 if scfam==1
replace d1=1 if scptr==1
* # close ties.
generate a2=.
generate b2=.
generate c2=.
generate d2=.
* Children (a).
replace a2=0 if scchd==2
replace a2=0 if scchd==1 & scchdm==0
replace a2=0 if scchd==1 & scchdm==-9
replace a2=0 if scchd==1 & scchdm==-8
replace a2=scchdm if scchd==1 & scchdm>=1
egen Za2 = std(a2) if a2>=0
* Friends (b).
replace b2=0 if scfrd==2
replace b2=0 if (scfrd==1 & scfrdm==0)
replace b2=0 if (scfrd==1 & scfrdm==-9)
replace b2=scfrdm if (scfrd==1 & scfrdm>=1)
egen Zb2 = std(b2) if b2>=0
* Family (c).
replace c2=0 if (scfam==1 & scfamm==0)
replace c2=0 if (scfam==2)
replace c2=0 if (scfam==1 & scfamm==-9)
replace c2=scfamm if (scfam==1 & scfamm>=1)
egen Zc2 = std(c2) if c2>=0
* Spouse (d).
replace d2=0 if (scptr==1) & inrange(scptrg,3,4)
replace d2=0 if (scptr==2) 
replace d2=0 if (scptr==1) & scptrg==-9
replace d2=1 if (scptr==1) & inrange(scptrg,1,2)
egen domains = rowtotal(a1 b1 c1 d1)
egen close = rowtotal(Za2 Zb2 Zc2)
replace close = (close + d2) if inrange(scptr,1,2)
generate SC_close5 = .
replace SC_close5 = (close/domains) 
replace SC_close5=0 if (domains==0)
label variable SC_close5 "Close relationships at Wave 5 (children, friends, family,spouse)"

* Unstandardized.
egen closea = rowtotal(a2 b2 c2)
replace closea = (closea + d2) if inrange(scptr,1,2)
generate SC_closea5 = .
replace SC_closea5 = (closea/domains) 
replace SC_closea5=0 if (domains==0)
generate wave5=1
keep idauniq wave5 SC_close5 SC_closea5
save "N:\Temp\Temp5.dta", replace


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
keep idauniq SC_close1 SC_close2 SC_close3 SC_close4 SC_close5 SC_closea1 SC_closea2 SC_closea3 SC_closea4 SC_closea5
sort idauniq
save "N:\Temp\CloseRelationships.dta", replace

*Social contact.

*ELSA Wave 1.
clear
use idauniq finstat w1wgt scchd scfrd scfam scchdg scchdh scchdi scfrdg scfrdh scfrdi scfamg scfmh scfami using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
rename scfmh scfamh 
* Children outside household (meet-up; phone; email)
* No children scored as zero contact.
* high scores = more contact.
recode scchdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scchdg=0 if scchd==2
replace scchdh=0 if scchd==2
replace scchdi=0 if scchd==2

* Friends (meet-up; phone; email)
* No friends scored as zero contact.
* high scores = more contact.
recode scfrdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfrdg=0 if scfrd==2
replace scfrdh=0 if scfrd==2
replace scfrdi=0 if scfrd==2

* Family members (meet-up; phone; email)
* No family members scored as zero contact.
* high scores = more contact.
recode scfamg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfamh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfami (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfamg=0 if scfam==2
replace scfamh=0 if scfam==2
replace scfami=0 if scfam==2

generate SC_contact1=-2
replace SC_contact1=(scchdg + scchdh + scchdi + scfrdg + scfrdh + scfrdi + scfamg + scfamh + scfami)
label variable SC_contact1 "Social contact (children, friends, family)"
generate wave1=1
keep idauniq wave1 SC_contact1 
save "N:\Temp\Temp1.dta", replace


* ELSA Wave 2.

clear
use idauniq finstat w2wgt scchd scfrd scfam scchdg scchdh scchdi scfrdg scfrdh scfrdi scfamg scfamh scfami using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
keep if inrange(w2wgt,0.2,90)
* Children outside household (meet-up; phone; email)
* No children scored as zero contact.
* high scores = more contact.
recode scchdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scchdg=0 if scchd==2
replace scchdh=0 if scchd==2
replace scchdi=0 if scchd==2
* Friends (meet-up; phone; email)
* No friends scored as zero contact.
* high scores = more contact.
recode scfrdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfrdg=0 if scfrd==2
replace scfrdh=0 if scfrd==2
replace scfrdi=0 if scfrd==2
* Family members (meet-up; phone; email)
* No family members scored as zero contact.
* high scores = more contact.
recode scfamg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfamh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfami (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfamg=0 if scfam==2
replace scfamh=0 if scfam==2
replace scfami=0 if scfam==2
generate SC_contact2=-2
replace SC_contact2=(scchdg + scchdh + scchdi + scfrdg + scfrdh + scfrdi + scfamg + scfamh + scfami)
label variable SC_contact2 "Social contact (children, friends, family)"
generate wave2=1
keep idauniq wave2 SC_contact2
save "N:\Temp\Temp2.dta", replace

* ELSA Wave 3.
clear
use idauniq finstat w3lwgt scchd scfrd scfam scchdg scchdh scchdi scfrdg scfrdh scfrdi scfamg scfamh scfami using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
keep if inrange(w3lwgt,0.2,90)
* Children outside household (meet-up; phone; email)
* No children scored as zero contact.
* high scores = more contact.
recode scchdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scchdg=0 if scchd==2
replace scchdh=0 if scchd==2
replace scchdi=0 if scchd==2
* Friends (meet-up; phone; email)
* No friends scored as zero contact.
* high scores = more contact.
recode scfrdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfrdg=0 if scfrd==2
replace scfrdh=0 if scfrd==2
replace scfrdi=0 if scfrd==2
* Family members (meet-up; phone; email)
* No family members scored as zero contact.
* high scores = more contact.
recode scfamg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfamh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfami (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfamg=0 if scfam==2
replace scfamh=0 if scfam==2
replace scfami=0 if scfam==2
generate SC_contact3=-2
replace SC_contact3=(scchdg + scchdh + scchdi + scfrdg + scfrdh + scfrdi + scfamg + scfamh + scfami)
label variable SC_contact3 "Social contact (children, friends, family)"
generate wave3=1
keep idauniq wave3 SC_contact3
save "N:\Temp\Temp3.dta", replace

* Wave 4.
clear
use idauniq finstat w4lwgt scchd scfrd scfam scchdg scchdh scchdi scfrdg scfrdh scfrdi scfamg scfmh scfami using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
keep if inrange(w4lwgt,0.2,90)
rename scfmh scfamh
* Children outside household (meet-up; phone; email)
* No children scored as zero contact.
* high scores = more contact.
recode scchdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scchdg=0 if scchd==2
replace scchdh=0 if scchd==2
replace scchdi=0 if scchd==2
* Friends (meet-up; phone; email)
* No friends scored as zero contact.
* high scores = more contact.
recode scfrdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfrdg=0 if scfrd==2
replace scfrdh=0 if scfrd==2
replace scfrdi=0 if scfrd==2
* Family members (meet-up; phone; email)
* No family members scored as zero contact.
* high scores = more contact.
recode scfamg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfamh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfami (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfamg=0 if scfam==2
replace scfamh=0 if scfam==2
replace scfami=0 if scfam==2
generate SC_contact4=-2
replace SC_contact4=(scchdg + scchdh + scchdi + scfrdg + scfrdh + scfrdi + scfamg + scfamh + scfami)
label variable SC_contact4 "Social contact (children, friends, family)"
generate wave4=1
keep idauniq wave4 SC_contact4 
save "N:\Temp\Temp4.dta", replace

* Wave 5.

clear
use idauniq finstat w5lwgt scchd scfrd scfam scchdg scchdh scchdi scfrdg scfrdh scfrdi scfamg scfamh scfami using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta"
keep if inrange(w5lwgt,0.2,90)
* Children outside household (meet-up; phone; email)
* No children scored as zero contact.
* high scores = more contact.
recode scchdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scchdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scchdg=0 if scchd==2
replace scchdh=0 if scchd==2
replace scchdi=0 if scchd==2
* Friends (meet-up; phone; email)
* No friends scored as zero contact.
* high scores = more contact.
recode scfrdg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfrdi (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfrdg=0 if scfrd==2
replace scfrdh=0 if scfrd==2
replace scfrdi=0 if scfrd==2
* Family members (meet-up; phone; email)
* No family members scored as zero contact.
* high scores = more contact.
recode scfamg (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfamh (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
recode scfami (1=3) (2=3) (3=2) (4=2) (5=1) (6=1)
replace scfamg=0 if scfam==2
replace scfamh=0 if scfam==2
replace scfami=0 if scfam==2
generate SC_contact5=-2
replace SC_contact5=(scchdg + scchdh + scchdi + scfrdg + scfrdh + scfrdi + scfamg + scfamh + scfami)
label variable SC_contact5 "Social contact (children, friends, family)"
generate wave5=1
keep idauniq wave5 SC_contact5 
save "N:\Temp\Temp5.dta", replace


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
* Close relationships.
keep idauniq SC_contact1 SC_contact2 SC_contact3 SC_contact4 SC_contact5
sort idauniq
save "N:\Temp\SocialContact.dta", replace


*Positive Interaction.
* ELSA Wave 1.

clear
use idauniq finstat w1wgt scchd scchda scchdb scchdc scchdd scchde scchdf scfrda scfrdb scfrdc scfrd scfrdd scfrde scfrdf ///
scfam scfama scfamb scfamc scfamd scfame scfamf scptr scptra scptrb scptrc scptrd scptre scptrf scptrg using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
mvdecode scptra scptrb scptrc, mv(-9 -8 -1)
mvdecode scptrd scptre scptrf, mv(-9 -8 -1)
mvdecode scchda scchdb scchdc, mv(-9 -8 -1)
mvdecode scchdd scchde scchdf, mv(-9 -8 -1)
mvdecode scfrda scfrdb scfrdc, mv(-9 -8 -1)
mvdecode scfrdd scfrde scfrdf, mv(-9 -8 -1)
mvdecode scfama scfamb scfamc, mv(-9 -8 -1)
mvdecode scfamd scfame scfamf, mv(-9 -8 -1)

* Spouse.
recode scptra (1=3) (2=2) (3=1) (4=0)
recode scptrb (1=3) (2=2) (3=1) (4=0)
recode scptrc (1=3) (2=2) (3=1) (4=0)
* Negative (Spouse).
recode scptrd (1=3) (2=2) (3=1) (4=0)
recode scptre (1=3) (2=2) (3=1) (4=0)
recode scptrf (1=3) (2=2) (3=1) (4=0)
egen PS_Spouse1 = rowtotal(scptra scptrb scptrc), missing
egen NS_Spouse1 = rowtotal(scptrd scptre scptrf), missing 
* recode no spouse to zero.
replace PS_Spouse1=0 if scptr==2
replace NS_Spouse1=0 if scptr==2
label variable PS_Spouse1 "Positive interaction spouse (no spouse zero)"
label variable NS_Spouse1 "Negative interaction spouse (no spouse zero)"

* Children (3 positive items): high scores = high positive.
* Children (3 negative items): high scores = high negative.
* Positive.
recode scchda (1=3) (2=2) (3=1) (4=0)
recode scchdb (1=3) (2=2) (3=1) (4=0)
recode scchdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scchdd (1=3) (2=2) (3=1) (4=0)
recode scchde (1=3) (2=2) (3=1) (4=0)
recode scchdf (1=3) (2=2) (3=1) (4=0)
egen PS_Child1 = rowtotal(scchda scchdb scchdc), missing
egen NS_Child1 = rowtotal(scchdd scchde scchdf), missing 
* recode no children to zero.
replace PS_Child1=0 if scchd==2
replace NS_Child1=0 if scchd==2
label variable PS_Child1 "Positive interaction children (no child as zero)"
label variable NS_Child1 "Negative interaction children (no child as zero"

** Friends (3 positive items): high scores = high positive.
** Friends (3 negative items): high scores = high negative.
* Positive.
recode scfrda (1=3) (2=2) (3=1) (4=0)
recode scfrdb (1=3) (2=2) (3=1) (4=0)
recode scfrdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfrdd (1=3) (2=2) (3=1) (4=0)
recode scfrde (1=3) (2=2) (3=1) (4=0)
recode scfrdf (1=3) (2=2) (3=1) (4=0)
egen PS_Friend1 = rowtotal(scfrda scfrdb scfrdc), missing
egen NS_Friend1 = rowtotal(scfrdd scfrde scfrdf), missing
* recode no friends to zero.
replace PS_Friend1=0 if scfrd==2
replace NS_Friend1=0 if scfrd==2
label variable PS_Friend1 "Positive interaction friends (no friends zero)"
label variable NS_Friend1 "Negative interaction friends (no friends zero)"

** Family members (3 positive items): high scores = high positive.
** Family members (3 negative items): high scores = high negative.
* Positive.
recode scfama (1=3) (2=2) (3=1) (4=0)
recode scfamb (1=3) (2=2) (3=1) (4=0)
recode scfamc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfamd (1=3) (2=2) (3=1) (4=0)
recode scfame (1=3) (2=2) (3=1) (4=0)
recode scfamf (1=3) (2=2) (3=1) (4=0)
egen PS_Family1 = rowtotal(scfama scfamb scfamc), missing 
egen NS_Family1 = rowtotal(scfamd scfame scfamf), missing
* recode no immediate family members to zero.
replace PS_Family1=0 if scfam==2
replace NS_Family1=0 if scfam==2
label variable PS_Family1 "Positive interaction family (none to zero)"
label variable NS_Family1 "Negative interaction family (none to zero)"

* Overall summary.
egen PSall1 = rowtotal(PS_Spouse1 PS_Child1 PS_Friend1 PS_Family1), missing 
egen NSall1 = rowtotal(NS_Spouse1 NS_Child1 NS_Friend1 NS_Family1), missing 
label variable PSall1 "Positive support from spouse, children, family, friends"
label variable NSall1 "Negative support from spouse, children, family, friends"
generate wave1=1
keep idauniq wave1 PS_Spouse1 NS_Spouse1 PS_Child1 NS_Child1 PS_Friend1 NS_Friend1 PS_Family1 NS_Family1 PSall1 NSall1
save "N:\Temp\Temp1.dta", replace

* ELSA Wave 2.
clear
use idauniq finstat w2wgt scfam scfrd scchd scchda scchdb scchdc scchdd scchde scchdf scfrda scfrdb scfrdc scfrdd scfrde scfrdf scfama ///
scfamb scfamc scfamd scfame scfamf scptr scptra scptrb scptrc scptrd scptre scptrf scptrg using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
keep if finstat=="C1CM"
mvdecode scptra scptrb scptrc, mv(-9 -8 -1)
mvdecode scptrd scptre scptrf, mv(-9 -8 -1)
mvdecode scchda scchdb scchdc, mv(-9 -8 -1)
mvdecode scchdd scchde scchdf, mv(-9 -8 -1)
mvdecode scfrda scfrdb scfrdc, mv(-9 -8 -1)
mvdecode scfrdd scfrde scfrdf, mv(-9 -8 -1)
mvdecode scfama scfamb scfamc, mv(-9 -8 -1)
mvdecode scfamd scfame scfamf, mv(-9 -8 -1)

* Spouse.
* Positive.
recode scptra (1=3) (2=2) (3=1) (4=0)
recode scptrb (1=3) (2=2) (3=1) (4=0)
recode scptrc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scptrd (1=3) (2=2) (3=1) (4=0)
recode scptre (1=3) (2=2) (3=1) (4=0)
recode scptrf (1=3) (2=2) (3=1) (4=0)
egen PS_Spouse2 = rowtotal(scptra scptrb scptrc), missing
egen NS_Spouse2 = rowtotal(scptrd scptre scptrf), missing

* recode no spouse to zero.
replace PS_Spouse2=0 if scptr==2
replace NS_Spouse2=0 if scptr==2
label variable PS_Spouse2 "Positive interaction spouse (no spouse zero)"
label variable NS_Spouse2 "Negative interaction spouse (no spouse zero)"

* Children (3 positive items): high scores = high positive.
* Children (3 negative items): high scores = high negative.
* Positive.
recode scchda (1=3) (2=2) (3=1) (4=0)
recode scchdb (1=3) (2=2) (3=1) (4=0)
recode scchdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scchdd (1=3) (2=2) (3=1) (4=0)
recode scchde (1=3) (2=2) (3=1) (4=0)
recode scchdf (1=3) (2=2) (3=1) (4=0)
egen PS_Child2 = rowtotal(scchda scchdb scchdc), missing 
egen NS_Child2 = rowtotal(scchdd scchde scchdf), missing
* recode no children to zero.
replace PS_Child2=0 if scchd==2
replace NS_Child2=0 if scchd==2
label variable PS_Child2 "Positive interaction children (no child zero)"
label variable NS_Child2 "Negative interaction children (no child zero)"
** Friends (3 positive items): high scores = high positive.
** Friends (3 negative items): high scores = high negative.
* Positive.
recode scfrda (1=3) (2=2) (3=1) (4=0)
recode scfrdb (1=3) (2=2) (3=1) (4=0)
recode scfrdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfrdd (1=3) (2=2) (3=1) (4=0)
recode scfrde (1=3) (2=2) (3=1) (4=0)
recode scfrdf (1=3) (2=2) (3=1) (4=0)
egen PS_Friend2 = rowtotal(scfrda scfrdb scfrdc), missing 
egen NS_Friend2 = rowtotal(scfrdd scfrde scfrdf), missing
* recode no friends to zero.
replace PS_Friend2=0 if scfrd==2
replace NS_Friend2=0 if scfrd==2
label variable PS_Friend2 "Positive interaction friends (no friends zero)"
label variable NS_Friend2 "Negative interaction friends (no friends zero)"
** Family members (3 positive items): high scores = high positive.
** Family members (3 negative items): high scores = high negative.
* Positive.
recode scfama (1=3) (2=2) (3=1) (4=0)
recode scfamb (1=3) (2=2) (3=1) (4=0)
recode scfamc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfamd (1=3) (2=2) (3=1) (4=0)
recode scfame (1=3) (2=2) (3=1) (4=0)
recode scfamf (1=3) (2=2) (3=1) (4=0)
egen PS_Family2 = rowtotal(scfama scfamb scfamc), missing 
egen NS_Family2 = rowtotal(scfamd scfame scfamf), missing
* recode no family to zero.
replace PS_Family2=0 if scfam==2
replace NS_Family2=0 if scfam==2
label variable PS_Family2 "Positive interaction family"
label variable NS_Family2 "Negative interaction family"
* Overall summary.
egen PSall2 = rowtotal(PS_Spouse2 PS_Child2 PS_Friend2 PS_Family2), missing 
egen NSall2 = rowtotal(NS_Spouse2 NS_Child2 NS_Friend2 NS_Family2), missing
label variable PSall2 "Positive support from spouse, children, family, friends"
label variable NSall2 "Negative support from spouse, children, family, friends"
generate wave2=1
keep idauniq wave2 PS_Spouse2 NS_Spouse2 PS_Child2 NS_Child2 PS_Friend2 NS_Friend2 PS_Family2 NS_Family2 PSall2 NSall2
save "N:\Temp\Temp2.dta", replace

* ELSA Wave 3.
clear
use idauniq finstat w3lwgt scfam scfrd scchd scchda scchdb scchdc scchdd scchde scchdf scfrda scfrdb scfrdc scfrdd scfrde scfrdf scfama scfamb ///
scfamc scfamd scfame scfamf scptr scptra scptrb scptrc scptrd scptre scptrf scptrg using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
keep if finstat=="C1CM"
mvdecode scptra scptrb scptrc, mv(-9 -8 -1)
mvdecode scptrd scptre scptrf, mv(-9 -8 -1)
mvdecode scchda scchdb scchdc, mv(-9 -8 -1)
mvdecode scchdd scchde scchdf, mv(-9 -8 -1)
mvdecode scfrda scfrdb scfrdc, mv(-9 -8 -1)
mvdecode scfrdd scfrde scfrdf, mv(-9 -8 -1)
mvdecode scfama scfamb scfamc, mv(-9 -8 -1)
mvdecode scfamd scfame scfamf, mv(-9 -8 -1)
* Spouse.
* how close is your relationship (scptrg).
* Positive.
recode scptra (1=3) (2=2) (3=1) (4=0)
recode scptrb (1=3) (2=2) (3=1) (4=0)
recode scptrc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scptrd (1=3) (2=2) (3=1) (4=0)
recode scptre (1=3) (2=2) (3=1) (4=0)
recode scptrf (1=3) (2=2) (3=1) (4=0)
egen PS_Spouse3 = rowtotal(scptra scptrb scptrc), missing 
egen NS_Spouse3 = rowtotal(scptrd scptre scptrf), missing 
* recode no spouse to zero.
replace PS_Spouse3=0 if scptr==2
replace NS_Spouse3=0 if scptr==2
label variable PS_Spouse3 "Positive interaction spouse (no spouse zero)"
label variable NS_Spouse3 "Negative interaction spouse (no spouse zero)"
* Children (3 positive items): high scores = high positive.
* Children (3 negative items): high scores = high negative.
* Positive.
recode scchda (1=3) (2=2) (3=1) (4=0)
recode scchdb (1=3) (2=2) (3=1) (4=0)
recode scchdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scchdd (1=3) (2=2) (3=1) (4=0)
recode scchde (1=3) (2=2) (3=1) (4=0)
recode scchdf (1=3) (2=2) (3=1) (4=0)
egen PS_Child3 = rowtotal(scchda scchdb scchdc), missing 
egen NS_Child3 = rowtotal(scchdd scchde scchdf), missing
* recode no children to zero.
replace PS_Child3=0 if scchd==2
replace NS_Child3=0 if scchd==2
label variable PS_Child3 "Positive interaction children (no child zero)"
label variable NS_Child3 "Negative interaction children (no child zero)"
** Friends (3 positive items): high scores = high positive.
** Friends (3 negative items): high scores = high negative.
* Positive.
recode scfrda (1=3) (2=2) (3=1) (4=0)
recode scfrdb (1=3) (2=2) (3=1) (4=0)
recode scfrdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfrdd (1=3) (2=2) (3=1) (4=0)
recode scfrde (1=3) (2=2) (3=1) (4=0)
recode scfrdf (1=3) (2=2) (3=1) (4=0)
egen PS_Friend3 = rowtotal(scfrda scfrdb scfrdc), missing
egen NS_Friend3 = rowtotal(scfrdd scfrde scfrdf), missing 
* recode no friends to zero.
replace PS_Friend3=0 if scfrd==2
replace NS_Friend3=0 if scfrd==2
label variable PS_Friend3 "Positive interaction friends (no friends zero)"
label variable NS_Friend3 "Negative interaction friends (no friends zero)"
** Family members (3 positive items): high scores = high positive.
** Family members (3 negative items): high scores = high negative.
* Positive.
recode scfama (1=3) (2=2) (3=1) (4=0)
recode scfamb (1=3) (2=2) (3=1) (4=0)
recode scfamc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfamd (1=3) (2=2) (3=1) (4=0)
recode scfame (1=3) (2=2) (3=1) (4=0)
recode scfamf (1=3) (2=2) (3=1) (4=0)
egen PS_Family3 = rowtotal(scfama scfamb scfamc), missing
egen NS_Family3 = rowtotal(scfamd scfame scfamf), missing

* recode no friends to zero.
replace PS_Family3=0 if scfam==2
replace NS_Family3=0 if scfam==2
label variable PS_Family3 "Positive interaction family (no family zero)"
label variable NS_Family3 "Negative interaction family (no family zero)"

* Overall summary.
egen PSall3 = rowtotal(PS_Spouse3 PS_Child3 PS_Friend3 PS_Family3), missing 
egen NSall3 = rowtotal(NS_Spouse3 NS_Child3 NS_Friend3 NS_Family3), missing   
label variable PSall3 "Positive support from spouse, children, family, friends"
label variable NSall3 "Negative support from spouse, children, family, friends"
generate wave3=1
keep idauniq wave3 PS_Spouse3 NS_Spouse3 PS_Child3 NS_Child3 PS_Friend3 NS_Friend3 PS_Family3 NS_Family3 PSall3 NSall3
save "N:\Temp\Temp3.dta", replace

* Wave 4.
clear
use idauniq finstat w4lwgt scfam scfrd scchd scchda scchdb scchdc scchdd scchde scchdf scfrda scfrdb scfrdc scfrdd scfrde scfrdf scfama ///
scfamb scfamc scfamd scfame scfamf scptr scptra scptrb scptrc scptrd scptre scptrf scptrg using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
keep if finstat=="C1CM"
mvdecode scptra scptrb scptrc, mv(-9 -8 -1)
mvdecode scptrd scptre scptrf, mv(-9 -8 -1)
mvdecode scchda scchdb scchdc, mv(-9 -8 -1)
mvdecode scchdd scchde scchdf, mv(-9 -8 -1)
mvdecode scfrda scfrdb scfrdc, mv(-9 -8 -1)
mvdecode scfrdd scfrde scfrdf, mv(-9 -8 -1)
mvdecode scfama scfamb scfamc, mv(-9 -8 -1)
mvdecode scfamd scfame scfamf, mv(-9 -8 -1)

* Spouse.
* how close is your relationship (scptrg).
* Positive.
recode scptra (1=3) (2=2) (3=1) (4=0)
recode scptrb (1=3) (2=2) (3=1) (4=0)
recode scptrc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scptrd (1=3) (2=2) (3=1) (4=0)
recode scptre (1=3) (2=2) (3=1) (4=0)
recode scptrf (1=3) (2=2) (3=1) (4=0)
egen PS_Spouse4 = rowtotal(scptra scptrb scptrc), missing
egen NS_Spouse4 = rowtotal(scptrd scptre scptrf), missing
* recode no spouse to zero.
replace PS_Spouse4=0 if scptr==2
replace NS_Spouse4=0 if scptr==2
label variable PS_Spouse4 "Positive interaction spouse (no spouse zero)"
label variable NS_Spouse4 "Negative interaction spouse (no spouse zero)"
* Children (3 positive items): high scores = high positive.
* Children (3 negative items): high scores = high negative.
* Positive.
recode scchda (1=3) (2=2) (3=1) (4=0)
recode scchdb (1=3) (2=2) (3=1) (4=0)
recode scchdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scchdd (1=3) (2=2) (3=1) (4=0)
recode scchde (1=3) (2=2) (3=1) (4=0)
recode scchdf (1=3) (2=2) (3=1) (4=0)
egen PS_Child4 = rowtotal(scchda scchdb scchdc), missing 
egen NS_Child4 = rowtotal(scchdd scchde scchdf), missing 
* recode no children to zero.
replace PS_Child4=0 if scchd==2
replace NS_Child4=0 if scchd==2
label variable PS_Child4 "Positive interaction children (no children zero)"
label variable NS_Child4 "Negative interaction children (no children zero)"

** Friends (3 positive items): high scores = high positive.
** Friends (3 negative items): high scores = high negative.
* Positive.
recode scfrda (1=3) (2=2) (3=1) (4=0)
recode scfrdb (1=3) (2=2) (3=1) (4=0)
recode scfrdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfrdd (1=3) (2=2) (3=1) (4=0)
recode scfrde (1=3) (2=2) (3=1) (4=0)
recode scfrdf (1=3) (2=2) (3=1) (4=0)
egen PS_Friend4 = rowtotal(scfrda scfrdb scfrdc), missing 
egen NS_Friend4 = rowtotal(scfrdd scfrde scfrdf), missing
* recode no friends to zero.
replace PS_Friend4=0 if scfrd==2
replace NS_Friend4=0 if scfrd==2
label variable PS_Friend4 "Positive interaction friends (no friends zero)"
label variable NS_Friend4 "Negative interaction friends (no friends zero)"
** Family members (3 positive items): high scores = high positive.
** Family members (3 negative items): high scores = high negative.
* Positive.
recode scfama (1=3) (2=2) (3=1) (4=0)
recode scfamb (1=3) (2=2) (3=1) (4=0)
recode scfamc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfamd (1=3) (2=2) (3=1) (4=0)
recode scfame (1=3) (2=2) (3=1) (4=0)
recode scfamf (1=3) (2=2) (3=1) (4=0)
egen PS_Family4 = rowtotal(scfama scfamb scfamc), missing 
egen NS_Family4 = rowtotal(scfamd scfame scfamf), missing 
* recode no family to zero.
replace PS_Family4=0 if scfam==2
replace NS_Family4=0 if scfam==2
label variable PS_Family4 "Positive interaction family (no family zero)"
label variable NS_Family4 "Negative interaction family (no family zero)"
* Overall summary.
egen PSall4 = rowtotal(PS_Spouse4 PS_Child4 PS_Friend4 PS_Family4) , missing 
egen NSall4 = rowtotal(NS_Spouse4 NS_Child4 NS_Friend4 NS_Family4) , missing  
label variable PSall4 "Positive support from spouse, children, family, friends"
label variable NSall4 "Negative support from spouse, children, family, friends"
generate wave4=1
keep idauniq wave4 PS_Spouse4 NS_Spouse4 PS_Child4 NS_Child4 PS_Friend4 NS_Friend4 PS_Family4 NS_Family4 PSall4 NSall4
save "N:\Temp\Temp4.dta", replace

* Wave 5.
clear
use idauniq finstat w5lwgt scfam scfrd scchd scchda scchdb scchdc scchdd scchde scchdf scfrda scfrdb scfrdc scfrdd scfrde scfrdf scfama scfamb ///
scfamc scfamd scfame scfamf scptr scptra scptrb scptrc scptrd scptre scptrf scptrg using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta"
keep if finstat=="C1CM"
mvdecode scptra scptrb scptrc, mv(-9/-1)
mvdecode scptrd scptre scptrf, mv(-9/-1)
mvdecode scchda scchdb scchdc, mv(-9/-1)
mvdecode scchdd scchde scchdf, mv(-9/-1)
mvdecode scfrda scfrdb scfrdc, mv(-9/-1)
mvdecode scfrdd scfrde scfrdf, mv(-9/-1)
mvdecode scfama scfamb scfamc, mv(-9/-1)
mvdecode scfamd scfame scfamf, mv(-9/-1)
* Spouse.
* how close is your relationship (scptrg).
* Positive.
recode scptra (1=3) (2=2) (3=1) (4=0)
recode scptrb (1=3) (2=2) (3=1) (4=0)
recode scptrc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scptrd (1=3) (2=2) (3=1) (4=0)
recode scptre (1=3) (2=2) (3=1) (4=0)
recode scptrf (1=3) (2=2) (3=1) (4=0)
egen PS_Spouse5 = rowtotal(scptra scptrb scptrc), missing 
egen NS_Spouse5 = rowtotal(scptrd scptre scptrf), missing
* recode no spouse to zero.
replace PS_Spouse5=0 if scptr==2
replace NS_Spouse5=0 if scptr==2
label variable PS_Spouse5 "Positive interaction spouse (no spouse zero)"
label variable NS_Spouse5 "Negative interaction spouse (no spouse zero)"
* Children (3 positive items): high scores = high positive.
* Children (3 negative items): high scores = high negative.
* Positive.
recode scchda (1=3) (2=2) (3=1) (4=0)
recode scchdb (1=3) (2=2) (3=1) (4=0)
recode scchdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scchdd (1=3) (2=2) (3=1) (4=0)
recode scchde (1=3) (2=2) (3=1) (4=0)
recode scchdf (1=3) (2=2) (3=1) (4=0)
egen PS_Child5 = rowtotal(scchda scchdb scchdc), missing 
egen NS_Child5 = rowtotal(scchdd scchde scchdf), missing 
* recode no children to zero.
replace PS_Child5=0 if scchd==2
replace NS_Child5=0 if scchd==2
label variable PS_Child5 "Positive interaction children (no child zero)"
label variable NS_Child5 "Negative interaction children (no child zero)"

** Friends (3 positive items): high scores = high positive.
** Friends (3 negative items): high scores = high negative.
* Positive.
recode scfrda (1=3) (2=2) (3=1) (4=0)
recode scfrdb (1=3) (2=2) (3=1) (4=0)
recode scfrdc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfrdd (1=3) (2=2) (3=1) (4=0)
recode scfrde (1=3) (2=2) (3=1) (4=0)
recode scfrdf (1=3) (2=2) (3=1) (4=0)
egen PS_Friend5 = rowtotal(scfrda scfrdb scfrdc), missing 
egen NS_Friend5 = rowtotal(scfrdd scfrde scfrdf), missing 
* recode no friends to zero.
replace PS_Friend5=0 if scfrd==2
replace NS_Friend5=0 if scfrd==2
label variable PS_Friend5 "Positive interaction friends (no friends zero)"
label variable NS_Friend5 "Negative interaction friends (no friends zero)"
** Family members (3 positive items): high scores = high positive.
** Family members (3 negative items): high scores = high negative.
* Positive.
recode scfama (1=3) (2=2) (3=1) (4=0)
recode scfamb (1=3) (2=2) (3=1) (4=0)
recode scfamc (1=3) (2=2) (3=1) (4=0)
* Negative.
recode scfamd (1=3) (2=2) (3=1) (4=0)
recode scfame (1=3) (2=2) (3=1) (4=0)
recode scfamf (1=3) (2=2) (3=1) (4=0)
egen PS_Family5 = rowtotal(scfama scfamb scfamc), missing 
egen NS_Family5 = rowtotal(scfamd scfame scfamf), missing 
* recode no family to zero.
replace PS_Family5=0 if scfam==2
replace NS_Family5=0 if scfam==2
label variable PS_Family5 "Positive interaction family (no family zero)"
label variable NS_Family5 "Negative interaction family (no family zero)"
* Overall summary.
egen PSall5 = rowtotal(PS_Spouse5 PS_Child5 PS_Friend5 PS_Family5), missing 
egen NSall5 = rowtotal(NS_Spouse5 NS_Child5 NS_Friend5 NS_Family5), missing  
label variable PSall5 "Positive support from children, family, friends"
label variable NSall5 "Negative support from children, family, friends"
generate wave5=1
keep idauniq wave5 PS_Spouse5 NS_Spouse5 PS_Child5 NS_Child5 PS_Friend5 NS_Friend5 PS_Family5 NS_Family5 PSall5 NSall5
save "N:\Temp\Temp5.dta", replace

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
keep idauniq PSall1 NSall1 PSall2 NSall2 PSall3 NSall3 PSall4 NSall4 PSall5 NSall5 ///
PS_Spouse1 PS_Spouse2 PS_Spouse3 PS_Spouse4 PS_Spouse5 ///
PS_Child1 PS_Child2 PS_Child3 PS_Child4 PS_Child5 ///
PS_Friend1 PS_Friend2 PS_Friend3 PS_Friend4 PS_Friend5 ///
PS_Family1 PS_Family2 PS_Family3 PS_Family4 PS_Family5 ///
NS_Spouse1 NS_Spouse2 NS_Spouse3 NS_Spouse4 NS_Spouse5 ///
NS_Child1 NS_Child2 NS_Child3 NS_Child4 NS_Child5 ///
NS_Friend1 NS_Friend2 NS_Friend3 NS_Friend4 NS_Friend5 ///
NS_Family1 NS_Family2 NS_Family3 NS_Family4 NS_Family5 
sort idauniq
save "N:\Temp\Positiveinteraction.dta", replace

*CESD.
*Wave 1.

clear
use idauniq finstat w1wgt askpx psceda-pscedh using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
* CESD score.
forvalues i = 1/8 {
generate f`i'=-2
}
replace f1=0 if psceda==2
replace f2=0 if pscedb==2
replace f3=0 if pscedc==2
replace f4=0 if pscedd==1
replace f5=0 if pscede==2
replace f6=0 if pscedf==1
replace f7=0 if pscedg==2
replace f8=0 if pscedh==2
replace f1=1 if psceda==1
replace f2=1 if pscedb==1
replace f3=1 if pscedc==1
replace f4=1 if pscedd==2
replace f5=1 if pscede==1
replace f6=1 if pscedf==2
replace f7=1 if pscedg==1
replace f8=1 if pscedh==1
egen CESD1 = rsum(f1-f8)
generate wave1=1
keep idauniq wave1 CESD1
save "N:\Temp\Temp1.dta", replace

* Wave 2.

clear
use idauniq finstat w2wgt askpx P* using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
renvars, lower
keep idauniq finstat w2wgt askpx psceda pscedb pscedc pscedd pscede pscedf pscedg pscedh
keep if inrange(w2wgt,0.1,20)
keep if finstat=="C1CM"
* CESD score.
forvalues i = 1/8 {
generate f`i'=-2
}
replace f1=0 if psceda==2
replace f2=0 if pscedb==2
replace f3=0 if pscedc==2
replace f4=0 if pscedd==1
replace f5=0 if pscede==2
replace f6=0 if pscedf==1
replace f7=0 if pscedg==2
replace f8=0 if pscedh==2
replace f1=1 if psceda==1
replace f2=1 if pscedb==1
replace f3=1 if pscedc==1
replace f4=1 if pscedd==2
replace f5=1 if pscede==1
replace f6=1 if pscedf==2
replace f7=1 if pscedg==1
replace f8=1 if pscedh==1
egen CESD2 = rsum(f1-f8)
generate wave2=1
keep idauniq wave2 CESD2
save "N:\Temp\Temp2.dta", replace


* Wave 3.
clear
use idauniq finstat w3lwgt askpx psceda pscedb pscedc pscedd pscede pscedf pscedg pscedh using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
keep if finstat=="C1CM"
* CESD score.
forvalues i = 1/8 {
generate f`i'=-2
}
replace f1=0 if psceda==2
replace f2=0 if pscedb==2
replace f3=0 if pscedc==2
replace f4=0 if pscedd==1
replace f5=0 if pscede==2
replace f6=0 if pscedf==1
replace f7=0 if pscedg==2
replace f8=0 if pscedh==2
replace f1=1 if psceda==1
replace f2=1 if pscedb==1
replace f3=1 if pscedc==1
replace f4=1 if pscedd==2
replace f5=1 if pscede==1
replace f6=1 if pscedf==2
replace f7=1 if pscedg==1
replace f8=1 if pscedh==1
egen CESD3 = rsum(f1-f8)
generate wave3=1
keep idauniq wave3 CESD3
save "N:\Temp\Temp3.dta", replace


* Wave 4.
clear
use idauniq finstat w4lwgt askpx psceda pscedb pscedc pscedd pscede pscedf pscedg pscedh using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
keep if finstat=="C1CM"
* CESD score.
forvalues i = 1/8 {
generate f`i'=-2
}
replace f1=0 if psceda==2
replace f2=0 if pscedb==2
replace f3=0 if pscedc==2
replace f4=0 if pscedd==1
replace f5=0 if pscede==2
replace f6=0 if pscedf==1
replace f7=0 if pscedg==2
replace f8=0 if pscedh==2
replace f1=1 if psceda==1
replace f2=1 if pscedb==1
replace f3=1 if pscedc==1
replace f4=1 if pscedd==2
replace f5=1 if pscede==1
replace f6=1 if pscedf==2
replace f7=1 if pscedg==1
replace f8=1 if pscedh==1
egen CESD4 = rsum(f1-f8)
generate wave4=1
keep idauniq wave4 CESD4
save "N:\Temp\Temp4.dta", replace

* Wave 5.
clear
use idauniq finstat w5lwgt askpx psceda pscedb pscedc pscedd pscede pscedf pscedg pscedh using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
keep if finstat=="C1CM"
* CESD score.
forvalues i = 1/8 {
generate f`i'=-2
}
replace f1=0 if psceda==2
replace f2=0 if pscedb==2
replace f3=0 if pscedc==2
replace f4=0 if pscedd==1
replace f5=0 if pscede==2
replace f6=0 if pscedf==1
replace f7=0 if pscedg==2
replace f8=0 if pscedh==2
replace f1=1 if psceda==1
replace f2=1 if pscedb==1
replace f3=1 if pscedc==1
replace f4=1 if pscedd==2
replace f5=1 if pscede==1
replace f6=1 if pscedf==2
replace f7=1 if pscedg==1
replace f8=1 if pscedh==1
egen CESD5 = rsum(f1-f8)
generate wave5=1
keep idauniq wave5 CESD5
save "N:\Temp\Temp5.dta", replace


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
keep idauniq CESD1 CESD2 CESD3 CESD4 CESD5
sort idauniq
save "N:\Temp\CESD.dta", replace

*ADL.
* Activities of daily living (6 items).
* dressing; walking across a room; bathing; eating; in and out of the bed; toilet.
* Number of difficulties.
* Wave 1.

clear
use idauniq finstat w1wgt askpx headb01-headb10 using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
egen z1 = anycount(headb01-headb10),values(1)
egen z2 = anycount(headb01-headb10),values(2)
egen z3 = anycount(headb01-headb10),values(3)
egen z4 = anycount(headb01-headb10),values(4)
egen z5 = anycount(headb01-headb10),values(5)
egen z6 = anycount(headb01-headb10),values(6)
egen ADL1 = rsum(z1-z6) 
replace ADL1 = -2 if (headb01==-9|headb01==-8)
replace ADL1 = -2 if askpx==1
generate wave1=1
keep idauniq wave1 ADL1
save "N:\Temp\Temp1.dta", replace

* Wave 2.
clear
use idauniq finstat w2wgt askpx he* using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
renvars, lower
keep if inrange(w2wgt,0.1,20)
keep if finstat=="C1CM"
egen z1 = anycount(headb01-headb10),values(1)
egen z2 = anycount(headb01-headb10),values(2)
egen z3 = anycount(headb01-headb10),values(3)
egen z4 = anycount(headb01-headb10),values(4)
egen z5 = anycount(headb01-headb10),values(5)
egen z6 = anycount(headb01-headb10),values(6)
egen ADL2 = rsum(z1-z6) 
replace ADL2 = -2 if (headb01==-9|headb01==-8)
replace ADL2 = -2 if askpx==1
generate wave2=1
keep idauniq wave2 ADL2
save "N:\Temp\Temp2.dta", replace

* Wave 3.
clear
use idauniq finstat w3lwgt askpx he* using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
keep if finstat=="C1CM"
egen z1 = anycount(headldr),values(1)
egen z2 = anycount(headlwa),values(1)
egen z3 = anycount(headlba),values(1)
egen z4 = anycount(headlea),values(1)
egen z5 = anycount(headlbe),values(1)
egen z6 = anycount(headlwc),values(1)
replace z1=-2 if headldr<0
replace z2=-2 if headlwa<0
replace z3=-2 if headlba<0
replace z4=-2 if headlea<0
replace z5=-2 if headlbe<0
replace z6=-2 if headlwc<0
egen ADL3 = rsum(z1-z6) 
replace ADL3 = -2 if askpx==1
generate wave3=1
keep idauniq wave3 ADL3
save "N:\Temp\Temp3.dta", replace

* Wave 4.
clear
use idauniq finstat w4lwgt askpx  headldr headlwa headlba headlea headlbe headlwc using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
keep if finstat=="C1CM"
egen z1 = anycount(headldr),values(1)
egen z2 = anycount(headlwa),values(1)
egen z3 = anycount(headlba),values(1)
egen z4 = anycount(headlea),values(1)
egen z5 = anycount(headlbe),values(1)
egen z6 = anycount(headlwc),values(1)
replace z1=-2 if headldr<0
replace z2=-2 if headlwa<0
replace z3=-2 if headlba<0
replace z4=-2 if headlea<0
replace z5=-2 if headlbe<0
replace z6=-2 if headlwc<0
egen ADL4 = rsum(z1-z6) 
replace ADL4 = -2 if askpx==1
generate wave4=1
keep idauniq wave4 ADL4
save "N:\Temp\Temp4.dta", replace


* Wave 5.
clear
use idauniq finstat w5lwgt askpx headldr headlwa headlba headlea headlbe headlwc using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
keep if finstat=="C1CM"
egen z1 = anycount(headldr),values(1)
egen z2 = anycount(headlwa),values(1)
egen z3 = anycount(headlba),values(1)
egen z4 = anycount(headlea),values(1)
egen z5 = anycount(headlbe),values(1)
egen z6 = anycount(headlwc),values(1)
replace z1=-2 if headldr<0
replace z2=-2 if headlwa<0
replace z3=-2 if headlba<0
replace z4=-2 if headlea<0
replace z5=-2 if headlbe<0
replace z6=-2 if headlwc<0
egen ADL5 = rsum(z1-z6) 
replace ADL5 = -2 if askpx==1
generate wave5=1
keep idauniq wave5 ADL5
save "N:\Temp\Temp5.dta", replace

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
keep idauniq ADL1 ADL2 ADL3 ADL4 ADL5
sort idauniq
save "N:\Temp\ADL.dta", replace

*IADL.
* Activities of daily living (6 items).
* dressing; walking across a room; bathing; eating; in and out of the bed; toilet.
* Number of difficulties.
* Wave 1.
clear
use idauniq finstat w1wgt askpx headb01-headb13 using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
egen z1 = anycount(headb01-headb13),values(7)
egen z2 = anycount(headb01-headb13),values(8)
egen z3 = anycount(headb01-headb13),values(9)
egen z4 = anycount(headb01-headb13),values(10)
egen z5 = anycount(headb01-headb13),values(11)
egen z6 = anycount(headb01-headb13),values(12)
egen z7 = anycount(headb01-headb13),values(13)
egen iADL1 = rsum(z1-z7) 
replace iADL1 = -2 if (headb01==-9|headb01==-8)
replace iADL1 = -2 if askpx==1
generate wave1=1
keep idauniq wave1 iADL1
save "N:\Temp\Temp1.dta", replace

* Wave 2.
clear
use idauniq finstat w2wgt askpx he* using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
renvars, lower
keep if inrange(w2wgt,0.1,20)
keep if finstat=="C1CM"
egen z1 = anycount(headb01-headb13),values(7)
egen z2 = anycount(headb01-headb13),values(8)
egen z3 = anycount(headb01-headb13),values(9)
egen z4 = anycount(headb01-headb13),values(10)
egen z5 = anycount(headb01-headb13),values(11)
egen z6 = anycount(headb01-headb13),values(12)
egen z7 = anycount(headb01-headb13),values(13)
egen iADL2 = rsum(z1-z7) 
replace iADL2 = -2 if (headb01==-9|headb01==-8)
replace iADL2 = -2 if askpx==1
generate wave2=1
keep idauniq wave2 iADL2
save "N:\Temp\Temp2.dta", replace

* Wave 3.
clear
use idauniq finstat w3lwgt askpx he* using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
keep if finstat=="C1CM"
egen z1 = anycount(headlma),values(1)
egen z2 = anycount(headlpr),values(1)
egen z3 = anycount(headlsh),values(1)
egen z4 = anycount(headlph),values(1)
egen z5 = anycount(headlme),values(1)
egen z6 = anycount(headlho),values(1)
egen z7 = anycount(headlmo),values(1)
egen iADL3 = rsum(z1-z7) 
replace iADL3 = -2 if (headlma==-9|headlma==-8)
replace iADL3 = -2 if askpx==1
generate wave3=1
keep idauniq wave3 iADL3
save "N:\Temp\Temp3.dta", replace

* Wave 4.
clear
use idauniq finstat w4lwgt askpx hea* using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
keep if finstat=="C1CM"
egen z1 = anycount(headlma),values(1)
egen z2 = anycount(headlpr),values(1)
egen z3 = anycount(headlsh),values(1)
egen z4 = anycount(headlte),values(1)
egen z5 = anycount(headlme),values(1)
egen z6 = anycount(headlho),values(1)
egen z7 = anycount(headlmo),values(1)
egen iADL4 = rsum(z1-z7) 
replace iADL4 = -2 if (headlma==-9|headlma==-8)
replace iADL4 = -2 if askpx==1
generate wave4=1
keep idauniq wave4 iADL4
save "N:\Temp\Temp4.dta", replace

* Wave 5.
clear
use idauniq finstat w5lwgt askpx head* using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
keep if finstat=="C1CM"
egen z1 = anycount(headlma),values(1)
egen z2 = anycount(headlpr),values(1)
egen z3 = anycount(headlsh),values(1)
egen z4 = anycount(headlte),values(1)
egen z5 = anycount(headlme),values(1)
egen z6 = anycount(headlho),values(1)
egen z7 = anycount(headlmo),values(1)
egen iADL5 = rsum(z1-z7) 
replace iADL5 = -2 if (headlma==-9|headlma==-8)
replace iADL5 = -2 if askpx==1
generate wave5=1
keep idauniq wave5 iADL5
save "N:\Temp\Temp5.dta", replace

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
keep idauniq iADL1 iADL2 iADL3 iADL4 iADL5
sort idauniq
save "N:\Temp\iADL.dta", replace

*Wealth.
*Wave 1.

clear
use idauniq tnhwq5_bu using "N:\ELSA\Datasets\Wave_1_Financial_Derived_Variables_v2.dta"
sort idauniq
save "N:\Temp\Tempa.dta",replace
clear
use idauniq finstat w1wgt using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
merge 1:1 idauniq using "N:\Temp\Tempa.dta" 
keep if _merge==1|_merge==3
rename tnhwq5_bu wealthq1
generate wave1=1
keep idauniq wave1 wealthq1
save "N:\Temp\Temp1.dta", replace
* Wave 2.
clear
use idauniq tnhwq5_bu_s using "N:\ELSA\Datasets\wave_2_financial_derived_variables.dta"
sort idauniq
save "N:\Temp\Tempa.dta",replace
clear
use idauniq finstat w2wgt using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
renvars, lower
keep if inrange(w2wgt,0.1,20)
keep if finstat=="C1CM"
merge 1:1 idauniq using "N:\Temp\Tempa.dta" 
keep if _merge==1|_merge==3
rename tnhwq5_bu_s wealthq2
generate wave2=1
keep idauniq wave2 wealthq2
save "N:\Temp\Temp2.dta", replace
* Wave 3.
clear
use idauniq tnhwq5_bu_s using "N:\ELSA\Datasets\wave_3_financial_derived_variables.dta"
sort idauniq
save "N:\Temp\Tempa.dta",replace
clear
use idauniq finstat w3lwgt using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
keep if finstat=="C1CM"
merge 1:1 idauniq using "N:\Temp\Tempa.dta" 
keep if _merge==1|_merge==3
rename tnhwq5_bu_s wealthq3
generate wave3=1
keep idauniq wave3 wealthq3
save "N:\Temp\Temp3.dta", replace
* Wave 4.
clear
use idauniq tnhwq5_bu_s using "N:\ELSA\Datasets\wave_4_financial_derived_variables.dta"
sort idauniq
save "N:\Temp\Tempa.dta",replace
clear
use idauniq finstat w4lwgt using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
keep if finstat=="C1CM"
merge 1:1 idauniq using "N:\Temp\Tempa.dta" 
keep if _merge==1|_merge==3
rename tnhwq5_bu_s wealthq4
generate wave4=1
keep idauniq wave4 wealthq4
save "N:\Temp\Temp4.dta", replace
* Wave 5.
clear
use idauniq tnhwq5_bu_s using "N:\ELSA\Datasets\wave_5_financial_derived_variables.dta"
sort idauniq
save "N:\Temp\Tempa.dta",replace
* Wave 5.
clear
use idauniq finstat w5lwgt askpx using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
keep if finstat=="C1CM"
merge 1:1 idauniq using "N:\Temp\Tempa.dta" 
keep if _merge==1|_merge==3
rename tnhwq5_bu_s wealthq5
generate wave5=1
keep idauniq wave5 wealthq5
save "N:\Temp\Temp5.dta", replace

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
keep idauniq wealthq1 wealthq2 wealthq3 wealthq4 wealthq5
sort idauniq
save "N:\Temp\wealth.dta", replace

*Couple.

* Wave 1.
clear
use idauniq finstat w1wgt askpx couple using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
generate wave1=1
keep idauniq wave1 couple1
save "N:\Temp\Temp1.dta", replace
* Wave 2.
clear
use idauniq finstat w2wgt askpx couple using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
renvars, lower
keep if inrange(w2wgt,0.1,20)
keep if finstat=="C1CM"
rename couple couple2
generate wave2=1
keep idauniq wave2 couple2
save "N:\Temp\Temp2.dta", replace
* Wave 3.
clear
use idauniq finstat w3lwgt askpx couple using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
keep if finstat=="C1CM"
rename couple couple3
generate wave3=1
keep idauniq wave3 couple3
save "N:\Temp\Temp3.dta", replace
* Wave 4.
clear
use idauniq finstat w4lwgt askpx couple using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
keep if finstat=="C1CM"
rename couple couple4
generate wave4=1
keep idauniq wave4 couple4
save "N:\Temp\Temp4.dta", replace
* Wave 5.
clear
use idauniq finstat w5lwgt askpx couple using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
keep if finstat=="C1CM"
rename couple couple5
generate wave5=1
keep idauniq wave5 couple5
save "N:\Temp\Temp5.dta", replace

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
keep idauniq couple1 couple2 couple3 couple4 couple5
sort idauniq 
save "N:\Temp\couple.dta", replace

* Educational qualifications.
* Wave 1.
clear
use idauniq finstat w1wgt edqual using "N:\ELSA\Datasets\wave_1_core_data_v3.dta"
keep if inrange(w1wgt,0.2,4.9)
* Educational attainment.
generate topqual=-2
replace topqual=1 if edqual==1
replace topqual=2 if inrange(edqual,2,3)
replace topqual=3 if edqual==4
replace topqual=4 if inrange(edqual,5,6)
replace topqual=5 if edqual==7
replace topqual=99 if edqual<0
label define blbl ///
1 "Degree or equivalent" ///
2 "A level/higher education below degree" ///
3 "O level or other" ///
4 "CSE or other" ///
5 "No qualifications" ///
99 "Missing" 
label values topqual blbl
keep idauniq topqual
sort idauniq
save "N:\Temp\topqual.dta", replace

*Memory.
*4 tests (0-27):
*time-orientation
*immediate recall
*delayed recall
*prospective memory

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
* Memory (Self-reported).
*tab cfmetm
*Time-orientation (23.1% at least 1 error).
*orientation (ability to state the correct day, week, month, and year)
*tab1 cfdscr
* mean number of words recalled from 10-word list: immediate and delayed (verbal learning).
*cflisen (immediate)
*cflisd (delayed)
*tab1 cflisen cflisd
* Two tests of prospective memory (initials, time-recording).
*tab1 cfpascr cfpbscr cfptscr
* memory tests: 
*tab1 cfdscr cflisen cflisd cfpascr cfpbscr

*Prospective memory score.
*Feeds into memory function index.
*cfmem: Whether prompted - do whatever you think you are supposed to - after asking - yo.
*cfmems: Code what respondent did when handed clipboard and pencil.
generate cfprmem=-11
replace cfprmem=0 if (cfmems==5|cfmem==2)
replace cfprmem=3 if (cfmems==1 & cfmem==1)
replace cfprmem=2 if (cfmems==2 & cfmem==1)
replace cfprmem=2 if (cfmems==3 & cfmem==1)
replace cfprmem=1 if (cfmems==4 & cfmem==1)
replace cfprmem=-1 if cfmems==-1
replace cfprmem=-9 if (cfmems==-9|cfmem==-9)
label define memlbl -1 "N/A" -9 "refusal" 0 "prompt given or did nothing" 1 "did something else without prompt" ///
2 "wrote initials elsewhere or wrote something else" 3 "correct response without prompt"
label values cfprmem memlbl
label variable cfprmem "Prospective memory score"

*Memory function index (CFmeind) (wave 1).
*cfdscr cflisen cflisd cfprmem cfpascr.
*take off cfpascr

generate base=0
replace base=1 if (cfdscr>=0) & (cflisen>=0) & (cflisd>=0) & (cfprmem>=0)
generate CF_memory1 = -11
replace CF_memory1 = (cfdscr + cflisen + cflisd + cfprmem) if (cfdscr>=0) & (cflisen>=0) & (cflisd>=0) & (cfprmem>=0) 
label variable CF_memory1 "Memory function index"
generate age1 = dhager
rename cfdscr cfdscr1
rename cflisen cflisen1
rename cflisd cflisd1
rename cfprmem cfprmem1
generate wave1=1
keep idauniq CF_memory1 indsex dhager wave1 age1 cfdscr1 cflisen1 cflisd1 cfprmem1
save "N:\Temp\Temp1.dta", replace

* Wave 2.
clear
use idauniq dhager finstat indsex w2wgt askpx outscw2 C* n* using "N:\ELSA\Datasets\wave_2_core_data_v4.dta"
renvars,lower
rename dhager age2
keep if inrange(w2wgt,0.02,10)
keep if finstat=="C1CM"
*Cognitive function.
*Response to the prospective memory test.
generate cfmersp=-9
replace cfmersp=1 if (cfmems==1 & cfmem==1)
replace cfmersp=2 if (cfmems==2|cfmems==3|cfmems==4|cfmems==5)|(cfmems==1 & cfmem==2)
replace cfmersp=cfmem if (cfmem==-9|cfmem==-8|cfmem==-1)
replace cfmersp=cfmems if (cfmersp==-9) & (cfmems==-1|cfmems==-8|cfmems==-9)
label define cfmersplbl ///
1 "correct response without prompt" ///
2 "incorrect response" ///
-1 "not applicable" ///
-8 "don't know" ///
-9 "refusal" 
label values cfmersp cfmersplbl
*Prospective memory score.
generate cfprmem=-9
replace cfprmem=0 if (cfmems==5|cfmem==2)
replace cfprmem=3 if (cfmems==1 & cfmem==1)
replace cfprmem=2 if (cfmems==2 & cfmem==1)
replace cfprmem=2 if (cfmems==3 & cfmem==1)
replace cfprmem=1 if (cfmems==4 & cfmem==1)
replace cfprmem=-1 if (cfmems==-1)
label define cfprmemlbl ///
3 "correct response without prompt" ///
2 "wrote initials elsewhere or wrote something else without prompt" ///
1 "did something else without prompt" ///
0 "prompt given or did nothing" ///
-1 "not applicable" 
label values cfprmem cfprmemlbl 
* Memory function index.
* orientation (ability to state the correct day, week, month, and year)
*tab1 cfdscr
* word recall: cflisen (immediate)
* word recall: cflisd (delayed)
*tab1 cflisen cflisd
generate base=0
replace base=1 if (cfdscr>=0) & (cflisen>=0) & (cflisd>=0) & (cfprmem>=0) 
generate CF_memory2=-9
replace CF_memory2=(cfdscr + cflisen + cflisd + cfprmem) if (cfdscr>=0 & cflisen>=0 & cflisd>=0 & cfprmem>=0)
generate wave2=1
rename cfdscr cfdscr2
rename cflisen cflisen2
rename cflisd cflisd2
rename cfprmem cfprmem2
keep idauniq CF_memory2 wave2 age2 cfdscr2 cflisen2 cflisd2 cfprmem2
save "N:\Temp\Temp2.dta", replace

*Wave 3.
*Description in Wave 2 DV user Guide (page 55).
*Memory Function Index, total score for the verbal fluency and letter cancellation tasks.

* ELSA Wave 3.

clear
use  idauniq dhager finstat indsex askpx w3lwgt sc* c* n* outscw3 using "N:\ELSA\Datasets\wave_3_elsa_data_v4.dta"
renvars,lower
rename dhager age3
keep if finstat=="C1CM"
* Memory function index.
* orientation (ability to state the correct day, week, month, and year)
*tab1 cfdscr
* word recall: cflisen (immediate)
* word recall: cflisd (delayed)
*tab1 cflisen cflisd
generate CF_memory3=-9
replace CF_memory3=(cfdscr + cflisen + cflisd + cfprmem) if (cfdscr>=0 & cflisen>=0 & cflisd>=0 & cfprmem>=0)
generate base=0
replace base=1 if (cfdscr>=0) & (cflisen>=0) & (cflisd>=0) & (cfprmem>=0)
generate wave3=1
rename cfdscr cfdscr3
rename cflisen cflisen3
rename cflisd cflisd3
rename cfprmem cfprmem3
keep idauniq CF_memory3 wave3 age3 cfdscr3 cflisen3 cflisd3 cfprmem3
save "N:\Temp\Temp3.dta", replace

* ELSA Wave 4.
clear
use idauniq indager finstat indsex askpx sc* c* n* using "N:\ELSA\Datasets\wave_4_elsa_data_v3.dta"
renvars,lower
rename indager age4
keep if finstat=="C1CM"
* Memory function index.
* orientation (ability to state the correct day, week, month, and year)
*tab1 cfdscr
* word recall: cflisen (immediate)
* word recall: cflisd (delayed)
*tab1 cflisen cflisd
generate CF_memory4=-9
replace CF_memory4=(cfdscr + cflisen + cflisd + cfprmem) if (cfdscr>=0 & cflisen>=0 & cflisd>=0 & cfprmem>=0)
generate base=0
replace base=1 if (cfdscr>=0) & (cflisen>=0) & (cflisd>=0) & (cfprmem>=0) 
rename cfdscr cfdscr4
rename cflisen cflisen4
rename cflisd cflisd4
rename cfprmem cfprmem4
generate wave4=1
keep idauniq CF_memory4 wave4 age4 cfdscr4 cflisen4 cflisd4 cfprmem4
save "N:\Temp\Temp4.dta", replace


* Wave 5.
use idauniq finstat indager indsex askpx cf* w5lwgt using "N:\ELSA\Datasets\wave_5_elsa_data_v4.dta", clear
keep if finstat=="C1CM"
sort idauniq
rename indager age5
merge 1:1 idauniq using "N:\ELSA\Datasets\w5_elsa_additional_cognitive_function_vars.dta"
keep if _merge==3
* orientation (ability to state the correct day, week, month, and year)
*tab1 cfdscr
* word recall: cflisen (immediate)
* word recall: cflisd (delayed)
*tab1 cflisen cflisd
generate CF_memory5=-9
replace CF_memory5=(cfdscr + cflisen + cflisd + cfprmem) if (cfdscr>=0 & cflisen>=0 & cflisd>=0 & cfprmem>=0)
generate base=0
replace base=1 if (cfdscr>=0) & (cflisen>=0) & (cflisd>=0) & (cfprmem>=0)
generate wave5=1
rename cfdscr cfdscr5
rename cflisen cflisen5
rename cflisd cflisd5
rename cfprmem cfprmem5
keep idauniq CF_memory5 wave5 age5 cfdscr5 cflisen5 cflisd5 cfprmem5 w5lwgt
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

generate allwaves=0
replace allwaves=1 if (wave1==1) & (wave2==1) & (wave3==1) & (wave4==1) & (wave5==1)
tab allwaves

* Social Participation.
mvdecode SPart1 SPart2 SPart3 SPart4 SPart5,mv(-2)
egen spmean = rowmean(SPart1 SPart2 SPart3 SPart4 SPart5) 
qui:summ spmean
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
qui:summ sfmean
generate sfpm = sfmean - r(mean)

* Positive support (all).
summ PSall1 PSall2 PSall3 PSall4 PSall5
replace PSall1=. if PSall1<0
replace PSall2=. if PSall2<0
replace PSall3=. if PSall3<0
replace PSall4=. if PSall4<0
replace PSall5=. if PSall5<0
egen psamean = rowmean(PSall1 PSall2 PSall3 PSall4 PSall5)
qui:summ psamean
generate psapm = psamean - r(mean)

* Negative support (all).
summ NSall1 NSall2 NSall3 NSall4 NSall5
replace NSall1=. if NSall1<0
replace NSall2=. if NSall2<0
replace NSall3=. if NSall3<0
replace NSall4=. if NSall4<0
replace NSall5=. if NSall5<0
egen nsamean = rowmean(NSall1 NSall2 NSall3 NSall4 NSall5)
qui:summ nsamean
generate nsapm = nsamean - r(mean)

* Spouse (positive).
replace PS_Spouse1=. if PS_Spouse1<0
replace PS_Spouse2=. if PS_Spouse2<0
replace PS_Spouse3=. if PS_Spouse3<0
replace PS_Spouse4=. if PS_Spouse4<0
replace PS_Spouse5=. if PS_Spouse5<0
egen pssmean = rowmean(PS_Spouse1 PS_Spouse2 PS_Spouse3 PS_Spouse4 PS_Spouse5)
qui:summ pssmean
generate psspm = pssmean - r(mean)

* Spouse (negative).
replace NS_Spouse1=. if NS_Spouse1<0
replace NS_Spouse2=. if NS_Spouse2<0
replace NS_Spouse3=. if NS_Spouse3<0
replace NS_Spouse4=. if NS_Spouse4<0
replace NS_Spouse5=. if NS_Spouse5<0
egen nssmean = rowmean(NS_Spouse1 NS_Spouse2 NS_Spouse3 NS_Spouse4 NS_Spouse5)
qui:summ nssmean
generate nsspm = nssmean - r(mean)

* Children (positive).
replace PS_Child1=. if PS_Child1<0
replace PS_Child2=. if PS_Child2<0
replace PS_Child3=. if PS_Child3<0
replace PS_Child4=. if PS_Child4<0
replace PS_Child5=. if PS_Child5<0
egen pscmean = rowmean(PS_Child1 PS_Child2 PS_Child3 PS_Child4 PS_Child5) 
qui:summ pscmean
generate pscpm = pscmean - r(mean)

* Children (negative)
replace NS_Child1=. if NS_Child1<0
replace NS_Child2=. if NS_Child2<0
replace NS_Child3=. if NS_Child3<0
replace NS_Child4=. if NS_Child4<0
replace NS_Child5=. if NS_Child5<0
egen nscmean = rowmean(NS_Child1 NS_Child2 NS_Child3 NS_Child4 NS_Child5) 
qui:summ nscmean
generate nscpm = nscmean - r(mean)

* Family (positive)
replace PS_Family1=. if PS_Family1<0
replace PS_Family2=. if PS_Family2<0
replace PS_Family3=. if PS_Family3<0
replace PS_Family4=. if PS_Family4<0
replace PS_Family5=. if PS_Family5<0
egen psrmean = rowmean(PS_Family1 PS_Family2 PS_Family3 PS_Family4 PS_Family5)
qui:summ psrmean
gen psrpm = psrmean - r(mean)

* Family (negative)
replace NS_Family1=. if NS_Family1<0
replace NS_Family2=. if NS_Family2<0
replace NS_Family3=. if NS_Family3<0
replace NS_Family4=. if NS_Family4<0
replace NS_Family5=. if NS_Family5<0
egen nsrmean = rowmean(NS_Family1 NS_Family2 NS_Family3 NS_Family4 NS_Family5)
qui:summ nsrmean
generate nsrpm = nsrmean - r(mean)

* Friend (positive)
replace PS_Friend1=. if PS_Friend1<0
replace PS_Friend2=. if PS_Friend2<0
replace PS_Friend3=. if PS_Friend3<0
replace PS_Friend4=. if PS_Friend4<0
replace PS_Friend5=. if PS_Friend5<0
egen psfmean = rowmean(PS_Friend1 PS_Friend2 PS_Friend3 PS_Friend4 PS_Friend5)
qui:summ psfmean
generate psfpm = psfmean - r(mean)

* Friend (negative)
replace NS_Friend1=. if NS_Friend1<0
replace NS_Friend2=. if NS_Friend2<0
replace NS_Friend3=. if NS_Friend3<0
replace NS_Friend4=. if NS_Friend4<0
replace NS_Friend5=. if NS_Friend5<0
egen nsfmean = rowmean(NS_Friend1 NS_Friend2 NS_Friend3 NS_Friend4 NS_Friend5)
qui:summ nsfmean
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

*have to do one by one
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
save "N:\Temp\MemoryFunction.dta", replace


***************************************************
**Memory
*****************************************************

use "N:\Temp\MemoryFunction.dta", clear
sort idauniq
merge m:1 idauniq using "N:\Temp\wave_1_weight_exclude.dta"
drop _merge
drop if exclude==1
drop ADL2 ADL3 ADL4 ADL5 CESD2 CESD3 CESD4 CESD5

reshape long time CF_memory SPart SC_close SC_closea SC_contact ///
PSall NSall PS_Spouse NS_Spouse PS_Child NS_Child PS_Family NS_Family PS_Friend NS_Friend ///
, i(idauniq) j(occasion)
		
xtset idauniq occasion
sort idauniq occasion 

*Social Particiaption
gen spwp = SPart - spmean

*Social network
gen scwp = SC_close - scmean
gen sfwp = SC_contact - sfmean 

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
recode CF_memory (-11=.)
recode CF_memory (-9=.)
mvdecode wealthq1,mv(-3)

* Basic model.
xtmixed CF_memory || idauniq:, variance ml covariance(un) residuals(independent)

************************
* Table 2: all sources.
************************

xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psapm c.time#c.psapm c.psawp c.time#c.psawp c.psapm#c.psawp ///
c.nsapm c.time#c.nsapm c.nsawp c.time#c.nsawp c.nsapm#c.nsawp ///
,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)

*number of tests with those with covariate values.
gen sample1 = e(sample)
preserve
keep if sample1==1
collapse (sum) practice=sample1,by(idauniq)
save "N:\Temp\Temp2.dta", replace
restore
merge m:1 idauniq using "N:\Temp\Temp2.dta"

************************
*Web Table 2
**Interactions with sex.
************************

xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
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
 
 
 
 
********************************************************************
* Table 4: source-specific
* Web Table 4: took part in all 5 waves
* Web Table 6: source-specific with adjustment for practice effects
********************************************************************

*Spouse:Men.
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Spouse:Men (all 5 waves).
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp ///
if (sample1==1 & indsex==1 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w5lwgt) variance ml covariance(un) residuals(independent)
 
 
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp ///
if (sample1==1 & indsex==1 & allwaves==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 
*Spouse:Men (practice effects).
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp i.practice ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 

*Spouse:Women.
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Spouse:Women (practice effects).
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psspm c.time#c.psspm c.psswp c.time#c.psswp c.psspm#c.psswp ///
c.nsspm c.time#c.nsspm c.nsswp c.time#c.nsswp c.nsspm#c.nsswp i.practice ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 *Children:Men.
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Children:Men (practice effects)
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp i.practice ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Children:Women.
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Children:Women (practice effects).
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.pscpm c.time#c.pscpm c.pscwp c.time#c.pscwp c.pscpm#c.pscwp ///
c.nscpm c.time#c.nscpm c.nscwp c.time#c.nscwp c.nscpm#c.nscwp i.practice ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Family:Men.
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Family:Men (practice effects).
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp i.practice ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Family:Women.
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 
*Family:Women (practice effects).
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psrpm c.time#c.psrpm c.psrwp c.time#c.psrwp c.psrpm#c.psrwp ///
c.nsrpm c.time#c.nsrpm c.nsrwp c.time#c.nsrwp c.nsrpm#c.nsrwp i.practice ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 
*Friends:Men.
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 *Friends:Men (practice effects).
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp i.practice ///
if (sample1==1 & indsex==1) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
 
*Friends:Women.
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 
*Friends:Women (practice effects).
xtmixed CF_memory c.time c.agebl_65 c.time#c.agebl_65 c.agesq c.time#c.agesq ///
i.indsex c.time#i.indsex c.topqual c.time#c.topqual c.wealthq1 c.time#c.wealthq1 ///
c.ADL1 c.time#c.ADL1 c.CESD1 c.time#c.CESD1 ///
c.psfpm c.time#c.psfpm c.psfwp c.time#c.psfwp c.psfpm#c.psfwp ///
c.nsfpm c.time#c.nsfpm c.nsfwp c.time#c.nsfwp c.nsfpm#c.nsfwp i.practice ///
if (sample1==1 & indsex==2) ///
 ,   || idauniq: c.time, pweight(w1wgt) variance ml covariance(un) residuals(independent)
 

******************************************
*Web Table 4: took part at all 5 waves
******************************************
 

 
 






































