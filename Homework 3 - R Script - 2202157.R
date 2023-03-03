#SETUP
#load tidyverse
library(tidyverse)

#set options and scipen
options(scipen = 5, digits = 3)

#set working directory
setwd("~/GitHub/PS947---Homework-3---2202157")

#download, install and load lme
install.packages('lme4')
library(lme4)

#QUESTION 2 - RECOMMENDATIONS ON CHOICE DATA
#import data and summarise
d <- read.csv("recommendations.csv", row.names = 1) 
summary(d)
str(d)

#Part 2.1 - Fit a model to analyses how recommendation mode affects whether a recommendation is followed, describe analyses choices and justify why you picked them
#How IV (recommendation mode, auditory vs visual) affects DV (recommendation followed 1=yes, 0=no)

m <- glmer(data = d,
         RecommendationFollowed ~ Mode + (1 | ResponseID),
         family = binomial(link = "logit"));summary(m)
#JUSTIFICATION: General linear mixed effects model was used because looking at the relationship between two variables (e.g. how Mode predicts RecommendationFollowed). Both variables are binomial e.g. Mode is either visual or auditory and RecommendationFollowed as 1 = YES and 0 = NO hence the use of the binomial link function. Mixed effects model used as cannot assume each observation in our data frame is truly independent as repeated measures design was used for the stimulus where each participant did of the four stimuli. 

#Part 2.2 - Use model/ plots qualitatively assess evidence for recommendation mode affecting choice

d %>%
  ggplot(aes(x = RecommendationFollowed, y = Stimulus, fill = factor(Mode))) +
  geom_bar(stat="identity", position="dodge")+
  xlab("Recommendation")+ylab("Stimulus")+
  theme(legend.position = "top")+
  labs(fill = "ResponseID")
#attempted a graph, not working, give-up

#Part 2.3 - Distinction material: The authors of the study wondered whether one explanation for the results could be that participants perceive recommendations in one modality as being more competent, intelligent and/or thoughtful than in the other. Can you find any evidence for this? Does it affect your conclusions about the effect of modality?
#no clue skip


#QUESTION 3 - SOCIAL JUDGEMENTS OF FACES
#Part 3.1 - Replicate PCA using ′faces.csv′.

#read data file and summarise the data
d2 <- read.csv("faces.csv") 
summary(d2)
str(d2)

### conduct PCA
q2pca <- prcomp(~ attractive + caring + aggressive + mean + intelligent + confident + emotionally.stable + trustworthy + responsible + sociable + weird + unhappy + dominant + threatening , d2, scale = TRUE)
summary(q2pca)

### instal and load factoextra
install.packages('factoextra')
library(factoextra)

#create scree plot
factoextra::fviz_eig(q2pca)

#CONCLUSION Oosterhof and Todorov (2008) found that their first two principal components accounted for more than 80% of the variance with their first principal component accounting for more than 60% of the variance. My PCA revealed that that the cumulative proportion of variance explained by the the first two principal components was 81.8% with the first principle component accounting for 62.8% of the variance. Thus my PCA replicated the PCA results found by Oosterhof and Todoro (2008).

#Part 3.2 - Testing two factor model on ′faces_big.csv′
d3 <- read.csv("faces_big.csv") 
summary(d3)
str(d3)

#install and load lavaan
install.packages('lavaan')
library(lavaan)

#Define the latent factors for valence and dominance
sjofcomponents <- 'valence =~ trustworthy + caring + responsible + sociable
dominance =~ dominant + confident + aggressive + mean'

#Part 3.3 - Run model, Conclusions about hypothesis
model_field <- cfa(sjofcomponents, d3)
summary(model_field)

#install and load tidySEM
install.packages('tidySEM')
library(tidySEM)

#visualise the model
library(tidySEM)
graph_sem(model_field,
          layout = get_layout("", "valence", "", "", "dominance", "",
                              "trustworthy" , "caring" , "responsible" , "sociable", "dominant" , "confident", "aggressive" , "mean",
                              rows = 2))

#model fit
summary(model_field, fit.measures = TRUE)

#To pass RMSEA < 0.07
fitMeasures(model_field) ["rmsea"]
#CONCLUSION: RMSEA = 0.593 thus RMSEA not < 0.07 thus model does not account well for the data

#To pass CFI >= 0.9
fitMeasures(model_field) ["cfi"]
#CONCLUSION: CFI = 0.558 thus CFI not >= 0.9 thus model does not account well for the data

#CONLUSION: Based on these measures, it seems like Dr Hughes' hypothesis (that 'trustworthy', 'caring', 'responsible' and 'sociable' should load onto the 'valence' factor, and 'dominant', 'confident', 'aggressive' and 'mean' should load onto the 'dominance' factor) is not supported by the data. 