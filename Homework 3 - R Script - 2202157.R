#SETUP
#load tidyverse
library(tidyverse)

#set options and scipen
options(scipen = 5, digits = 3)

#set working directory
setwd("~/GitHub/PS947---Homework-3---2202157")

#download, instal and load lme
install.packages('lme4')
library(lme4)

#QUESTION 2 - RECOMMENDATIONS ON CHOICE DATA
#import data and summarise
d <- read.csv("recommendations.csv") 
summary(d)
str(d)

#Part 2.1 - Fit a model to analyses how recommendation mode affects whether a recommendation is followed, describe analyses choices and justify why you picked them
#How IV (recommendation mode, auditory vs visual) affects DV (recommendation followed 1=yes, 0=no)


#Part 2.2 - Use model/ plots qualitatively assess evidence for recommendation mode affecting choice

#Part 2.3 - Distinction material: The authors of the study wondered whether one explanation for the results could be that participants perceive recommendations in one modality as being more competent, intelligent and/or thoughtful than in the other. Can you find any evidence for this? Does it affect your conclusions about the effect of modality?
d$Stimulus <- factor(d$Stimulus)

#no clue about how to start Q2 skip 

#QUESTION 3 - SOCIAL JUDGEMENTS OF FACES
#Part 3.1 - Replicate PCA using ′faces.csv′.
d2 <- read.csv("faces.csv") 
summary(d2)
str(d2)

#Part 3.2 - Testing two factor model on ′faces_big.csv′
d3 <- read.csv("faces_big.csv") 
summary(d3)
str(d3)

#Part 3.3 - Run model, Conclusions about hypothesis