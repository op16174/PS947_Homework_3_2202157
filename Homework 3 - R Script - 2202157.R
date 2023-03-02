#SETUP
#load tidyverse
library(tidyverse)

#set options and scipen
options(scipen = 5, digits = 3)

#set working directory
setwd("~/GitHub/PS947---Homework-3---2202157")

#QUESTION 2 - RECOMMENDATIONS ON CHOICE DATA
#import data and summarise
d <- read.csv("recommendations.csv") 
summary(d)

#Part 2.1 - Fit a model, describe analyses choices and justify why you picked them
#Part 2.2 - Use model/ plots qualitatively assess evidence for recommendation mode affecting choice
#Part 2.3 - Distinction material: The authors of the study wondered whether one explanation for the results could be that participants perceive recommendations in one modality as being more competent, intelligent and/or thoughtful than in the other. Can you nd any evidence for this? Does it aect your conclusions about the eect of modality?


#QUESTION 3 - SOCIAL JUDGEMENTS OF FACES
#Part 3.1 - Replicate PCA using ′faces.csv′.
#Part 3.2 - Testing two factor model on ′faces_big.csv′
#Part 3.3 - Run model, Conclusions about hypothesis