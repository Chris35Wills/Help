library(moments)
library(e1071)
library(nortest)

### Normallity testing

# Useful recap/overview: 
  #http://www.dummies.com/how-to/content/how-to-test-data-normality-in-a-formal-way-in-r.html
  #http://geography.unt.edu/~wolverton/Normality%20Tests%20in%20SPSS.pdf
# Useful package: nortest
#Interesting discussion: http://stackoverflow.com/questions/7781798/seeing-if-data-is-normally-distributed-in-r/7788452#7788452
  
# H_0 : the observed distribution fits the normal distribution
# "If p is low null must go" - you want a high p value (>0.05) for data to be deemed normal by a test

# Open some data
sample_region=read.csv('O:/Documents/CHRIS_Bristol/Kriging/anisotropy/test_region_2/clipped_observation_data_test_2.csv', header=FALSE, sep=",", col.names=c("x", "y", "z"))
names(sample_region)
ncol(sample_region)
class(sample_region)
sample_region$x <- sample_region$x +800000. # "zero" the coordinates (specific to this data which extend from -800000 in x)
sample_region$y <- sample_region$y +3400000. # "zero" the coordinates (specific to this data which extend from -3400000 in y)
sample_region$z_fixed <- sample_region$z +2500. # make everything positive

# Histogram analysis: ideally you want this to be symmetrical with the highest frequency at the centre
# See here for some useful info: http://www.r-bloggers.com/basics-of-histograms/
hist_info<-hist(sample_region$z_fixed, breaks=100) # doesn't look normal
hist_fixed_info<-hist(log(sample_region$z_fixed), breaks=100) # looks more normal
          
# skewness and kurtosis, they should be around (0,3)
# see here for more info: http://www.graphpad.com/guides/prism/6/statistics/index.htm?stat_skewness_and_kurtosis.htm
skew<-skewness(log(sample_region$z_fixed)) # zero if completely normal - tail to the right = + skew / tail to the left = - skew (if > 1 or < -1 then the distrib. is far from symmetrical)
kurt<-kurtosis(log(sample_region$z_fixed)) # zero if completely normal - flat distrib. has a negative kurtosis / more peaked than a gaussian has a positive kurtosis

# Anderson Darling test: you want a p > 0.05
shapiro.test(log(sample_region$z_fixed)) # data set too big...
ad.test(log(sample_region$z_fixed))

# Q-Q plot: you should observe a good fit of the straight line
qqnorm(log(sample_region$z_fixed))
qqline(log(sample_region$z_fixed)) # adds a line to a "theoretical", by default normal, quantile-quantile plot which passes through the probs quantiles, by default the first and third quartiles
