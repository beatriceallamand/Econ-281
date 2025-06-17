********************************************************************************
*                                CASEN                                         *
********************************************************************************

* Set working directory
global projdir "/Users/beatriceallamand/Dropbox/2nd year UCSD/281/Project 65+"
cd "$projdir"

******* 2022
use "$projdir/Data/Casen2022.dta", clear

gen prob_empleo=1 if o1==1
replace prob_empleo=0 if o1==2
drop if edad>100

* Participation
rdplot prob_empleo edad if sexo == 2 & edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) weights(expr) ///
    graph_options(title("RD Plot: Participation vs Age (Women, 2022)") ///
    ytitle("Labor Force Participation") xtitle("Age") xtick(55(5)75) ylabel(0(0.2)1) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_women_zoomed_2022, replace)
graph export "$projdir/Figures/Casen/rdplot_women_zoomed_2022.pdf", replace

* Labor income
rdplot ytrabajocor edad if sexo == 2 & edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) weights(expr) ///
    graph_options(title("RD Plot: Labor Income vs Age (Women, 2022)") ///
    ytitle("Labor Income") xtitle("Age") xtick(55(5)75) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_women_income_2022, replace)
graph export "$projdir/Figures/Casen/rdplot_women_income_2022.pdf", replace

* Hours
rdplot o10 edad if sexo == 2 & edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) weights(expr) ///
    graph_options(title("RD Plot: Hours Worked vs Age (Women, 2022)") ///
    ytitle("Hours Worked") xtitle("Age") xtick(55(5)75) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_women_hours_2022, replace)
graph export "$projdir/Figures/Casen/rdplot_women_hours_2022.pdf", replace

* Would work more
gen mas=.
replace mas=1 if o11==1 | o11==2
replace mas=0 if o11==3

rdplot mas edad if edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) ///
    graph_options(title("RD Plot: Would Work More vs Age (2022)") ///
    ytitle("Probability: Yes") xtitle("Age") xtick(55(5)75) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_all_would_work_2022, replace)
graph export "$projdir/Figures/Casen/rdplot_all_would_work_2022.pdf", replace

******* 2017
use "$projdir/Data/Casen2017.dta", clear

gen prob_empleo=1 if o1==1
replace prob_empleo=0 if o1==2
drop if edad>100

* Participation
rdplot prob_empleo edad if sexo == 2 & edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) weights(expr) ///
    graph_options(title("RD Plot: Participation vs Age (Women, 2017)") ///
    ytitle("Labor Force Participation") xtitle("Age") xtick(55(5)75) ylabel(0(0.2)1) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_women_zoomed_2017, replace)
graph export "$projdir/Figures/Casen/rdplot_women_zoomed_2017.pdf", replace

* Labor income
rdplot ytrabajocor edad if sexo == 2 & edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) weights(expr) ///
    graph_options(title("RD Plot: Labor Income vs Age (Women, 2017)") ///
    ytitle("Labor Income") xtitle("Age") xtick(55(5)75) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_women_income_2017, replace)
graph export "$projdir/Figures/Casen/rdplot_women_income_2017.pdf", replace

* Hours
rdplot o10 edad if sexo == 2 & edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) weights(expr) ///
    graph_options(title("RD Plot: Hours Worked vs Age (Women, 2017)") ///
    ytitle("Hours Worked") xtitle("Age") xtick(55(5)75) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_women_hours_2017, replace)
graph export "$projdir/Figures/Casen/rdplot_women_hours_2017.pdf", replace

* Would Work More
gen mas=.
replace mas=1 if o11==1 | o11==2
replace mas=0 if o11==3

rdplot mas edad if sexo == 2 & edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) weights(expr) ///
    graph_options(title("RD Plot: Would Work More vs Age (2017)") ///
    ytitle("Probability: Yes") xtitle("Age") xtick(55(5)75) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_woman_would_work_2017_1, replace)
graph export "$projdir/Figures/Casen/rdplot_woman_would_work_2017.pdf", replace

