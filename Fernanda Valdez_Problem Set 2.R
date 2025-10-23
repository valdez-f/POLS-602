#################
#Fernanda Valdez
# Problem Set 1
# October 21, 2025
# POLS 602
#################

install.packages('dplyr')
install.packages("ggplot2")
library(dplyr)
library(tidyr)
library(ggplot2)
require(ggplot2)
set.seed(5315)

################
## Simulation ##
################

# 1. Create two random variables with 20 observations each.

a <- rnorm(20)
b <- rnorm(20)


#    Calculate the correlation between the two variables. 
cor(a, b)

#    Repeat process many times.
correlations <- replicate(400,{ 
  a <- rnorm(20)
  b <- rnorm(20)
  cor(a,b)})


#    Plot the distribution of the correlation coefficients  and report the 
#    standard deviation. 
plot(correlations)

hist(correlations)
hist(correlations,
     main = "Distribution of the correlation coefficients",
     xlab = "Correlations",
     col = "pink",
     border = "purple")

plot (a, b,
      main = "Correlation between a and b",
      xlab = "Variable a",
      ylab = "Variable b",
      col = "magenta")

sd(correlations)


#    On average, what would we expect the correlation
#    between the two variables be? What does this distribution tell us about 
#    sample estimates of population parameters? 
#    -- We would expect the correlation between them to be close to 0 because
#       they are two different random variables. 
#    -- The distribution indicates variation because we only have 20 observations 
#       for 50 repetitions. If we had more observations and repetitions and larger sample size...
# small will make you think there is a relationship, increasing it will show you there is now relationship.

# 2. Repeat with a sample size of 1,000 and provide substantive interpretation 
#    of how the results differ. 
correlations <- replicate(1000,{ 
  a <- rnorm(1000)
  b <- rnorm(1000)
  cor(a,b)})

plot(correlations)
hist(correlations)

hist(correlations,
     main = "Distribution of the correlation coefficients",
     xlab = "Correlations",
     col = "pink",
     border = "purple")


plot(a,b)

sd(correlations)

# --Here, we increased our sample size to 1,000, a much larger sample
#   size that is more representative of the population. Because we have a more
#   representative sample, we get more  concentration around 0, creating
#   what resembles a bell curve. 

# shows that there is no correlation because that's what a larger sample tells us!!!

# 3. Create three random variables that have the following relationship: 
#    Z -> X     Z -> Y
#    HINT: Start by generating Z as a random variable, then create X and Y as 
#    some function of Z plus random noise. 

# lab
Z <- rnorm(20)
X <- Z + rnorm(20)
Y <- Z + rnorm(20)

cor (X,Y)

# some correlation still because they have a similar relationship with Y even with all the noise. 

Z <- rnorm(50, mean = 0 , sd = 80)
X <- Z + rnorm(50, mean = 0 , sd = 80)
Y <- Z + rnorm(50, mean = 0 , sd = 80)
cor(Z,X)
cor(Z,Y)

#    Plot X and Y on scatter plot and report their correlation. 
plot (X, Y,
      main = "Correlation between X and Y",
      xlab = "Variable X",
      ylab = "Variable Y",
      col = "magenta")

cor(X, Y)

#    What does this tell us about interpreting correlations? 
#    -- The correlation is .6 so there is a positive relationship with a linear
#       relationship. We can't say there is a strong linear relationship because
#       the correlation is just past .5 though. 
