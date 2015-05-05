qui use "/Users/jeff/Dropbox/Apps/Texpad/E104prj/prjdata.dta", clear
qui graph box lotSize if !kaggle , mark ( 1, mlabel(ID)) 
qui graph export figures/`1'-box.pdf, replace
qui summ `1', detail
qui gen  xolotSize  = (lotSize  > (r(p25) - (r(p75) - r(p25) * 1.5))) & (lotSize  < (r(p75) + (r(p75) - r(p25) * 1.5))) if !kaggle
graph twoway (lfitci pl  `1' ) (scatter pl  `1' )
graph export figures/`1'-scatter.pdf, replace

qnorm `1' if !kaggle , mlabel(ID) 
graph export figures/`1'-qnorm.pdf, replace

regress pl `1' if !kaggle
predict fit, xb
gen PREDICTION = exp(fit)
predict res, r
predict tres, rstudent
predict lev, leverage
gen sres = res/e(rmse)
gen xr`1' = abs(sres) < 2
list ID salesprice PREDICTION sres tres lev if xo`1' & xr`1' & abs(tres) > 2

scatter sres pl if !kaggle, mlabel(ID)
graph export figures/`1'-sres.pdf, replace

scatter tres pl if !kaggle, mlabel(ID)
graph export figures/`1'-tres.pdf, replace

scatter lev pl if !kaggle, mlabel(ID)
graph export figures/`1'-lev.pdf, replace

di "`e(cmdline)' yields an r^2 of " %04.2f `=scalar(e(r2))' ", r2a=" %04.2f `=scalar(e(r2_a))' ", r2a=" %04.2f `=scalar(e(rmse))' 
indeplist , local constant
noi di "var & t-stat & p-value"
foreach indep in `r(X)'{
	di in blue "`indep' & "  %5.4fc _b["`indep'"]/_se["`indep'"] " & " %5.4fc 2*ttail(e(df_r),abs(_b["`indep'"]/_se["`indep'"])) _n(2)
}
