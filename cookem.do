predict cooked, cook
graph twoway scatter cooked salesprice if model, msymbol(i) mcolor(red) mlabel(ID) ytitle("Cooks'D") title("Cook's Distance by ID") 
///graph twoway scatter cooked ID, msymbol(i) mlabel(ID) ytitle("Cooks'D") title("Cook's Distance by ID")
