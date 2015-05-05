predict res, r
gen sres = res/e(rmse)
gen ares = abs(sres)
sktest sres if model
ovtest
hettest
predict fit, xb
gen PREDICTION = exp(fit)
//gen PREDICTION = fit
gen ae = abs(salesprice - PREDICTION )
summ ae if model
summ ae if !model
scatter sres fit if model
