# Geostatistics general info

Some notes on bits and pieces worth remembering, reconsidering and reviewing whenever delving into geostats.

## Spatial autocorrelation

This is a measure of the degree to which a set of spatial features and their associated values cluster together in space (positive spatial autocorrelation) or disperse (negative spatial autocorrelation). It is important to know whether data are autocorrelated (and to the degree to which they are) when applying certain statistical tests as the presence of autocorrelation can violate certain assumptions - most statistical approaches assume that measured outcomes are indpendent of one another (they are based on the assumption that samples are randomly sampled from a population - therefore if samples are biased, stats calculated will not accurately characterize the data).

Spatial autocorrelation can be detected using "Morans I" or a Mantel Test - these can be implemented as descibed [here](http://www.ats.ucla.edu/stat/mult_pkg/faq/general/spatial_autocorr.htm). 

## Kriging in R



## Useful resources

[Spatial autocorrelation](http://userwww.sfsu.edu/efc/classes/biol710/spatial/spat-auto.htm)

[8.5 deadly sins of spatial analysis](http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2699.2011.02637.x/pdf)