rdplot mas edad if edad >= 55 & edad <= 75, c(65) binselect(esmv) ci(95) weights(expr) ///
    graph_options(title("RD Plot: Would Work More vs Age (2017)") ///
    ytitle("Probability: Yes") xtitle("Age") xtick(55(5)75) ///
    graphregion(color(white)) bgcolor(white) legend(off)) ///
	name(rdplot_all_would_work_2017_1, replace)
graph export "$projdir/Figures/Casen/rdplot_all_would_work_2017.pdf", replace

********************************************************************************
*                                  EOD                                         *
********************************************************************************

cd "$projdir/Data/EOD"

use "2022_Dic.dta", clear
append using "2022_Sept" "2022_Jun" "2022_Mar" "2021_Dic" "2021_Sept" "2021_Jun", force
save "EOD.dta", replace

******** Participation, treatment 2021q4
use "EOD.dta", clear

gen qtr=.
replace qtr=1 if mes==3
replace qtr=2 if mes==6
replace qtr=3 if mes==9
replace qtr=4 if mes==12

gen prob_empleo=.
replace prob_empleo=1 if sitocup1==1
replace prob_empleo=0 if sitocup1>1

destring ano, replace force
destring qtr, replace force

gen year = 2000 + ano
drop ano
rename year ano

* Generate quarter date
gen quarter_date = yq(ano, qtr)
format quarter_date %tq

* Event time: 0 = 2021q4 (policy announcement)
gen event_time = quarter_date - yq(2021, 4)

rename edad age 
gen treatment = age == 65
keep if age == 64 | age == 65

* Create treatment-event dummies
forvalues k = -2(1)4 {
    local varname = cond(`k' < 0, "treat_event_m" + string(abs(`k')), "treat_event" + string(`k'))
    gen `varname' = (event_time == `k') * treatment
}

* Estimate event study
reg prob_empleo treat_event_m2 treat_event_m1 treat_event1 treat_event2 treat_event3 treat_event4 i.quarter_date, vce(robust)

preserve
clear
set obs 7
gen event_time = .
gen coef = .
gen lb = .
gen ub = .

