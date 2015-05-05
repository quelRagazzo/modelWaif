//use "/Users/jeff/Dropbox/Apps/Texpad/E104prj/prjdata.dta", clear
graph box `1' if !kaggle , mark ( 1, mlabel(ID)) 
graph export figures/`1'-box.pdf, replace
summ `1', detail
gen  xo`1'  = (`1'  > (r(p25) - (r(p75) - r(p25) * 1.5))) & (`1'  < (r(p75) + (r(p75) - r(p25) * 1.5))) if !kaggle
graph twoway (lfitci pl  `1' ) (scatter pl  `1' )
graph export figures/`1'-scatter.pdf, replace

qnorm `1' if !kaggle , mlabel(ID) 
graph export figures/`1'-qnorm.pdf, replace

