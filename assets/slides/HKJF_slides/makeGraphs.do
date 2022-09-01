clear all
frames reset
if ("${mmswRoot}"=="") do `"`c(sysdir_personal)'profile.do"'
do "${mmswRoot}/set_environment.do"
cd "$root/data/FINAL/"
local inhere "hmdaFullEstimationData"
project, uses("$root/data/FINAL/`inhere'.zip") // the CFPB HMDA
unzipfile "`inhere'.zip"
use "`inhere'.dta", clear
erase "`inhere'.dta"

local outhere "${mmswRoot}/slides/HKJF/"

global Xct " population minority_population hud_median_family_income tract_to_msamd_income " // NB: was called CNTRLSct
global Xit " loan_amount_000s applicant_income_000s " // "i" is the loan NB was called CNTRLSap
global FEfull 	" bankFE#year censusFE race applicant_sex "
global FEnorace " bankFE#year censusFE applicant_sex "
global FEnosex 	" bankFE#year censusFE race "
global FEnosexnorace " bankFE#year censusFE "
global FEyrct "year censusFE"
global CL 		" censusFE "

// timer clear 1
// timer on 1
reghdfe approved ACLPOST $Xct $Xit , cluster( $CL ) absorb( $FEfull ) timeit
// timer off 1
// timer list 1

generate mmswSample = e(sample)
count if e(sample)==1 // TODO: add this test to the sample things
keep if mmswSample == 1 // CRITICAL SO THAT WE CAN DO ANALYSIS WITH THE DEMEANED SAMPLE

// create the interacted indicator
egen bankyearFE = group(bankFE year)

// make a race factor that lumps all hispanic borrowers 
generate hrace = race - 1
replace hrace = 1 if hrace==0
// replace hrace = 3 if hrace>=3 
// label define labHrace 1 "Hispanic" 2 "Black" 3 "White & Asian" // 3 "Asian" 4 "Native" 5 "Islander" 6 "White"
label define labHrace 1 "Hispanic" 2 "Black" 3 "Asian" 4 "Native" 5 "Islander" 6 "White"
label values hrace labHrace

cd $mmswRoot/slides/HKJF/

mean approved, over(hrace)
estimates store raceApproved
su approved, meanonly
scalar raceApproved = `r(mean)'
mean approved, over(applicant_sex)
estimates store sexApproved
su approved, meanonly
scalar sexApproved = `r(mean)'

// regress approved ibn.hrace $Xct $Xit, nocons
// matrix raceApproved = r(table)'
// putexcel raceApprovedOut = matrix(raceApproved), names
// estimates store raceApprovedCntrls // cntrls

mean loanToIncomeApproved, over(hrace)
estimates store raceLTI
su loanToIncomeApproved, meanonly
scalar raceLTI = `r(mean)'
mean loanToIncomeApproved, over(applicant_sex)
estimates store sexLTI
su loanToIncomeApproved, meanonly
scalar sexLTI = `r(mean)'

mean ratespreadindicator, over(hrace)
estimates store raceHIL 
su ratespreadindicator, meanonly
scalar raceHIL = `r(mean)'

mean ratespreadindicator, over(applicant_sex)
estimates store sexHIL 
su ratespreadindicator, meanonly
scalar sexHIL = `r(mean)'

grstyle init
grstyle color background white
grstyle anglestyle vertical_tick horizontal
// grstyle set color ptol rainbow, n(8) reverse

// local outhere "${mmswRoot}/slides/Yale/"
local models "raceApproved raceLTI raceHIL"
foreach m of local models {
	estimates replay `m'
	if "`m'" == "raceApproved" local title "Approval Rate by Group"
	if "`m'" == "raceApproved" local v "approved"
	if "`m'" == "raceApproved" local title "Approval Rate by Group"
	if "`m'" == "raceApproved" local v "approved"
	if "`m'" == "raceLTI" local title "Loan to Income Ratio by Group"
	if "`m'" == "raceLTI" local v "loanToIncomeApproved"
	if "`m'" == "raceHIL" local title "High Interest Loans by Group"
	if "`m'" == "raceHIL" local v "ratespreadindicator"
	local mu = `m'
	#delimit ;
	coefplot `m', noci 
		aux(_N) weight(@aux1) /// make the bubbles _N
		mfcolor(*.6) /// make the bubbles lighter
		coeflabels(
			c.`v'@1.hrace = "Hispanic" 
			c.`v'@2.hrace = "Black" 
			c.`v'@3.hrace = "Asian" 
			c.`v'@4.hrace = "Native" 
			c.`v'@5.hrace = "Islander" 
			c.`v'@6.hrace = "White" 
			) 
			xline(`mu') 
			title("`title'") 
		;
	#delimit cr
	// coefplot `m', noci xline(0 `mu') title("`title'") // weight(rcount)
	graph export `outhere'`m'.png, replace
}

// local outhere "${mmswRoot}/slides/Yale/"
local models "sexApproved sexLTI sexHIL"
foreach m of local models {
	estimates replay `m'
	if "`m'" == "sexApproved" local title "Approval Rate by Group"
	if "`m'" == "sexApproved" local v "approved"
	if "`m'" == "sexApproved" local title "Approval Rate by Group"
	if "`m'" == "sexApproved" local v "approved"
	if "`m'" == "sexLTI" local title "Loan to Income Ratio by Group"
	if "`m'" == "sexLTI" local v "loanToIncomeApproved"
	if "`m'" == "sexHIL" local title "High Interest Loans by Group"
	if "`m'" == "sexHIL" local v "ratespreadindicator"
	local mu = `m'
	#delimit ;
	coefplot `m', noci 
		aux(_N) weight(@aux1) /// make the bubbles _N
		mfcolor(*.6) /// make the bubbles lighter
		coeflabels(
			c.`v'@1.applicant_sex = "Male" 
			c.`v'@2.applicant_sex = "Female" 
			) 
			xline(`mu') 
			title("`title'") 
		;
	#delimit cr
	// coefplot `m', noci xline(0 `mu') title("`title'") // weight(rcount)
	graph export `outhere'`m'.png, replace
}
