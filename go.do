stepwise , pr(0.05) : regress pl lotSize  basement cac sqft baths  fp garage deck monthSold age smoker if X
predict res, r
gen sres = res/e(rmse)
sktest sres
ovtest
hettest
predict fitl, xb
gen PREDICTION = 2.7182818284590452353602874713527^fitl
gen ae = abs(salesprice - PREDICTION )
summ ae
scatter sres PREDICTION
