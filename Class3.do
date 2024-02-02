class3 do-file on merging data and using do-files

use cdc_covid_deaths_2020.dta, clear

cd ["C:\Users\av4570a\Downloads"]

merge m:1 state using "lockdown_clean_2020.dta"

tab _merge

generate covdperhk = round((covdeath/pop2019)*100000,.1)

label var covdperhk "COVID deaths per 100,000 residents"

bysort state: egen covdall=total(covdeath) if race!=0

label var covdall "covid deaths all races by state"

format %9.0gc covdall

bysort state: egen popall=total(pop2019) if race!=0

label var popall "total population all races by state"

format %12.0gc popall

* Q10
gen covdallhk=round((covdall/popall)*100000,.1)

label var covdallhk "covid deaths per 100,000 by state, all races"



* Q 10.5

summarize covdallhk covdperhk