local times  -2 -1 1 2 3 4
local names  treat_event_m2 treat_event_m1 treat_event1 treat_event2 treat_event3 treat_event4
local i = 1
foreach k of local times {
    local v : word `i' of `names'
    replace event_time = `k' in `i'
    replace coef = _b[`v'] in `i'
    replace lb = _b[`v'] - 1.96 * _se[`v'] in `i'
    replace ub = _b[`v'] + 1.96 * _se[`v'] in `i'
    local ++i
}
replace event_time = 0 in 7
replace coef = 0 in 7
replace lb = . in 7
replace ub = . in 7


* Plot
twoway ///
    (rcap ub lb event_time if event_time != 0, lwidth(medthick)) ///
    (scatter coef event_time, msize(medium)) ///
    , ///
    yline(0, lpattern(dash)) ///
    xline(0, lpattern(dash) lcolor(orange)) ///
    xline(0.5, lpattern(dash) lcolor(orange)) ///
    text(0.19 -0.4 "Announced:", size(small)) ///
    text(0.17 -0.3 "Dec 2021", size(small)) ///
    text(0.16 0.9 "Implemented:", size(small)) ///
	text(0.14 0.8 "Feb 2022", size(small)) ///
    xlabel(-2 "2021q2" -1 "2021q3" 0 "2021q4" 1 "2022q1" 2 "2022q2" 3 "2022q3" 4 "2022q4") ///
    xtitle("Quarter") ///
    ytitle("Treatment Effect on Labor Participation") ///
    title("Event Study: Policy Impact at Age 65") ///
    graphregion(color(white)) ///
    legend(off)
	


 restore


******** Hours, treatment is 2022q1
use "EOD.dta", clear

* Repeat quarter logic
gen qtr=.
replace qtr=1 if mes==3
replace qtr=2 if mes==6
replace qtr=3 if mes==9
replace qtr=4 if mes==12

gen year = 2000 + ano
drop ano
rename year ano

drop if horas==999

gen quarter_date = yq(ano, qtr)
format quarter_date %tq
gen event_time = quarter_date - yq(2022, 1)
rename edad age 
gen treatment = age == 65 
keep if age == 64 | age == 65

forvalues k = -3(1)3 {
    local varname = cond(`k' < 0, "treat_event_m" + string(abs(`k')), "treat_event" + string(`k'))
    gen `varname' = (event_time == `k') * treatment
}

reg horas treat_event_m3 treat_event_m2 treat_event_m1 treat_event1 treat_event2 treat_event3  i.quarter_date, vce(robust)

preserve
clear
set obs 7
gen event_time = .
gen coef = .
gen lb = .
gen ub = .

local times  -3 -2 -1 1 2 3 
local names  treat_event_m3 treat_event_m2 treat_event_m1 treat_event1 treat_event2 treat_event3 

local i = 1
foreach k of local times {
    local v : word `i' of `names'
    replace event_time = `k' in `i'
    replace coef = _b[`v'] in `i'
    replace lb = _b[`v'] - 1.96 * _se[`v'] in `i'
    replace ub = _b[`v'] + 1.96 * _se[`v'] in `i'
    local ++i
}
replace event_time = 0 in 7
replace coef = 0 in 7
replace lb = . in 7
replace ub = . in 7

* Plot
twoway ///
    (rcap ub lb event_time if event_time != 0, lwidth(medthick)) ///
    (scatter coef event_time, msize(medium)) ///
    , ///
    yline(0, lpattern(dash)) ///
    xline(-0.5, lpattern(dash) lcolor(orange)) ///
    xline(0, lpattern(dash) lcolor(orange)) ///
    xlabel(-3 "2021q2" -2 "2021q3" -1 "2021q4" 0 "2022q1" 1 "2022q2" 2 "2022q3" 3 "2022q4") ///
    xtitle("Quarter") ///
    ytitle("Treatment Effect on Hours Worked") ///
    title("Event Study: Policy Impact at Age 65 (Hours)") ///
    graphregion(color(white)) ///
    legend(off)


 restore
 
 ******** Income (Did not include in results, too noisy)
use "EOD.dta", clear

gen qtr=.
replace qtr=1 if mes==3
replace qtr=2 if mes==6
replace qtr=3 if mes==9
replace qtr=4 if mes==12

gen year = 2000 + ano
drop ano
rename year ano

gen quarter_date = yq(ano, qtr)
format quarter_date %tq
gen event_time = quarter_date - yq(2022, 1)
rename edad age 
gen treatment = age == 65 
keep if age == 64 | age == 65

forvalues k = -3(1)3 {
    local varname = cond(`k' < 0, "treat_event_m" + string(abs(`k')), "treat_event" + string(`k'))
    gen `varname' = (event_time == `k') * treatment
}

reg ingtrab treat_event_m3 treat_event_m2 treat_event_m1 treat_event1 treat_event2 treat_event3  i.quarter_date, vce(robust)

preserve
clear
set obs 7
gen event_time = .
gen coef = .
gen lb = .
gen ub = .

local times  -3 -2 -1 1 2 3 
local names  treat_event_m3 treat_event_m2 treat_event_m1 treat_event1 treat_event2 treat_event3 
local i = 1
foreach k of local times {
    local v : word `i' of `names'
    replace event_time = `k' in `i'
    replace coef = _b[`v'] in `i'
    replace lb = _b[`v'] - 1.96 * _se[`v'] in `i'
    replace ub = _b[`v'] + 1.96 * _se[`v'] in `i'
    local ++i
}
replace event_time = 0 in 7
replace coef = 0 in 7
replace lb = . in 7
replace ub = . in 7

* Plot

twoway ///
    (rcap ub lb event_time if event_time != 0, lwidth(medthick)) ///
    (scatter coef event_time, msize(medium)) ///
    , ///
    yline(0, lpattern(dash)) ///
    xline(-0.5, lpattern(dash) lcolor(orange)) ///
    xline(0, lpattern(dash) lcolor(orange)) ///
    xlabel(-3 "2021q2" -2 "2021q3" -1 "2021q4" 0 "2022q1" 1 "2022q2" 2 "2022q3" 3 "2022q4") ///
    xtitle("Quarter") ///
    ytitle("Treatment Effect on Labor Income") ///
    title("Event Study: Policy Impact at Age 65 (Labor Income)") ///
    graphregion(color(white)) ///
    legend(off)
	


 restore

 
 
