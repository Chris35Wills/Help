# Geostatistics general info

Some notes on bits and pieces worth remembering, reconsidering and reviewing whenever delving into geostats.

Full sets of notes and examples in R are available [here](http://www.css.cornell.edu/faculty/dgr2/teach/degeostats.html) and [here](http://www.math.umt.edu/graham/stat544/) and are well worth working through if you have the time.

## Some definitions

### Variance

The average of the squared differences from the Mean

### Covariance

The mean value of the product of the deviations of two variates from their respective means

### Standard deviation

The square root of variance

### Spatial autocorrelation

This is a measure of the degree to which a set of spatial features and their associated values cluster together in space (positive spatial autocorrelation) or disperse (negative spatial autocorrelation). It is important to know whether data are autocorrelated (and to the degree to which they are) when applying certain statistical tests as the presence of autocorrelation can violate certain assumptions - most statistical approaches assume that measured outcomes are indpendent of one another (they are based on the assumption that samples are randomly sampled from a population - therefore if samples are biased, stats calculated will not accurately characterize the data).

Spatial autocorrelation can be detected using "Morans I" or a Mantel Test - these can be implemented as descibed [here](http://www.ats.ucla.edu/stat/mult_pkg/faq/general/spatial_autocorr.htm). 

### Stationarity

There are two key types to consider. **Mean stationarity** is where a *mean is assumed constant between samples*, indpendent of location. **Second-order stationarity** is the assumption that the *covariance between two points* is the same for a given distance and direction, regardless of which two points are chosen. For semivariograms, **intrinsic stationarity** is the assumption that the *variance of the difference* is the same between any two points that are at the same distance and direction apart no matter which two points you choose (taken from [here](http://resources.arcgis.com/en/help/main/10.1/index.html#//003100000033000000)).

A nice [summary](https://desktop.arcgis.com/en/desktop/latest/guide-books/extensions/geostatistical-analyst/random-processes-with-dependence.htm):

"In a spatial setting, the idea of stationarity is used to obtain the necessary replication. Stationarity is an assumption that is often reasonable for spatial data. There are two types of stationarity. One is mean stationarity, where it's assumed that the mean is constant between samples and is independent of location.

The second type of stationarity is **second-order stationarity** for *covariance* and **intrinsic stationarity** for *semivariograms*. Second-order stationarity is the assumption that the covariance is the same between any two points that are at the same distance and direction apart no matter which two points you choose [for a given region]. The covariance is dependent on the distance between any two values and not on their locations. For semivariograms, intrinsic stationarity is the assumption that the variance of the difference is the same between any two points that are at the same distance and direction apart no matter which two points you choose [for a given region].

Second-order and intrinsic stationarity are assumptions necessary to get the replication to estimate the dependence rules, which allows you to make predictions and assess uncertainty in the predictions. Notice that it is the spatial information (similar distance between any two points) that provides the replication."

### Experimental variogram:

Variogram plots variance against point pairs classified according to spacing (lag)

Semi-variogram plots semi-variance (square root of variance) against point pairs classified according to spacing (lag)

### Residual variogram: 

Same as the experimental except based on data that has had an underlying trend removed from it

### Zonal anisotropy (see http://www.math.umt.edu/graham/stat544/anisofit.pdf): 

Occurs when both the range and sill might vary with the direction of the variogram. This is sometimes also referred to as sill anisotropy to emphasize that the sill may vary with direction, unlike in the geometric case.

i.e. if you test variograms for your data using different directions and the sill changes, then you have zonal anisotropy

### Geometric anisotropy (see http://www.math.umt.edu/graham/stat544/anisofit.pdf):

Occurs where the range varies with the direction of the variogram, but the sill remains constant

i.e. if you test variograms for your data using different directions and the range changes BUT the sill DOESN'T, then you have geometric anisotropy

### Range:

Distance from the origin at which the sill is reached - should essentially form the "rising limb" of a variogram model

### Sill: 

Level at which variance is no longer related to variance - this is the point where the variogram "plateaus" at the end of the range

### Nugget:

Hypothetically should be zero but due to factors such as measurement error related to observations on which a variogram is created 

### Presence of a trend (see here under "Trend" http://people.ku.edu/~gbohling/cpe940/Variograms.pdf):

If the empirical semivariogram continues climbing steadily beyond the global variance value, this is often indicative of a significant spatial trend in the variable, resulting in a negative correlation between variable values separated by large lags. Three options for dealing with lag include: 

(1) Fit a trend surface and work with residuals from the trend

(2) Try to find a “trend-free” direction and use the variogram in that direction as the variogram for the “random” component of the variable (see the section on anisotropy, below)

(3) Ignore the problem and use a linear or power variogram

## Kriging

[Here](http://www.geo.mtu.edu/rs4hazards/ksdurst/website/Thesis/Kriging.html) is a nice walk through for data interpolation in Arc.

# Ordinary kriging
	
# Simple kriging
	
# Universal kriging

## Kriging in R

## Useful resources

[Spatial autocorrelation](http://userwww.sfsu.edu/efc/classes/biol710/spatial/spat-auto.htm)

[8.5 deadly sins of spatial analysis](http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2699.2011.02637.x/pdf)



