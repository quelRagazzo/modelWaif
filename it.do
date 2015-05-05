stepwise , pr(0.05) : regress pl lotSize condition basement cac sqft baths br fp garage deck age distFire smoker whack if X
predict res, r
gen sres = res/e(rmse)
gen ares = abs(sres)
sktest sres
ovtest
hettest
predict fitl, xb
gen PREDICTION = exp(fitl)
gen ae = abs(salesprice - PREDICTION )
summ ae
scatter sres PREDICTION
