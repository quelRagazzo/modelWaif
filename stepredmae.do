use "/Users/jeff/Dropbox/Apps/Texpad/E104prj/prjdata.dta"
stepwise, pr(0.05): regress salesprice lot_sq_ft condition bsmt_sf cac live_area_sf baths bedroooms fireplaces garage_cars deck_sf month_sold age dist
> _fire smoker if !kaggle
gen PREDICTION = lot_sq_ft * 1.854614 + condition * 8218.952 + bsmt_sf *  33.76196 + garage_cars * 15763.33 + live_area_sf * 55.69702 + age *  -581.86
> 53 + bedroooms *   -10544.97 + fireplaces *  4273.081
gen AE = abs(PREDICTION-salesprice )
summ AE if !kaggle
outsheet ID PREDICTION using stepwise.cvf if kaggle, comma
save "/Users/jeff/Dropbox/Apps/Texpad/E104prj/prjdata.dta", replace


graph twoway (lfitci AAPL VFINX) (scatter AAPL VFINX)
