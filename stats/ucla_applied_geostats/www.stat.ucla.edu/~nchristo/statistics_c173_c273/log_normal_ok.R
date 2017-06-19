#Read the data:
a <- read.table("http://www.stat.ucla.edu/~nchristo/statistics_c173_c273/soil.txt", header=TRUE)

library(gstat)
library(geoR)

#Create a gstat object:
g <- gstat(id="log_lead", formula = log(lead)~1, locations = ~x+y,
data = a)
#Plot the variogram:
plot(variogram(g), main="Semivariogram of the log_lead")
#Fit a model variogram to the sample variogram:
v.fit <- fit.variogram(variogram(g), vgm(0.5,"Sph",1000,0.1))
plot(variogram(g),v.fit)

#Obtain the variogram parameters:
v.fit

x1 <- rep(rep(0,nrow(a)+1),nrow(a)+1)             #Initialize
dist <- matrix(x1,nrow=nrow(a)+1,ncol=nrow(a)+1)  #the data distance matrix 

for (i in 1:(nrow(a)+1)){
	for (j in 1:(nrow(a)+1)){
		dist[i,j]=((a[i,1]-a[j,1])^2+(a[i,2]-a[j,2])^2)^.5		
		}
		}

#Spherical:		
c0 <- 0.05156252
c1 <- 0.51530678
alpha <- 965.1506

#Exponential:		
c0 <- 0.01010107
c1 <- 0.62802345
alpha <- 491.3881


x2 <- rep(rep(0,(nrow(a)+1)),nrow(a)+1)              #Initialize
G <- matrix(x2,nrow=(nrow(a)+1),ncol=(nrow(a)+1))     #the GAMMA matrix

for(i in 1:(nrow(a)+1)){
	for (j in 1:(nrow(a)+1)){
		G[i,j]=c1*(1-exp(-dist[i,j]/alpha))
                if(i==j){G[i,j]=0}                
		if(i==(nrow(a)+1)){G[i,j]=1}	
		if(j==(nrow(a)+1)){G[i,j]=1}
		if(i==(nrow(a)+1) & j==(nrow(a)+1)) {G[i,j]=0}
				}
				}
				
#Grid:
x.range <- as.integer(range(a[,1]))y.range <- as.integer(range(a[,2]))grd <- expand.grid(x=seq(from=x.range[1], to=x.range[2], by=50),y=seq(from=y.range[1], to=y.range[2], by=50))

b <- as.matrix(grd)

dist1 <- rep(0,nrow(a))             #Initialize distance vector for g.
z_hat <- rep(0, nrow(b))
var_z_hat <- rep(0, nrow(b))
lambda <- rep(0, nrow(b))
				
for(i in 1:nrow(grd)){
	g <- rep(1,nrow(a)+1) 
	for (j in 1:nrow(a)){
		dist1[j]=((b[i,1]-a[j,1])^2+(b[i,2]-a[j,2])^2)^.5
		g[j]=c0+c1*(1-exp(-dist1[j]/alpha))		
		}
w <- solve(G) %*% g          #Obtain the weights and the Lagrange parameter

z_hat[i] <- w[-length(g)] %*% log(a$lead)         #Compute the estimate
var_z_hat[i] <- t(w) %*% g  #Compute the variance of the estimate
lambda[i] <- 	w[length(g)]
		}

#Back trnasformation:
lead <- exp(z_hat+var_z_hat/2-lambda)

#Collapse the vector of lead into a matrix:
qqq <- matrix(lead,
length(seq(from=x.range[1], to=x.range[2], by=50)),
length(seq(from=y.range[1], to=y.range[2], by=50)))

#Create a raster map:
image(seq(from=x.range[1], to=x.range[2], by=50),
  seq(from=y.range[1], to=y.range[2], by=50), qqq,
  xlab="West to East", ylab="South to North", main="Predicted values")

#Add the data points:
points(a)

#Add contours:
contour(seq(from=x.range[1], to=x.range[2], by=50), 
seq(from=y.range[1],to=y.range[2], by=50), qqq, add=TRUE, col="black", labcex=1)

#Remove part outside the data:
X <- seq(from=x.range[1], to=x.range[2], by=50)
Y <- seq(from=y.range[1], to=y.range[2], by=50)
dz.mask <- function(grid, pts, x.dom, y.dom, window, mitre=2) {
N <- length(pts[ ,1]) ; mask <- array( NA, dim(grid) )
for(j in 1:N) {
dx <- abs(x.dom - pts$x[j])
dy <- abs(y.dom - pts$y[j])
d.Mx <- tcrossprod( dx , rep(1, length(dy)) )^mitre +
tcrossprod( rep(1, length(dx)), dy )^mitre
mask[ d.Mx < window^mitre ] <- FALSE
}
return(mask+grid)
}
qqq.masked <- dz.mask(qqq, a, X, Y, 250)
image(X,Y,qqq.masked)

points(a)

contour(seq(from=x.range[1], to=x.range[2], by=50),
seq(from=y.range[1],to=y.range[2], by=50), qqq.masked , 
levels=seq(50, 650, by=50),, add=TRUE, col="black", labcex=1)




