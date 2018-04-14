# LARX: Logistic Autoregressive with Exogenous Input 
This is a library of Matlab functions that performs fitting and inference of multi-channel time series.

## Dependency
[minFunc](https://www.cs.ubc.ca/~schmidtm/Software/minFunc.html) by Mark Schmidt

**Note:** This library was tested on Matlab 2017a

## Functions
`larx_fit.m`: fits larx model. 

*Input Arguments*:

`data`: exogenous input (trials x samples x channels)

`Y`: target (trials x samples)

`cfg`: parameters struct (xlags = number of exgoneous time lags, ylags = number of target time lags, lambda = regularization constant)

*Output Arguments*:

`w`: weight vector

------------------------------------

`larx_model.m`: predicts one sample of target

*Input Arguments*:

`w`: weight vector

`X`: exogenous input (xlags x channels)

`y`: lagged estimated of target (ylags x 1)

*Output Arguments*:

`yh`: estimated target, which can be interpreted as the prob(yh == 1)

------------------------------------

`larx_predict.m`: predicts entire target time series

*Input Arguments*:

`w`: weight vector

`X`: exogenous input (channels x samples)

`yo`: initial target value

`cfg`: parameters struct 

*Output Arguments*:

`yh`: target time series

------------------------------------

`larx_testing.m`: tests larx library using simulated data

------------------------------------

`sigmoid.m`: sigmoid function

*Input Arguments*:

`x`: input

*Output Arguments*:

`y`: output

------------------------------------

`my_sig.m`: generates simulated signal

*Input Arguments*:

`sigma`: width of gaussian peak

`ctr`: center location of peak

`T`: length of time series

*Output Arguments*:

`y`: output
