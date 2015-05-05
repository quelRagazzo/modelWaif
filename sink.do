use prjdata
stepwise , pr(0.05) : regress pl  aget bar2 bar3 bar4 basement baths br cac recond deck distFire fp garage lotSize monthSold smoker sqftt if model
rvfplot
graph export figures/sink-rvf, replace
do aftermath
