#-----------------------------------------------------------------------------------------
# *** Mission Logs ***
# Polish companies bankruptcy data Data Set. (n.d.). Retrieved February 09, 2018, 
# from https://archive.ics.uci.edu/ml/datasets/Polish companies bankruptcy data
# .....¯\_(o,O)_/¯
# Explorers: Yong Lester Monar, Gerry Anggacipta, Tew Boon Teck, Yong Jun Jie, Ho Wei Jing
# Coders: Jun Jie, Wei Jing
#-----------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------#
#-----------------------------Exploration Mission Initialised-----------------------------#
#-----------------------------------------------------------------------------------------#
#------------Legend-----------------
# Variable names:- (if starts with:)
#      - "g" = global variable/Important objects
#      - "v" = local variable/Temporary objects
# Function names to start with "f"

#-----------------------------------------------------------------------------------------#
#-------------------------------Understand Data with Rattle-------------------------------#
#-----------------------------------------------------------------------------------------#
library(rattle)
rattle()

#-----------------------------------------------------------------------------------------#
#---------------------------Phase 0: Understanding the Data-------------------------------#
#-----------------------------------------------------------------------------------------#

# Use as World Constant - Global Variables
# --- Set Workstation Path
gWorkStationPath <- "D://3_Studies/1_Notes/5_Final Copy/1_RCode"
# --- Set Working File Path
gWorkingFilePath_Year1 <- "../0_Datasets/1year.csv"
gWorkingFilePath_Year2 <- "../0_Datasets/2year.csv"
gWorkingFilePath_Year3 <- "../0_Datasets/3year.csv"
gWorkingFilePath_Year4 <- "../0_Datasets/4year.csv"
gWorkingFilePath_Year5 <- "../0_Datasets/5year.csv"

# --- Set Project Seed Number
gSeedCore <- 2018
# gData - declared for data file load
# gInput - declared for machine learning input
# gTarget - declared for machine learning target

# Function Database
# 1. fRemoveMissing - Function to remove missing values from column(s)

# Set-up Workstation
setwd(gWorkStationPath)

# Install and Initialise all the Necessary Libraries
#install.packages("reshape")
#install.packages("dplyr")
#install.packages("CORElearn")
#install.packages("GGally")
#install.packages("ggplot2")
#install.packages("nnet")
#install.packages("caret")
#install.packages("pscl")
#install.packages("car")
#install.packages("matrixStats")
#install.packages('caTools')
#install.packages('ROCR')
#install.packages("ROSE")
#install.packages("pROC")
#install.packages("randomForest")
#install.packages("e1071")
#install.packages("VIM")
#install.packages("corrplot")

library(reshape, quietly=TRUE)
library(dplyr)
library(CORElearn)
library(GGally)
library(ggplot2)
library(nnet)
library(caret)
library(pscl)
library(car)
library(matrixStats)
library(caTools)
library(ROCR)
library(ROSE)
library(pROC)
library(randomForest)
library(e1071)
library(VIM)
library(corrplot)

# Load the DATA file in R
#gData = read.csv(gWorkingFilePath, na.strings=c(".", "NA", "", "?"), strip.white=TRUE, 
#                 encoding="UTF-8", header = TRUE)

gData_Year1 = read.csv(gWorkingFilePath_Year1, col.name=c("Attr1", "Attr2", "Attr3", "Attr4", 
                                                          "Attr5", "Attr6", "Attr7", "Attr8", 
                                                          "Attr9", "Attr10", "Attr11", "Attr12", 
                                                          "Attr13", "Attr14", "Attr15", "Attr16", 
                                                          "Attr17", "Attr18", "Attr19", "Attr20", 
                                                          "Attr21", "Attr22", "Attr23", "Attr24", 
                                                          "Attr25", "Attr26", "Attr27", "Attr28", 
                                                          "Attr29", "Attr30", "Attr31", "Attr32", 
                                                          "Attr33", "Attr34", "Attr35", "Attr36", 
                                                          "Attr37", "Attr38", "Attr39", "Attr40", 
                                                          "Attr41", "Attr42", "Attr43", "Attr44", 
                                                          "Attr45", "Attr46", "Attr47", "Attr48", 
                                                          "Attr49", "Attr50", "Attr51", "Attr52", 
                                                          "Attr53", "Attr54", "Attr55", "Attr56", 
                                                          "Attr57", "Attr58", "Attr59", "Attr60", 
                                                          "Attr61", "Attr62", "Attr63", "Attr64", 
                                                          "class"), na.strings=c(".", "NA", "", 
                                                                                 "?"), 
                       strip.white=TRUE, encoding="UTF-8", header = TRUE)

gData_Year2 = read.csv(gWorkingFilePath_Year2, col.name=c("Attr1", "Attr2", "Attr3", "Attr4", 
                                                          "Attr5", "Attr6", "Attr7", "Attr8", 
                                                          "Attr9", "Attr10", "Attr11", "Attr12", 
                                                          "Attr13", "Attr14", "Attr15", "Attr16", 
                                                          "Attr17", "Attr18", "Attr19", "Attr20", 
                                                          "Attr21", "Attr22", "Attr23", "Attr24", 
                                                          "Attr25", "Attr26", "Attr27", "Attr28", 
                                                          "Attr29", "Attr30", "Attr31", "Attr32", 
                                                          "Attr33", "Attr34", "Attr35", "Attr36", 
                                                          "Attr37", "Attr38", "Attr39", "Attr40", 
                                                          "Attr41", "Attr42", "Attr43", "Attr44", 
                                                          "Attr45", "Attr46", "Attr47", "Attr48", 
                                                          "Attr49", "Attr50", "Attr51", "Attr52", 
                                                          "Attr53", "Attr54", "Attr55", "Attr56", 
                                                          "Attr57", "Attr58", "Attr59", "Attr60", 
                                                          "Attr61", "Attr62", "Attr63", "Attr64", 
                                                          "class"), na.strings=c(".", "NA", "", 
                                                                                 "?"), 
                       strip.white=TRUE, encoding="UTF-8", header = TRUE)

gData_Year3 = read.csv(gWorkingFilePath_Year3, col.name=c("Attr1", "Attr2", "Attr3", "Attr4", 
                                                          "Attr5", "Attr6", "Attr7", "Attr8", 
                                                          "Attr9", "Attr10", "Attr11", "Attr12", 
                                                          "Attr13", "Attr14", "Attr15", "Attr16", 
                                                          "Attr17", "Attr18", "Attr19", "Attr20", 
                                                          "Attr21", "Attr22", "Attr23", "Attr24", 
                                                          "Attr25", "Attr26", "Attr27", "Attr28", 
                                                          "Attr29", "Attr30", "Attr31", "Attr32", 
                                                          "Attr33", "Attr34", "Attr35", "Attr36", 
                                                          "Attr37", "Attr38", "Attr39", "Attr40", 
                                                          "Attr41", "Attr42", "Attr43", "Attr44", 
                                                          "Attr45", "Attr46", "Attr47", "Attr48", 
                                                          "Attr49", "Attr50", "Attr51", "Attr52", 
                                                          "Attr53", "Attr54", "Attr55", "Attr56", 
                                                          "Attr57", "Attr58", "Attr59", "Attr60", 
                                                          "Attr61", "Attr62", "Attr63", "Attr64", 
                                                          "class"), na.strings=c(".", "NA", "", 
                                                                                 "?"), 
                       strip.white=TRUE, encoding="UTF-8", header = TRUE)

gData_Year4 = read.csv(gWorkingFilePath_Year4, col.name=c("Attr1", "Attr2", "Attr3", "Attr4", 
                                                          "Attr5", "Attr6", "Attr7", "Attr8", 
                                                          "Attr9", "Attr10", "Attr11", "Attr12", 
                                                          "Attr13", "Attr14", "Attr15", "Attr16", 
                                                          "Attr17", "Attr18", "Attr19", "Attr20", 
                                                          "Attr21", "Attr22", "Attr23", "Attr24", 
                                                          "Attr25", "Attr26", "Attr27", "Attr28", 
                                                          "Attr29", "Attr30", "Attr31", "Attr32", 
                                                          "Attr33", "Attr34", "Attr35", "Attr36", 
                                                          "Attr37", "Attr38", "Attr39", "Attr40", 
                                                          "Attr41", "Attr42", "Attr43", "Attr44", 
                                                          "Attr45", "Attr46", "Attr47", "Attr48", 
                                                          "Attr49", "Attr50", "Attr51", "Attr52", 
                                                          "Attr53", "Attr54", "Attr55", "Attr56", 
                                                          "Attr57", "Attr58", "Attr59", "Attr60", 
                                                          "Attr61", "Attr62", "Attr63", "Attr64", 
                                                          "class"), na.strings=c(".", "NA", "", 
                                                                                 "?"), 
                       strip.white=TRUE, encoding="UTF-8", header = TRUE)

gData_Year5 = read.csv(gWorkingFilePath_Year5, col.name=c("Attr1", "Attr2", "Attr3", "Attr4", 
                                                          "Attr5", "Attr6", "Attr7", "Attr8", 
                                                          "Attr9", "Attr10", "Attr11", "Attr12", 
                                                          "Attr13", "Attr14", "Attr15", "Attr16", 
                                                          "Attr17", "Attr18", "Attr19", "Attr20", 
                                                          "Attr21", "Attr22", "Attr23", "Attr24", 
                                                          "Attr25", "Attr26", "Attr27", "Attr28", 
                                                          "Attr29", "Attr30", "Attr31", "Attr32", 
                                                          "Attr33", "Attr34", "Attr35", "Attr36", 
                                                          "Attr37", "Attr38", "Attr39", "Attr40", 
                                                          "Attr41", "Attr42", "Attr43", "Attr44", 
                                                          "Attr45", "Attr46", "Attr47", "Attr48", 
                                                          "Attr49", "Attr50", "Attr51", "Attr52", 
                                                          "Attr53", "Attr54", "Attr55", "Attr56", 
                                                          "Attr57", "Attr58", "Attr59", "Attr60", 
                                                          "Attr61", "Attr62", "Attr63", "Attr64", 
                                                          "class"), na.strings=c(".", "NA", "", 
                                                                                 "?"), 
                       strip.white=TRUE, encoding="UTF-8", header = TRUE)

#-------------------Deeper Look into Year 1 to 5 data
# Skew left (look at tail) negative distribution
# Skew right (look at tail) positive distribution
#---------------Year 1
summary(gData_Year1)
# Observation Summary
# No NAs: Attr13, Attr19, Attr20, Attr 23, Attr30, Attr31, Attr39, Attr42, Attr43, Attr44
# Attr49, Attr55, Attr56, Attr58, Attr62
# HIGHLIGHTED NAs: Attr37 = 2740 NAs
# Skewed Distribution: A brief glance at the mean and medium of the Attributes revealed
# a number of them seems to be positively skewed, and that the mean cannot be used as a
# statistic of centrality (indicator for more common value of variable).

# Plot Attr 1 - net profit / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr1)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 1 - net profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr1, main="Normal QQ plot of Attr 1 - net profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is more negatively skewed

# Plot Attr 2 - total liabilities / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr2)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 2 - total liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr2, main="Normal QQ plot of Attr 2 - total liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is more positively skewed

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365 (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr5)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr5, main="Normal QQ plot of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 6 - retained earnings / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr6)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 6 - retained earnings / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr6, main="Normal QQ plot of Attr 6 - retained earnings / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed

# Plot Attr 7 - EBIT / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr7)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 7 - EBIT / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr7, main="Normal QQ plot of Attr 7 - EBIT / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 10 - equity / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr10)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 10 - equity / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr10, main="Normal QQ plot of Attr 10 - equity / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 12 - gross profit / short-term liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr12)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 12 - gross profit / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr12, main="Normal QQ plot of Attr 12 - gross profit / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 14 - (gross profit + interest) / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr14)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 14 - (gross profit + interest) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr14, main="Normal QQ plot of Attr 14 - (gross profit + interest) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 15 - (total liabilities * 365) / (gross profit + depreciation) (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr15)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr15, main="Normal QQ plot of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed

# Plot Attr 16 - (gross profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr16)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 16 - (gross profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr16, main="Normal QQ plot of Attr 16 - (gross profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 18 - gross profit / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr18)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 18 - gross profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr18, main="Normal QQ plot of Attr 18 - gross profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 19 - gross profit / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr19)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 19 - gross profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr19, main="Normal QQ plot of Attr 19 - gross profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed
# There seem to be one outlier that skewed the entire thing? Is it an error?

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 22 - profit on operating activities / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr22)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 22 - profit on operating activities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr22, main="Normal QQ plot of Attr 22 - profit on operating activities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 23 - net profit / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr23)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 23 - net profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr23, main="Normal QQ plot of Attr 23 - net profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 24 - gross profit (in 3 years) / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr24)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 24 - gross profit (in 3 years) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr24, main="Normal QQ plot of Attr 24 - gross profit (in 3 years) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 25 - (equity - share capital) / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr25)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 25 - (equity - share capital) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr25, main="Normal QQ plot of Attr 25 - (equity - share capital) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 26 - (net profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr26)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 26 - (net profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr26, main="Normal QQ plot of Attr 26 - (net profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Attr 29 follows what seems to be a distribution very near the normal distribution
# Values are mostly clustered nicely around the mean.

# Plot Attr 30 - (total liabilities - cash) / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr30)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 30 - (total liabilities - cash) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr30, main="Normal QQ plot of Attr 30 - (total liabilities - cash) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed
# There seems to only be 2 positive outliers

# Plot Attr 31 - (gross profit + interest) / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr31)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 31 - (gross profit + interest) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr31, main="Normal QQ plot of Attr 31 - (gross profit + interest) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 35 - profit on sales / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr35)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 35 - profit on sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr35, main="Normal QQ plot of Attr 35 - profit on sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 38 - constant capital / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr38)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 38 - constant capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr38, main="Normal QQ plot of Attr 38 - constant capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 39 - profit on sales / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr39)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 39 - profit on sales / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr39, main="Normal QQ plot of Attr 39 - profit on sales / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365)) (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr41)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr41, main="Normal QQ plot of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 42 - profit on operating activities / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr42)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 42 - profit on operating activities / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr42, main="Normal QQ plot of Attr 42 - profit on operating activities / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 45 - net profit / inventory (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr45)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 45 - net profit / inventory") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr45, main="Normal QQ plot of Attr 45 - net profit / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr48)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr48, main="Normal QQ plot of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 49 - EBITDA (profit on operating activities - depreciation) / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr49)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr49, main="Normal QQ plot of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed
# Seems like 1 positive outlier

# Plot Attr 59 - long-term liabilities / equity (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr59)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 59 - long-term liabilities / equity") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr59, main="Normal QQ plot of Attr 59 - long-term liabilities / equity", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 62 - (short-term liabilities *365) / sales (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr62)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 62 - (short-term liabilities *365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr62, main="Normal QQ plot of Attr 62 - (short-term liabilities *365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year1, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year1$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

vYear1NotBankrupt <- sum(gData_Year1$class==0)
vYear1NotBankrupt
# 6756
vYear1Bankrupt <- sum(gData_Year1$class==1)
vYear1Bankrupt
# 271

vPercentOfNotBankruptInYear1 <- (vYear1NotBankrupt/(vYear1Bankrupt+vYear1NotBankrupt)) * 100
vPercentOfNotBankruptInYear1
# 96.14345% Not Bankrupt Cases
vPercentOfBankruptInYear1 <- (vYear1Bankrupt/(vYear1Bankrupt+vYear1NotBankrupt)) * 100
vPercentOfBankruptInYear1
# 3.856553% Bankrupt Cases

#---------------Year 2
summary(gData_Year2)
# Observation Summary
# No NAs: None
# HIGHLIGHTED NAs: Attr37 = 4518 NAs
# Skewed Distribution: A brief glance at the mean and medium of the Attributes revealed
# a number of them seems to be positively skewed, and that the mean cannot be used as a
# statistic of centrality (indicator for more common value of variable).

# Plot Attr 1 - net profit / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr1)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 1 - net profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr1, main="Normal QQ plot of Attr 1 - net profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 2 - total liabilities / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr2)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 2 - total liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr2, main="Normal QQ plot of Attr 2 - total liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365 (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr5)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr5, main="Normal QQ plot of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 6 - retained earnings / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr6)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 6 - retained earnings / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr6, main="Normal QQ plot of Attr 6 - retained earnings / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed

# Plot Attr 7 - EBIT / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr7)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 7 - EBIT / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr7, main="Normal QQ plot of Attr 7 - EBIT / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 10 - equity / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr10)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 10 - equity / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr10, main="Normal QQ plot of Attr 10 - equity / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed
# Different from Year 1

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 12 - gross profit / short-term liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr12)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 12 - gross profit / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr12, main="Normal QQ plot of Attr 12 - gross profit / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 14 - (gross profit + interest) / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr14)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 14 - (gross profit + interest) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr14, main="Normal QQ plot of Attr 14 - (gross profit + interest) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 15 - (total liabilities * 365) / (gross profit + depreciation) (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr15)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr15, main="Normal QQ plot of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution (negative)
# Data spread contains high outliers in negative and positive balance

# Plot Attr 16 - (gross profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr16)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 16 - (gross profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr16, main="Normal QQ plot of Attr 16 - (gross profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 18 - gross profit / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr18)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 18 - gross profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr18, main="Normal QQ plot of Attr 18 - gross profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 19 - gross profit / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr19)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 19 - gross profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr19, main="Normal QQ plot of Attr 19 - gross profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed
# There seem to be one outlier that skewed the entire thing? Is it an error?

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 22 - profit on operating activities / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr22)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 22 - profit on operating activities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr22, main="Normal QQ plot of Attr 22 - profit on operating activities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 23 - net profit / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr23)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 23 - net profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr23, main="Normal QQ plot of Attr 23 - net profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 24 - gross profit (in 3 years) / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr24)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 24 - gross profit (in 3 years) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr24, main="Normal QQ plot of Attr 24 - gross profit (in 3 years) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 25 - (equity - share capital) / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr25)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 25 - (equity - share capital) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr25, main="Normal QQ plot of Attr 25 - (equity - share capital) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 26 - (net profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr26)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 26 - (net profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr26, main="Normal QQ plot of Attr 26 - (net profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Attr 29 follows what seems to be a distribution very near the normal distribution
# Values are mostly clustered nicely around the mean.

# Plot Attr 30 - (total liabilities - cash) / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr30)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 30 - (total liabilities - cash) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr30, main="Normal QQ plot of Attr 30 - (total liabilities - cash) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 31 - (gross profit + interest) / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr31)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 31 - (gross profit + interest) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr31, main="Normal QQ plot of Attr 31 - (gross profit + interest) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 35 - profit on sales / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr35)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 35 - profit on sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr35, main="Normal QQ plot of Attr 35 - profit on sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 38 - constant capital / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr38)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 38 - constant capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr38, main="Normal QQ plot of Attr 38 - constant capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 39 - profit on sales / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr39)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 39 - profit on sales / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr39, main="Normal QQ plot of Attr 39 - profit on sales / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365)) (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr41)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr41, main="Normal QQ plot of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))", ylab="")
# Observation Summary
# Most data points are around 0 +/- (negative)
# Data spread is amongst balanced between high outliers in negative and positive

# Plot Attr 42 - profit on operating activities / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr42)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 42 - profit on operating activities / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr42, main="Normal QQ plot of Attr 42 - profit on operating activities / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 45 - net profit / inventory (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr45)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 45 - net profit / inventory") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr45, main="Normal QQ plot of Attr 45 - net profit / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr48)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr48, main="Normal QQ plot of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 49 - EBITDA (profit on operating activities - depreciation) / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr49)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr49, main="Normal QQ plot of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is positively skewed

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed
# Seems like 1 positive outlier

# Plot Attr 59 - long-term liabilities / equity (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr59)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 59 - long-term liabilities / equity") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr59, main="Normal QQ plot of Attr 59 - long-term liabilities / equity", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 62 - (short-term liabilities *365) / sales (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr62)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 62 - (short-term liabilities *365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr62, main="Normal QQ plot of Attr 62 - (short-term liabilities *365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year2, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year2$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

vYear2NotBankrupt <- sum(gData_Year2$class==0)
vYear2NotBankrupt
# 9773
vYear2Bankrupt <- sum(gData_Year2$class==1)
vYear2Bankrupt
# 400

vPercentOfNotBankruptInYear2 <- (vYear2NotBankrupt/(vYear2Bankrupt+vYear2NotBankrupt)) * 100
vPercentOfNotBankruptInYear2
# 96.06802% Not Bankrupt Cases
vPercentOfBankruptInYear2 <- (vYear2Bankrupt/(vYear2Bankrupt+vYear2NotBankrupt)) * 100
vPercentOfBankruptInYear2
# 3.931977% Bankrupt Cases

#---------------Year 3
summary(gData_Year3)
# Observation Summary
# No NAs: Attr1, Attr2, Attr3, Attr6, Attr7, , Attr10, Attr11, Attr14, Attr18, Attr22,
# Attr25, Attr29, Attr35, Attr38, Attr48, Attr51, Attr55, Attr57, Attr59,\
# HIGHLIGHT NAs: Attr37 = 4736 NAs
# Skewed Distribution: A brief glance at the mean and medium of the Attributes revealed
# a number of them seems to be positively skewed, and that the mean cannot be used as a
# statistic of centrality (indicator for more common value of variable).

# Plot Attr 1 - net profit / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr1)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 1 - net profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr1, main="Normal QQ plot of Attr 1 - net profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 2 - total liabilities / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr2)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 2 - total liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr2, main="Normal QQ plot of Attr 2 - total liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365 (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr5)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr5, main="Normal QQ plot of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 6 - retained earnings / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr6)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 6 - retained earnings / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr6, main="Normal QQ plot of Attr 6 - retained earnings / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed

# Plot Attr 7 - EBIT / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr7)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 7 - EBIT / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr7, main="Normal QQ plot of Attr 7 - EBIT / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 10 - equity / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr10)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 10 - equity / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr10, main="Normal QQ plot of Attr 10 - equity / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 12 - gross profit / short-term liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr12)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 12 - gross profit / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr12, main="Normal QQ plot of Attr 12 - gross profit / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 14 - (gross profit + interest) / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr14)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 14 - (gross profit + interest) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr14, main="Normal QQ plot of Attr 14 - (gross profit + interest) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 15 - (total liabilities * 365) / (gross profit + depreciation) (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr15)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr15, main="Normal QQ plot of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 16 - (gross profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr16)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 16 - (gross profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr16, main="Normal QQ plot of Attr 16 - (gross profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 18 - gross profit / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr18)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 18 - gross profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr18, main="Normal QQ plot of Attr 18 - gross profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 19 - gross profit / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr19)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 19 - gross profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr19, main="Normal QQ plot of Attr 19 - gross profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 22 - profit on operating activities / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr22)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 22 - profit on operating activities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr22, main="Normal QQ plot of Attr 22 - profit on operating activities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 23 - net profit / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr23)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 23 - net profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr23, main="Normal QQ plot of Attr 23 - net profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 24 - gross profit (in 3 years) / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr24)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 24 - gross profit (in 3 years) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr24, main="Normal QQ plot of Attr 24 - gross profit (in 3 years) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 25 - (equity - share capital) / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr25)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 25 - (equity - share capital) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr25, main="Normal QQ plot of Attr 25 - (equity - share capital) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 26 - (net profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr26)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 26 - (net profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr26, main="Normal QQ plot of Attr 26 - (net profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Attr 29 follows what seems to be a distribution very near the normal distribution
# Values are mostly clustered nicely around the mean.

# Plot Attr 30 - (total liabilities - cash) / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr30)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 30 - (total liabilities - cash) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr30, main="Normal QQ plot of Attr 30 - (total liabilities - cash) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed.

# Plot Attr 31 - (gross profit + interest) / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr31)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 31 - (gross profit + interest) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr31, main="Normal QQ plot of Attr 31 - (gross profit + interest) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 35 - profit on sales / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr35)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 35 - profit on sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr35, main="Normal QQ plot of Attr 35 - profit on sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 38 - constant capital / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr38)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 38 - constant capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr38, main="Normal QQ plot of Attr 38 - constant capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 39 - profit on sales / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr39)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 39 - profit on sales / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr39, main="Normal QQ plot of Attr 39 - profit on sales / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365)) (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr41)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr41, main="Normal QQ plot of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 42 - profit on operating activities / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr42)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 42 - profit on operating activities / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr42, main="Normal QQ plot of Attr 42 - profit on operating activities / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 45 - net profit / inventory (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr45)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 45 - net profit / inventory") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr45, main="Normal QQ plot of Attr 45 - net profit / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is positively skewed

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr48)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr48, main="Normal QQ plot of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 49 - EBITDA (profit on operating activities - depreciation) / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr49)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr49, main="Normal QQ plot of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed

# Plot Attr 59 - long-term liabilities / equity (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr59)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 59 - long-term liabilities / equity") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr59, main="Normal QQ plot of Attr 59 - long-term liabilities / equity", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 62 - (short-term liabilities *365) / sales (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr62)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 62 - (short-term liabilities *365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr62, main="Normal QQ plot of Attr 62 - (short-term liabilities *365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year3, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year3$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

vYear3NotBankrupt <- sum(gData_Year3$class==0)
vYear3NotBankrupt
# 10008
vYear3Bankrupt <- sum(gData_Year3$class==1)
vYear3Bankrupt
# 495

vPercentOfNotBankruptInYear3 <- (vYear3NotBankrupt/(vYear3Bankrupt+vYear3NotBankrupt)) * 100
vPercentOfNotBankruptInYear3
# 95.28706% Not Bankrupt Cases
vPercentOfBankruptInYear3 <- (vYear3Bankrupt/(vYear3Bankrupt+vYear3NotBankrupt)) * 100
vPercentOfBankruptInYear3
# 4.712939% Bankrupt Cases

#---------------Year 4
summary(gData_Year4)
# Observation Summary
# No NAs: Attr9, Attr 55
# HIGHLIGHT NAs: Attr 37 = 4442 NAs
# Skewed Distribution: A brief glance at the mean and medium of the Attributes revealed a number
# of them seems to be skewed right, with a number skewed left and only one column that is centered. 
# It implies that the mean cannot be used as a statistic of centrality 
# (indicator for more common value of variable).

# Plot Attr 1 - net profit / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr1)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 1 - net profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr1, main="Normal QQ plot of Attr 1 - net profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is more positively skewed

# Plot Attr 2 - total liabilities / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr2)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 2 - total liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr2, main="Normal QQ plot of Attr 2 - total liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365 (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr5)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr5, main="Normal QQ plot of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 6 - retained earnings / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr6)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 6 - retained earnings / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr6, main="Normal QQ plot of Attr 6 - retained earnings / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed

# Plot Attr 7 - EBIT / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr7)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 7 - EBIT / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr7, main="Normal QQ plot of Attr 7 - EBIT / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 10 - equity / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr10)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 10 - equity / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr10, main="Normal QQ plot of Attr 10 - equity / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 12 - gross profit / short-term liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr12)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 12 - gross profit / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr12, main="Normal QQ plot of Attr 12 - gross profit / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 14 - (gross profit + interest) / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr14)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 14 - (gross profit + interest) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr14, main="Normal QQ plot of Attr 14 - (gross profit + interest) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 15 - (total liabilities * 365) / (gross profit + depreciation) (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr15)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr15, main="Normal QQ plot of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 16 - (gross profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr16)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 16 - (gross profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr16, main="Normal QQ plot of Attr 16 - (gross profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 18 - gross profit / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr18)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 18 - gross profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr18, main="Normal QQ plot of Attr 18 - gross profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 19 - gross profit / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr19)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 19 - gross profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr19, main="Normal QQ plot of Attr 19 - gross profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 22 - profit on operating activities / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr22)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 22 - profit on operating activities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr22, main="Normal QQ plot of Attr 22 - profit on operating activities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 23 - net profit / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr23)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 23 - net profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr23, main="Normal QQ plot of Attr 23 - net profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 24 - gross profit (in 3 years) / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr24)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 24 - gross profit (in 3 years) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr24, main="Normal QQ plot of Attr 24 - gross profit (in 3 years) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is positively skewed

# Plot Attr 25 - (equity - share capital) / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr25)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 25 - (equity - share capital) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr25, main="Normal QQ plot of Attr 25 - (equity - share capital) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 26 - (net profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr26)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 26 - (net profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr26, main="Normal QQ plot of Attr 26 - (net profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Attr 29 follows what seems to be a distribution very near the normal distribution
# Values are mostly clustered nicely around the mean.

# Plot Attr 30 - (total liabilities - cash) / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr30)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 30 - (total liabilities - cash) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr30, main="Normal QQ plot of Attr 30 - (total liabilities - cash) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 31 - (gross profit + interest) / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr31)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 31 - (gross profit + interest) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr31, main="Normal QQ plot of Attr 31 - (gross profit + interest) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 35 - profit on sales / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr35)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 35 - profit on sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr35, main="Normal QQ plot of Attr 35 - profit on sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 38 - constant capital / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr38)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 38 - constant capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr38, main="Normal QQ plot of Attr 38 - constant capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 39 - profit on sales / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr39)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 39 - profit on sales / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr39, main="Normal QQ plot of Attr 39 - profit on sales / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365)) (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr41)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr41, main="Normal QQ plot of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 42 - profit on operating activities / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr42)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 42 - profit on operating activities / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr42, main="Normal QQ plot of Attr 42 - profit on operating activities / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 45 - net profit / inventory (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr45)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 45 - net profit / inventory") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr45, main="Normal QQ plot of Attr 45 - net profit / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr48)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr48, main="Normal QQ plot of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 49 - EBITDA (profit on operating activities - depreciation) / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr49)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr49, main="Normal QQ plot of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed

# Plot Attr 59 - long-term liabilities / equity (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr59)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 59 - long-term liabilities / equity") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr59, main="Normal QQ plot of Attr 59 - long-term liabilities / equity", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 62 - (short-term liabilities *365) / sales (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr62)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 62 - (short-term liabilities *365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr62, main="Normal QQ plot of Attr 62 - (short-term liabilities *365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year4, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year4$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

vYear4NotBankrupt <- sum(gData_Year4$class==0)
vYear4NotBankrupt
# 9277
vYear4Bankrupt <- sum(gData_Year4$class==1)
vYear4Bankrupt
# 515

vPercentOfNotBankruptInYear4 <- (vYear4NotBankrupt/(vYear4Bankrupt+vYear4NotBankrupt)) * 100
vPercentOfNotBankruptInYear4
# 94.7406% Not Bankrupt Cases
vPercentOfBankruptInYear4 <- (vYear4Bankrupt/(vYear4Bankrupt+vYear4NotBankrupt)) * 100
vPercentOfBankruptInYear4
# 5.259395% Bankrupt Cases

#---------------Year 5
summary(gData_Year5)
# Observation Summary 
# No NAs: Attr13, Attr19, Attr20, Attr23, Attr30, Attr31, Attr39, Attr42, Attr43, Attr44, Attr49
# Attr55, Attr56, Attr58, Attr62
# HIGHLIGHT NAs: Attr37 = 2548 NAs
# Skewed Distribution: A brief glance at the mean and medium of the Attributes revealed a number
# of them seems to be skewed right, with a number skewed left and only one column that is centered. 
# It implies that the mean cannot be used as a statistic of centrality 
# (indicator for more common value of variable).

# Plot Attr 1 - net profit / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr1)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 1 - net profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr1, main="Normal QQ plot of Attr 1 - net profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 2 - total liabilities / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr2)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 2 - total liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr2, main="Normal QQ plot of Attr 2 - total liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is more negatively skewed

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365 (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr5)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr5, main="Normal QQ plot of Attr 5 - [(cash + short-term securities + receivables - short-term liabilities) / (operating expenses - depreciation)] * 365", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution (positive)
# Data spread is balanced between negative and positive outlier

# Plot Attr 6 - retained earnings / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr6)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 6 - retained earnings / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr6, main="Normal QQ plot of Attr 6 - retained earnings / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution (positive)
# Data spread is balanced between negative and positive outlier

# Plot Attr 7 - EBIT / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr7)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 7 - EBIT / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr7, main="Normal QQ plot of Attr 7 - EBIT / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 10 - equity / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr10)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 10 - equity / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr10, main="Normal QQ plot of Attr 10 - equity / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 12 - gross profit / short-term liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr12)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 12 - gross profit / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr12, main="Normal QQ plot of Attr 12 - gross profit / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 14 - (gross profit + interest) / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr14)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 14 - (gross profit + interest) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr14, main="Normal QQ plot of Attr 14 - (gross profit + interest) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 15 - (total liabilities * 365) / (gross profit + depreciation) (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr15)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr15, main="Normal QQ plot of Attr 15 - (total liabilities * 365) / (gross profit + depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is negatively skewed

# Plot Attr 16 - (gross profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr16)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 16 - (gross profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr16, main="Normal QQ plot of Attr 16 - (gross profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 18 - gross profit / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr18)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 18 - gross profit / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr18, main="Normal QQ plot of Attr 18 - gross profit / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 19 - gross profit / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr19)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 19 - gross profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr19, main="Normal QQ plot of Attr 19 - gross profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 22 - profit on operating activities / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr22)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 22 - profit on operating activities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr22, main="Normal QQ plot of Attr 22 - profit on operating activities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 23 - net profit / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr23)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 23 - net profit / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr23, main="Normal QQ plot of Attr 23 - net profit / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 24 - gross profit (in 3 years) / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr24)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 24 - gross profit (in 3 years) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr24, main="Normal QQ plot of Attr 24 - gross profit (in 3 years) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 25 - (equity - share capital) / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr25)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 25 - (equity - share capital) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr25, main="Normal QQ plot of Attr 25 - (equity - share capital) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 26 - (net profit + depreciation) / total liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr26)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 26 - (net profit + depreciation) / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr26, main="Normal QQ plot of Attr 26 - (net profit + depreciation) / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Attr 29 follows what seems to be a distribution very near the normal distribution
# Values are mostly clustered nicely around the mean.

# Plot Attr 30 - (total liabilities - cash) / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr30)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 30 - (total liabilities - cash) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr30, main="Normal QQ plot of Attr 30 - (total liabilities - cash) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 31 - (gross profit + interest) / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr31)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 31 - (gross profit + interest) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr31, main="Normal QQ plot of Attr 31 - (gross profit + interest) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 35 - profit on sales / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr35)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 35 - profit on sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr35, main="Normal QQ plot of Attr 35 - profit on sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 38 - constant capital / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr38)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 38 - constant capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr38, main="Normal QQ plot of Attr 38 - constant capital / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 39 - profit on sales / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr39)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 39 - profit on sales / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr39, main="Normal QQ plot of Attr 39 - profit on sales / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365)) (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr41)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr41, main="Normal QQ plot of Attr 41 - total liabilities / ((profit on operating activities + depreciation) * (12/365))", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 42 - profit on operating activities / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr42)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 42 - profit on operating activities / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr42, main="Normal QQ plot of Attr 42 - profit on operating activities / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 45 - net profit / inventory (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr45)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 45 - net profit / inventory") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr45, main="Normal QQ plot of Attr 45 - net profit / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr48)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr48, main="Normal QQ plot of Attr 48 - EBITDA (profit on operating activities - depreciation) / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 49 - EBITDA (profit on operating activities - depreciation) / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr49)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr49, main="Normal QQ plot of Attr 49 - EBITDA (profit on operating activities - depreciation) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very negatively skewed

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-
# Data spread is very positively skewed

# Plot Attr 59 - long-term liabilities / equity (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr59)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 59 - long-term liabilities / equity") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr59, main="Normal QQ plot of Attr 59 - long-term liabilities / equity", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is positively skewed

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 62 - (short-term liabilities *365) / sales (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr62)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 62 - (short-term liabilities *365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr62, main="Normal QQ plot of Attr 62 - (short-term liabilities *365) / sales", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year5, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year5$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
# Most data points are around 0 +/-, the appearance of few outliers skewed the distribution
# Data spread is very positively skewed

vYear5NotBankrupt <- sum(gData_Year5$class==0)
vYear5NotBankrupt
# 5500
vYear5Bankrupt <- sum(gData_Year5$class==1)
vYear5Bankrupt
# 410

vPercentOfNotBankruptInYear5 <- (vYear5NotBankrupt/(vYear5Bankrupt+vYear5NotBankrupt)) * 100
vPercentOfNotBankruptInYear5
# 93.06261% Not Bankrupt Cases
vPercentOfBankruptInYear5 <- (vYear5Bankrupt/(vYear5Bankrupt+vYear5NotBankrupt)) * 100
vPercentOfBankruptInYear5
# 6.937394% Bankrupt Cases


#-------------------Questions to Ask and Answer
# 1) What is the spread/distribution/"common value" of variable/variation of the dataset?
#### Observations: Most variables are clustered close to -1 to 0/ 0 to -1
#### Extreme outliers however tend to skew the distribution of variables in most attributes
#### This pattern carried on for five year, implying it might be what tends to happen in this 
#### industry
# 2) Are there unexpected or abnormal variables in the dataset?
#### Observations: Extreme outliers are spotted in most attributes/features. NAs and missing
#### values are also present. Attr 37 in particular is highlighted as having high amounts
#### of NAs.
# 3) How to deal with Missing Data?
#### Recommand: Impute by Median since Mean cannot be used as a statistical centrality
#### Recommand: Test the result of removing NAs from Attr37 as this is the column that has a lot
# 4) How to deal with Outliers?
#### Recommand: Leave the outliers alone. Based on the outliers and data skew over five years,
#### I come to the conclusion that the outliers could represent:
#### a) The bankrupt cases which occupy 5% or less of the dataset
#### b) The wealthy clients (as everyone knows, wealth isn't distributed equally in the world)
#-------------------

# Test Design - Build A
# Based on analysis of distribution spread across all columns of all five years, 
# all columns whose distribution patterns were altered will be removed to preserve
# integrity of the machine learning model
# Data Mining Task 1 (Use Year 1-5 datasets)
# 1A - Remove all columns of differing patterns over the years
#      Attr1, Attr2, Attr5, Attr6, Attr7, Attr10, Attr12, Attr14, Attr15, Attr16, Attr18
#      Attr19, Attr22, Attr23, Attr24, Attr25, Attr26, Attr30, Attr31, Attr35, Attr38, 
#      Attr39, Attr41, Attr42, Attr45, Attr48, Attr49, Attr59, Attr62
# 1B - Remove attribute 37, impute missing values in attribute 29 base on mean 
#      and then impute missing values in remaining attributes base on median
# 1C - Scale all columns 0 to 1
# 1D - Do a quick check to make sure distribution patterns didn't change
# Data Mining Task 2 (Use Year 1 dataset - that is cleaned)
# 2A - Build Logistic Regression Model
# 2B - Build Neural Network Model
# 2C - Build Support Vector Model
# 2D - Compare and Evaluate
# Data Mining Task 3 (Use Year 2-5 datasets - that are cleaned)
# 3A - Test Logistic Regression Model on Year 2-5 datasets
# 3B - Test Neural Network Model on Year 2-5 datasets
# 3C - Test Support Vector Model on Year 2-5 datasets
# 3D - Compare and Evaluate
# Test Design Build A - Conclusion of Best Model, Findings and Recommendations

#-------------------Data Mining Task 1A
#---------------Remove all columns of differing patterns over the years
#      Attr1, Attr2, Attr5, Attr6, Attr7, Attr10, Attr12, Attr14, Attr15, Attr16, Attr18
#      Attr19, Attr22, Attr23, Attr24, Attr25, Attr26, Attr30, Attr31, Attr35, Attr38, 
#      Attr39, Attr41, Attr42, Attr45, Attr48, Attr49, Attr59, Attr62

gData_Year1_Cleaned <- gData_Year1[ , -which(names(gData_Year1) %in% c("Attr1", "Attr2", "Attr5", "Attr6", "Attr7", "Attr10", "Attr12", "Attr14", "Attr15", "Attr16", "Attr18", "Attr19", "Attr22", "Attr23", "Attr24", "Attr25", "Attr26", "Attr30", "Attr31", "Attr35", "Attr38", "Attr39", "Attr41", "Attr42", "Attr45", "Attr48", "Attr49", "Attr59", "Attr62"))]
#gData_Year1_Cleaned
gData_Year2_Cleaned <- gData_Year2[ , -which(names(gData_Year2) %in% c("Attr1", "Attr2", "Attr5", "Attr6", "Attr7", "Attr10", "Attr12", "Attr14", "Attr15", "Attr16", "Attr18", "Attr19", "Attr22", "Attr23", "Attr24", "Attr25", "Attr26", "Attr30", "Attr31", "Attr35", "Attr38", "Attr39", "Attr41", "Attr42", "Attr45", "Attr48", "Attr49", "Attr59", "Attr62"))]
#gData_Year2_Cleaned
gData_Year3_Cleaned <- gData_Year3[ , -which(names(gData_Year3) %in% c("Attr1", "Attr2", "Attr5", "Attr6", "Attr7", "Attr10", "Attr12", "Attr14", "Attr15", "Attr16", "Attr18", "Attr19", "Attr22", "Attr23", "Attr24", "Attr25", "Attr26", "Attr30", "Attr31", "Attr35", "Attr38", "Attr39", "Attr41", "Attr42", "Attr45", "Attr48", "Attr49", "Attr59", "Attr62"))]
#gData_Year3_Cleaned
gData_Year4_Cleaned <- gData_Year4[ , -which(names(gData_Year4) %in% c("Attr1", "Attr2", "Attr5", "Attr6", "Attr7", "Attr10", "Attr12", "Attr14", "Attr15", "Attr16", "Attr18", "Attr19", "Attr22", "Attr23", "Attr24", "Attr25", "Attr26", "Attr30", "Attr31", "Attr35", "Attr38", "Attr39", "Attr41", "Attr42", "Attr45", "Attr48", "Attr49", "Attr59", "Attr62"))]
#gData_Year4_Cleaned
gData_Year5_Cleaned <- gData_Year5[ , -which(names(gData_Year5) %in% c("Attr1", "Attr2", "Attr5", "Attr6", "Attr7", "Attr10", "Attr12", "Attr14", "Attr15", "Attr16", "Attr18", "Attr19", "Attr22", "Attr23", "Attr24", "Attr25", "Attr26", "Attr30", "Attr31", "Attr35", "Attr38", "Attr39", "Attr41", "Attr42", "Attr45", "Attr48", "Attr49", "Attr59", "Attr62"))]
#gData_Year5_Cleaned

#-------------------Data Mining Task 1B (OLD)
#---------------Remove all missing values
#gData_Year1_Cleaned_NoNA <- na.omit(gData_Year1_Cleaned)
#gData_Year1_Cleaned_NoNA
#summary(gData_Year1_Cleaned_NoNA)
#gData_Year2_Cleaned_NoNA <- na.omit(gData_Year2_Cleaned)
#gData_Year2_Cleaned_NoNA
#summary(gData_Year2_Cleaned_NoNA)
#gData_Year3_Cleaned_NoNA <- na.omit(gData_Year3_Cleaned)
#gData_Year3_Cleaned_NoNA
#summary(gData_Year3_Cleaned_NoNA)
#gData_Year4_Cleaned_NoNA <- na.omit(gData_Year4_Cleaned)
#gData_Year4_Cleaned_NoNA
#summary(gData_Year4_Cleaned_NoNA)
#gData_Year5_Cleaned_NoNA <- na.omit(gData_Year5_Cleaned)
#gData_Year5_Cleaned_NoNA
#summary(gData_Year5_Cleaned_NoNA)

#-------------------Data Mining Task 1B (New)
#---------------Remove attribute 37, impute missing values in attribute 29 base on mean 
#---------------and then impute missing values in remaining attributes base on median

#----- Remove Attr37
vTemp_ColumnDrop <- c("Attr37")

gData_Year1_Cleaned_Temp1 <- gData_Year1_Cleaned[ , !(names(gData_Year1_Cleaned) %in% vTemp_ColumnDrop)]
#gData_Year1_Cleaned_Temp1
#summary(gData_Year1_Cleaned_Temp1)
gData_Year2_Cleaned_Temp1 <- gData_Year2_Cleaned[ , !(names(gData_Year2_Cleaned) %in% vTemp_ColumnDrop)]
#gData_Year2_Cleaned_Temp1
#summary(gData_Year2_Cleaned_Temp1)
gData_Year3_Cleaned_Temp1 <- gData_Year3_Cleaned[ , !(names(gData_Year3_Cleaned) %in% vTemp_ColumnDrop)]
#gData_Year3_Cleaned_Temp1
#summary(gData_Year3_Cleaned_Temp1)
gData_Year4_Cleaned_Temp1 <- gData_Year4_Cleaned[ , !(names(gData_Year4_Cleaned) %in% vTemp_ColumnDrop)]
#gData_Year4_Cleaned_Temp1
#summary(gData_Year4_Cleaned_Temp1)
gData_Year5_Cleaned_Temp1 <- gData_Year5_Cleaned[ , !(names(gData_Year5_Cleaned) %in% vTemp_ColumnDrop)]
#gData_Year5_Cleaned_Temp1
#summary(gData_Year5_Cleaned_Temp1)

#------ Imputate mean in Attr29's NAs
# Year 1 Attr 29 has 3 NA's
gData_Year1_Cleaned_Temp1[is.na(gData_Year1_Cleaned_Temp1[,"Attr29"]), "Attr29"] <- mean(gData_Year1_Cleaned_Temp1[,"Attr29"], na.rm = TRUE)
#summary(gData_Year1_Cleaned_Temp1)

# Year 2 Attr 29 has 1 NA's
gData_Year2_Cleaned_Temp1[is.na(gData_Year2_Cleaned_Temp1[,"Attr29"]), "Attr29"] <- mean(gData_Year2_Cleaned_Temp1[,"Attr29"], na.rm = TRUE)
#summary(gData_Year2_Cleaned_Temp1)

# Year 3 Attr 29 has 0 NA's
#gData_Year3_Cleaned_Temp1[is.na(gData_Year3_Cleaned_Temp1[,"Attr29"]), "Attr29"] <- mean(gData_Year3_Cleaned_Temp1[,"Attr29"], na.rm = TRUE)
#summary(gData_Year3_Cleaned_Temp1)

# Year 4 Attr 29 has 1 NA's
gData_Year4_Cleaned_Temp1[is.na(gData_Year4_Cleaned_Temp1[,"Attr29"]), "Attr29"] <- mean(gData_Year4_Cleaned_Temp1[,"Attr29"], na.rm = TRUE)
#summary(gData_Year4_Cleaned_Temp1)

# Year 5 Attr 29 has 3 NA's
gData_Year5_Cleaned_Temp1[is.na(gData_Year5_Cleaned_Temp1[,"Attr29"]), "Attr29"] <- mean(gData_Year5_Cleaned_Temp1[,"Attr29"], na.rm = TRUE)
#summary(gData_Year5_Cleaned_Temp1)

#write.csv(gData_Year1_Cleaned_Temp1, file = "gData_Year1_Cleaned_Temp1.csv")

#------ Imputate rest of attributes with median
# Code Reference from: https://stackoverflow.com/questions/34865789/replacing-nas-in-each-column-of-matrix-with-the-median-of-that-column
# Answerer: David Arenburg
# Note: Need to convert dataframe to matrix and then matrix to dataframe else doesn't work

# Year 1
# Create an index of NAs
vNAsIndex_Temp <- which(is.na(gData_Year1_Cleaned_Temp1), arr.ind = TRUE)
# Convert dataset to matrix
gData_Year1_Cleaned_Matrix <- data.matrix(gData_Year1_Cleaned_Temp1)
# Replace the NAs using the precalculated column medians and according to the index
gData_Year1_Cleaned_Matrix[vNAsIndex_Temp] <- matrixStats::colMedians(gData_Year1_Cleaned_Matrix, na.rm = TRUE)[vNAsIndex_Temp[, 2]]
# Convert matrix to dataframe
gData_Year1_Cleaned_NAS <- data.frame(gData_Year1_Cleaned_Matrix)
#summary(gData_Year1_Cleaned_NAS)

# Year 2
# Create an index of NAs
vNAsIndex_Temp <- which(is.na(gData_Year2_Cleaned_Temp1), arr.ind = TRUE)
# Convert dataset to matrix
gData_Year2_Cleaned_Matrix <- data.matrix(gData_Year2_Cleaned_Temp1)
# Replace the NAs using the precalculated column medians and according to the index
gData_Year2_Cleaned_Matrix[vNAsIndex_Temp] <- matrixStats::colMedians(gData_Year2_Cleaned_Matrix, na.rm = TRUE)[vNAsIndex_Temp[, 2]]
# Convert matrix to dataframe
gData_Year2_Cleaned_NAS <- data.frame(gData_Year2_Cleaned_Matrix)
#summary(gData_Year2_Cleaned_NAS)

# Year 3
# Create an index of NAs
vNAsIndex_Temp <- which(is.na(gData_Year3_Cleaned_Temp1), arr.ind = TRUE)
# Convert dataset to matrix
gData_Year3_Cleaned_Matrix <- data.matrix(gData_Year3_Cleaned_Temp1)
# Replace the NAs using the precalculated column medians and according to the index
gData_Year3_Cleaned_Matrix[vNAsIndex_Temp] <- matrixStats::colMedians(gData_Year3_Cleaned_Matrix, na.rm = TRUE)[vNAsIndex_Temp[, 2]]
# Convert matrix to dataframe
gData_Year3_Cleaned_NAS <- data.frame(gData_Year3_Cleaned_Matrix)
#summary(gData_Year3_Cleaned_NAS)

# Year 4
# Create an index of NAs
vNAsIndex_Temp <- which(is.na(gData_Year4_Cleaned_Temp1), arr.ind = TRUE)
# Convert dataset to matrix
gData_Year4_Cleaned_Matrix <- data.matrix(gData_Year4_Cleaned_Temp1)
# Replace the NAs using the precalculated column medians and according to the index
gData_Year4_Cleaned_Matrix[vNAsIndex_Temp] <- matrixStats::colMedians(gData_Year4_Cleaned_Matrix, na.rm = TRUE)[vNAsIndex_Temp[, 2]]
# Convert matrix to dataframe
gData_Year4_Cleaned_NAS <- data.frame(gData_Year4_Cleaned_Matrix)
#summary(gData_Year4_Cleaned_NAS)

# Year 5
# Create an index of NAs
vNAsIndex_Temp <- which(is.na(gData_Year5_Cleaned_Temp1), arr.ind = TRUE)
# Convert dataset to matrix
gData_Year5_Cleaned_Matrix <- data.matrix(gData_Year5_Cleaned_Temp1)
# Replace the NAs using the precalculated column medians and according to the index
gData_Year5_Cleaned_Matrix[vNAsIndex_Temp] <- matrixStats::colMedians(gData_Year5_Cleaned_Matrix, na.rm = TRUE)[vNAsIndex_Temp[, 2]]
# Convert matrix to dataframe
gData_Year5_Cleaned_NAS <- data.frame(gData_Year5_Cleaned_Matrix)
#summary(gData_Year5_Cleaned_NAS)

#-------------------Data Mining Task 1C
#---------------Normalise all columns (SCALE 0 to 1)
gData_Year1_Cleaned_NoNA_SCALE <- apply(gData_Year1_Cleaned_NAS, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X)))
#gData_Year1_Cleaned_NoNA_SCALE
#summary(gData_Year1_Cleaned_NoNA_SCALE)
gData_Year2_Cleaned_NoNA_SCALE <- apply(gData_Year2_Cleaned_NAS, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X)))
#gData_Year2_Cleaned_NoNA_SCALE
#summary(gData_Year2_Cleaned_NoNA_SCALE)
gData_Year3_Cleaned_NoNA_SCALE <- apply(gData_Year3_Cleaned_NAS, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X)))
#gData_Year3_Cleaned_NoNA_SCALE
#summary(gData_Year3_Cleaned_NoNA_SCALE)
gData_Year4_Cleaned_NoNA_SCALE <- apply(gData_Year4_Cleaned_NAS, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X)))
#gData_Year4_Cleaned_NoNA_SCALE
#summary(gData_Year4_Cleaned_NoNA_SCALE)
gData_Year5_Cleaned_NoNA_SCALE <- apply(gData_Year5_Cleaned_NAS, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X)))
#gData_Year5_Cleaned_NoNA_SCALE
#summary(gData_Year5_Cleaned_NoNA_SCALE)

# Save as CSV
#write.csv(gData_Year1_Cleaned_NoNA_SCALE, file = "../0_Datasets/gData_Year1_Cleaned_NoNA_SCALE.csv")
#write.csv(gData_Year2_Cleaned_NoNA_SCALE, file = "../0_Datasets/gData_Year2_Cleaned_NoNA_SCALE.csv")
#write.csv(gData_Year3_Cleaned_NoNA_SCALE, file = "../0_Datasets/gData_Year3_Cleaned_NoNA_SCALE.csv")
#write.csv(gData_Year4_Cleaned_NoNA_SCALE, file = "../0_Datasets/gData_Year4_Cleaned_NoNA_SCALE.csv")
#write.csv(gData_Year5_Cleaned_NoNA_SCALE, file = "../0_Datasets/gData_Year5_Cleaned_NoNA_SCALE.csv")

#-------------------Data Mining Task 1D
#---------------Do a quick check to make sure distribution patterns didn't change
# "Attr3","Attr4","Attr8","Attr9","Attr11","Attr13","Attr17","Attr20","Attr21","Attr27",
# "Attr28","Attr29","Attr32","Attr33","Attr34","Attr36","Attr37","Attr40","Attr43","Attr44",
# "Attr46","Attr47","Attr50","Attr51","Attr52","Attr53","Attr54","Attr55","Attr56","Attr57",
# "Attr58","Attr60","Attr61","Attr63","Attr64"

# Put Class Matrix into Dataframe FOR YEAR 1
gData_Year1_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year1_Cleaned_NoNA_SCALE)

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
#

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
#

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
#

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
#

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
#

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
#

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
#

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
#

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
#

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
#

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
#

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
#

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
#

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
#

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
#

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
#

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
#

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
#

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
#

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
#

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
#

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
#

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
#

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
#

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
#

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
#

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
#

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
#

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
#

vYear1NotBankrupt <- sum(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$class==0)
vYear1NotBankrupt
# 6756
vYear1Bankrupt <- sum(gData_Year1_Cleaned_NoNA_SCALE_FRAMED$class==1)
vYear1Bankrupt
# 271

vPercentOfNotBankruptInYear1 <- (vYear1NotBankrupt/(vYear1Bankrupt+vYear1NotBankrupt)) * 100
vPercentOfNotBankruptInYear1
# 96.14345 Not Bankrupt Cases
vPercentOfBankruptInYear1 <- (vYear1Bankrupt/(vYear1Bankrupt+vYear1NotBankrupt)) * 100
vPercentOfBankruptInYear1
# 3.856553 Bankrupt Cases

# Put Class Matrix into Dataframe FOR YEAR 2
gData_Year2_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year2_Cleaned_NoNA_SCALE)

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
#

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
#

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
#

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
#

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
#

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
#

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
#

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
#

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
#

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
#

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
#

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
#

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
#

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
#

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
#

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
#

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
#

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
#

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
#

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
#

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
#

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# ???

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
#

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
#

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
#

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# Still positive skew pattern

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# Still positive skew pattern

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
#

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
#

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
#

vYear2NotBankrupt <- sum(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$class==0)
vYear2NotBankrupt
# 9773
vYear2Bankrupt <- sum(gData_Year2_Cleaned_NoNA_SCALE_FRAMED$class==1)
vYear2Bankrupt
# 400

vPercentOfNotBankruptInYear2 <- (vYear2NotBankrupt/(vYear2Bankrupt+vYear2NotBankrupt)) * 100
vPercentOfNotBankruptInYear2
# 96.06802 Not Bankrupt Cases
vPercentOfBankruptInYear2 <- (vYear2Bankrupt/(vYear2Bankrupt+vYear2NotBankrupt)) * 100
vPercentOfBankruptInYear2
# 3.931977 Bankrupt Cases

# Put Class Matrix into Dataframe FOR YEAR 3
gData_Year3_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year3_Cleaned_NoNA_SCALE)

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
# 

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
# 

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
# 

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
# 

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
# 

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
# 

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
# 

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
# 

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
# 

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# 

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
# 

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
# 

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# 

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# 

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
# 

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
# 

vYear3NotBankrupt <- sum(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$class==0)
vYear3NotBankrupt
# 10008
vYear3Bankrupt <- sum(gData_Year3_Cleaned_NoNA_SCALE_FRAMED$class==1)
vYear3Bankrupt
# 495

vPercentOfNotBankruptInYear3 <- (vYear3NotBankrupt/(vYear3Bankrupt+vYear3NotBankrupt)) * 100
vPercentOfNotBankruptInYear3
# 95.28706 Not Bankrupt Cases
vPercentOfBankruptInYear3 <- (vYear3Bankrupt/(vYear3Bankrupt+vYear3NotBankrupt)) * 100
vPercentOfBankruptInYear3
# 4.712939 Bankrupt Cases

# Put Class Matrix into Dataframe FOR YEAR 4
gData_Year4_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year4_Cleaned_NoNA_SCALE)

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
# 

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
# 

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
# 

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
# 

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
# 

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
# 

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
# 

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
# 

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
# 

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# 

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
# 

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
# 

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# 

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# 

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
# 

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
# 

vYear4NotBankrupt <- sum(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$class==0)
vYear4NotBankrupt
# 9277
vYear4Bankrupt <- sum(gData_Year4_Cleaned_NoNA_SCALE_FRAMED$class==1)
vYear4Bankrupt
# 515

vPercentOfNotBankruptInYear4 <- (vYear4NotBankrupt/(vYear4Bankrupt+vYear4NotBankrupt)) * 100
vPercentOfNotBankruptInYear4
# 94.7406 Not Bankrupt Cases
vPercentOfBankruptInYear4 <- (vYear4Bankrupt/(vYear4Bankrupt+vYear4NotBankrupt)) * 100
vPercentOfBankruptInYear4
# 5.259395 Bankrupt Cases

# Put Class Matrix into Dataframe FOR YEAR 5
gData_Year5_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year5_Cleaned_NoNA_SCALE)

# Plot Attr 3 - working capital / total assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr3)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 3 - working capital / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr3, main="Normal QQ plot of Attr 3 - working capital / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 4 - current assets / short-term liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr4)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 4 - current assets / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr4, main="Normal QQ plot of Attr 4 - current assets / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 8 - book value of equity / total liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr8)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 8 - book value of equity / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr8, main="Normal QQ plot of Attr 8 - book value of equity / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 9 - sales / total assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr9)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 9 - sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr9, main="Normal QQ plot of Attr 9 - sales / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr11)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr11, main="Normal QQ plot of Attr 11 - (gross profit + extraordinary items + financial expenses) / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 13 - (gross profit + depreciation) / sales (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr13)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 13 - (gross profit + depreciation) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr13, main="Normal QQ plot of Attr 13 - (gross profit + depreciation) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 17 - total assets / total liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr17)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 17 - total assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr17, main="Normal QQ plot of Attr 17 - total assets / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 20 - (inventory * 365) / sales (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr20)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 20 - (inventory * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr20, main="Normal QQ plot of Attr 20 - (inventory * 365) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 21 - sales (n) / sales (n-1) (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr21)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 21 - sales (n) / sales (n-1)") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr21, main="Normal QQ plot of Attr 21 - sales (n) / sales (n-1)", ylab="")
# Observation Summary
# 

# Plot Attr 27 - profit on operating activities / financial expenses (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr27)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 27 - profit on operating activities / financial expenses") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr27, main="Normal QQ plot of Attr 27 - profit on operating activities / financial expenses", ylab="")
# Observation Summary
# 

# Plot Attr 28 - working capital / fixed assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr28)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 28 - working capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr28, main="Normal QQ plot of Attr 28 - working capital / fixed assets", ylab="")
# Observation Summary
# 

# Plot Attr 29 - logarithm of total assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr29)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 29 - logarithm of total assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr29, main="Normal QQ plot of Attr 29 - logarithm of total assets", ylab="")
# Observation Summary
# 

# Plot Attr 32 - (current liabilities * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr32)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 32 - (current liabilities * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr32, main="Normal QQ plot of Attr 32 - (current liabilities * 365) / cost of products sold", ylab="")
# Observation Summary
# 

# Plot Attr 33 - operating expenses / short-term liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr33)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 33 - operating expenses / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr33, main="Normal QQ plot of Attr 33 - operating expenses / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 34 - operating expenses / total liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr34)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 34 - operating expenses / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr34, main="Normal QQ plot of Attr 34 - operating expenses / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 36 - total sales / total assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr36)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 36 - total sales / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr36, main="Normal QQ plot of Attr 36 - total sales / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 37 - (current assets - inventories) / long-term liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr37)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 37 - (current assets - inventories) / long-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr37, main="Normal QQ plot of Attr 37 - (current assets - inventories) / long-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 40 - (current assets - inventory - receivables) / short-term liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr40)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 40 - (current assets - inventory - receivables) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr40, main="Normal QQ plot of Attr 40 - (current assets - inventory - receivables) / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 43 - rotation receivables + inventory turnover in days (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr43)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 43 - rotation receivables + inventory turnover in days") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr43, main="Normal QQ plot of Attr 43 - rotation receivables + inventory turnover in days", ylab="")
# Observation Summary
# 

# Plot Attr 44 - (receivables * 365) / sales (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr44)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 44 - (receivables * 365) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr44, main="Normal QQ plot of Attr 44 - (receivables * 365) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 46 - (current assets - inventory) / short-term liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr46)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 46 - (current assets - inventory) / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr46, main="Normal QQ plot of Attr 46 - (current assets - inventory) / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 47 - (inventory * 365) / cost of products sold (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr47)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 47 - (inventory * 365) / cost of products sold") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr47, main="Normal QQ plot of Attr 47 - (inventory * 365) / cost of products sold", ylab="")
# Observation Summary
# 

# Plot Attr 50 - current assets / total liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr50)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 50 - current assets / total liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr50, main="Normal QQ plot of Attr 50 - current assets / total liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 51 - short-term liabilities / total assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr51)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 51 - short-term liabilities / total assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr51, main="Normal QQ plot of Attr 51 - short-term liabilities / total assets", ylab="")
# Observation Summary
# 

# Plot Attr 52 - (short-term liabilities * 365) / cost of products sold) (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr52)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 52 - (short-term liabilities * 365) / cost of products sold)") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr52, main="Normal QQ plot of Attr 52 - (short-term liabilities * 365) / cost of products sold)", ylab="")
# Observation Summary
# 

# Plot Attr 53 - equity / fixed assets  (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr53)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 53 - equity / fixed assets ") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr53, main="Normal QQ plot of Attr 53 - equity / fixed assets ", ylab="")
# Observation Summary
# 

# Plot Attr 54 - constant capital / fixed assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr54)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 54 - constant capital / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr54, main="Normal QQ plot of Attr 54 - constant capital / fixed assets", ylab="")
# Observation Summary
# 

# Plot Attr 55 - working capital (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr55)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 55 - working capital") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr55, main="Normal QQ plot of Attr 55 - working capital", ylab="")
# Observation Summary
# 

# Plot Attr 56 - (sales - cost of products sold) / sales (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr56)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 56 - (sales - cost of products sold) / sales") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr56, main="Normal QQ plot of Attr 56 - (sales - cost of products sold) / sales", ylab="")
# Observation Summary
# 

# Plot Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation) (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr57)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr57, main="Normal QQ plot of Attr 57 - (current assets - inventory - short-term liabilities) / (sales - gross profit - depreciation)", ylab="")
# Observation Summary
# 

# Plot Attr 58 - total costs /total sales (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr58)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 58 - total costs /total sales") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr58, main="Normal QQ plot of Attr 58 - total costs /total sales", ylab="")
# Observation Summary
# 

# Plot Attr 60 - sales / inventory (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr60)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 60 - sales / inventory") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr60, main="Normal QQ plot of Attr 60 - sales / inventory", ylab="")
# Observation Summary
# 

# Plot Attr 61 - sales / receivables (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr61)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 61 - sales / receivables") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr61, main="Normal QQ plot of Attr 61 - sales / receivables", ylab="")
# Observation Summary
# 

# Plot Attr 63 - sales / short-term liabilities (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr63)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 63 - sales / short-term liabilities") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr63, main="Normal QQ plot of Attr 63 - sales / short-term liabilities", ylab="")
# Observation Summary
# 

# Plot Attr 64 - sales / fixed assets (look at distribution spread)
ggplot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED, aes(x=Attr64)) + geom_histogram(aes(y=..density..)) + geom_density(color="red") + geom_rug() + ggtitle("The Histogram of Attr 64 - sales / fixed assets") + xlab("") + ylab("")
qqPlot(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$Attr64, main="Normal QQ plot of Attr 64 - sales / fixed assets", ylab="")
# Observation Summary
# 

vYear5NotBankrupt <- sum(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$class==0)
vYear5NotBankrupt
# 5500
vYear5Bankrupt <- sum(gData_Year5_Cleaned_NoNA_SCALE_FRAMED$class==1)
vYear5Bankrupt
# 410

vPercentOfNotBankruptInYear5 <- (vYear5NotBankrupt/(vYear5Bankrupt+vYear5NotBankrupt)) * 100
vPercentOfNotBankruptInYear5
# 93.06261 Not Bankrupt Cases
vPercentOfBankruptInYear5 <- (vYear5Bankrupt/(vYear5Bankrupt+vYear5NotBankrupt)) * 100
vPercentOfBankruptInYear5
# 6.937394 Bankrupt Cases

#-------------------Dealing with Rare Event Prediction
#---------------Apply Under and Over Sample in hopes of getting a Balanced dataset
# Put Class Matrix into Dataframe
gData_Year1_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year1_Cleaned_NoNA_SCALE)
gData_Year2_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year2_Cleaned_NoNA_SCALE)
gData_Year3_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year3_Cleaned_NoNA_SCALE)
gData_Year4_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year4_Cleaned_NoNA_SCALE)
gData_Year5_Cleaned_NoNA_SCALE_FRAMED<-data.frame(gData_Year5_Cleaned_NoNA_SCALE)

# Create balanced Year 1 data
vData_balanced <- ovun.sample(class ~ ., data = gData_Year1_Cleaned_NoNA_SCALE_FRAMED, method="both", N = 271, p=0.5, seed = 1)$data
summary(vData_balanced)
#write.csv(vData_balanced, file = "../0_DataSets/vData_balanced.csv")

vData_balanced_NOSCALE <- ovun.sample(class ~ ., data = gData_Year1_Cleaned_NAS, method="both", N = 271, p=0.5, seed = 1)$data
summary(vData_balanced_NOSCALE)

#-------------------Data Mining Task 2A + 3A
#---------------Build Logistic Regression Model
# Train on Year 1 data
# Predict Year 2, Year 3, Year 4, Year 5
#---------------Based on outputs > Logistic Regression is not a good model for this dataset

#--------------- Build Model
set.seed(2018)

gLogRedYear1Model <- glm(class ~.,family=binomial(link='logit'),data=vData_balanced_NOSCALE)
summary(gLogRedYear1Model)
anova(gLogRedYear1Model, test="Chisq")

#--------------- Year 1
vLogPred_Year1 <- predict(gLogRedYear1Model, vData_balanced_NOSCALE, type='response')
vLogPred_Year1 <- ifelse(vLogPred_Year1 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year1 != vData_balanced_NOSCALE$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.800738007380074"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vLogPred_Year1_ConfusedMatrix <- table(vLogPred_Year1, vData_balanced_NOSCALE$class)
vLogPred_Year1_ConfusedMatrix
#  vLogPred_Year1    0   1
#                 0 111  27
#                 1  27 106

recall(vLogPred_Year1_ConfusedMatrix)
# Recall: 0.8043478
precision(vLogPred_Year1_ConfusedMatrix)
# Precision: 0.8043478
specificity(vLogPred_Year1_ConfusedMatrix)
# Specificity: 0.7969925 
F_meas(vLogPred_Year1_ConfusedMatrix)
# F_measure: 0.8043478

vYear1AreaUnderCurve <- roc(class ~vLogPred_Year1, data = vData_balanced_NOSCALE)
plot(vYear1AreaUnderCurve)
vYear1AreaUnderCurve
# Area under the curve: 0.8007

#--------------- Year 2
vLogPred_Year2 <- predict(gLogRedYear1Model, gData_Year2_Cleaned_NAS, type='response')
vLogPred_Year2 <- ifelse(vLogPred_Year2 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year2 != gData_Year2_Cleaned_NAS$class)
print(paste('Accuracy',1-vMisClasificError))
# [1] "Accuracy 0.621350634031259"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vLogPred_Year2_ConfusedMatrix <- table(vLogPred_Year2, gData_Year2_Cleaned_NAS$class)
vLogPred_Year2_ConfusedMatrix
#  vLogPred_Year2    0    1
#               0 6051  130
#               1 3722  270

recall(vLogPred_Year2_ConfusedMatrix)
# Recall: 0.6191548
precision(vLogPred_Year2_ConfusedMatrix)
# Precision: 0.9789678
specificity(vLogPred_Year2_ConfusedMatrix)
# Specificity: 0.675
F_meas(vLogPred_Year2_ConfusedMatrix)
# F_measure: 0.7585558

vYear2AreaUnderCurve <- roc(class ~vLogPred_Year2, data = gData_Year2_Cleaned_NAS)
plot(vYear2AreaUnderCurve)
vYear2AreaUnderCurve
# Area under the curve: 0.6471

#--------------- Year 3
vLogPred_Year3 <- predict(gLogRedYear1Model, gData_Year3_Cleaned_NAS, type='response')
vLogPred_Year3 <- ifelse(vLogPred_Year3 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year3 != gData_Year3_Cleaned_NAS$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.606112539274493"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vLogPred_Year3_ConfusedMatrix <- table(vLogPred_Year3, gData_Year3_Cleaned_NAS$class)
vLogPred_Year3_ConfusedMatrix
# vLogPred_Year3     0     1
#                 0 6007  136
#                 1 4001  359

recall(vLogPred_Year3_ConfusedMatrix)
# 0.6002198
precision(vLogPred_Year3_ConfusedMatrix)
# 0.977861
specificity(vLogPred_Year3_ConfusedMatrix)
# 0.7252525
F_meas(vLogPred_Year3_ConfusedMatrix)
# 0.7438549

vYear3AreaUnderCurve <- roc(class ~vLogPred_Year3, data = gData_Year3_Cleaned_NAS)
plot(vYear3AreaUnderCurve)
vYear3AreaUnderCurve
# Area under the curve: 0.6627

#--------------- Year 4
vLogPred_Year4 <- predict(gLogRedYear1Model, gData_Year4_Cleaned_NAS, type='response')
vLogPred_Year4 <- ifelse(vLogPred_Year4 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year4 != gData_Year4_Cleaned_NAS$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.614174836601307"

vLogPred_Year4_ConfusedMatrix <- table(vLogPred_Year4, gData_Year4_Cleaned_NAS$class)
vLogPred_Year4_ConfusedMatrix
#  vLogPred_Year4    0    1
#                0 5638  139
#                1 3639  376

recall(vLogPred_Year4_ConfusedMatrix)       
# Recall:0.6077396
precision(vLogPred_Year4_ConfusedMatrix)    
# Precision:0.9759391
specificity(vLogPred_Year4_ConfusedMatrix)  
# Specificity:0.7300971
F_meas(vLogPred_Year4_ConfusedMatrix)       
# F_measure:0.7490368

vYear4AreaUnderCurve <- roc(class ~vLogPred_Year4, data = gData_Year4_Cleaned_NAS)
plot(vYear4AreaUnderCurve)
vYear4AreaUnderCurve
# Area under the curve: 0.6689

#--------------- Year 5
vLogPred_Year5 <- predict(gLogRedYear1Model, gData_Year5_Cleaned_NAS, type='response')
vLogPred_Year5 <- ifelse(vLogPred_Year5 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year5 != gData_Year5_Cleaned_NAS$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.674788494077834"

vLogPred_Year5_ConfusedMatrix <- table(vLogPred_Year5, gData_Year5_Cleaned_NAS$class)
vLogPred_Year5_ConfusedMatrix
# vLogPred_Year5    0    1
#               0 3665   87
#               1 1835  323

recall(vLogPred_Year5_ConfusedMatrix)
# Recall: 0.6663636
precision(vLogPred_Year5_ConfusedMatrix) 
# Precision: 0.9768124
specificity(vLogPred_Year5_ConfusedMatrix)
# Specificity: 0.7878049
F_meas(vLogPred_Year5_ConfusedMatrix) 
# F_measure: 0.7922611

vYear5AreaUnderCurve <- roc(class ~vLogPred_Year5, data = gData_Year5_Cleaned_NAS)
plot(vYear5AreaUnderCurve)
vYear5AreaUnderCurve
# Area under the curve: 0.7271

#-------------------Data Mining Task 2B +3B
#---------------Build Random Forest

#--------------- Build Model
set.seed(2018)
gRandomForestYear1Model <- randomForest(class~.,  data = vData_balanced_NOSCALE, ntree=10) # try with different num of ntree
gRandomForestYear1Model

#--------------- Year 1
vRandomForestPred_Year1 <- predict(gRandomForestYear1Model, vData_balanced_NOSCALE, type='response')
vRandomForestPred_Year1 <- ifelse(vRandomForestPred_Year1 > 0.5,1,0)

vMisClasificError <- mean(vRandomForestPred_Year1 != vData_balanced_NOSCALE$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.981549815498155"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year1_ConfusedMatrix <- table(vRandomForestPred_Year1, vData_balanced_NOSCALE$class)
vRandomForestPred_Year1_ConfusedMatrix
# vRandomForestPred_Year1   0   1
#                        0 136   3
#                        1   2 130

recall(vRandomForestPred_Year1_ConfusedMatrix)
# Recall: 0.9855072
precision(vRandomForestPred_Year1_ConfusedMatrix)
# Precision: 0.9784173
specificity(vRandomForestPred_Year1_ConfusedMatrix)
# Specificity: 0.9774436
F_meas(vRandomForestPred_Year1_ConfusedMatrix)
# F_measure: 0.9819495

vYear1AreaUnderCurve <- roc(class ~vRandomForestPred_Year1, data = vData_balanced_NOSCALE)
plot(vYear1AreaUnderCurve)
vYear1AreaUnderCurve
# Area under the curve: 0.9815

#--------------- Year 2
vRandomForestPred_Year2 <- predict(gRandomForestYear1Model, gData_Year2_Cleaned_NAS, type='response')
vRandomForestPred_Year2 <- ifelse(vRandomForestPred_Year2 > 0.5,1,0)

vMisClasificError <- mean(vRandomForestPred_Year2 != gData_Year2_Cleaned_NAS$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.625577509092696"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year2_ConfusedMatrix <- table(vRandomForestPred_Year2, gData_Year2_Cleaned_NAS$class)
vRandomForestPred_Year2_ConfusedMatrix
# vRandomForestPred_Year2    0    1
#                       0 6108  144
#                       1 3665  256

recall(vRandomForestPred_Year2_ConfusedMatrix)
# Recall:  0.6249872
precision(vRandomForestPred_Year2_ConfusedMatrix)
# Precision: 0.9769674
specificity(vRandomForestPred_Year2_ConfusedMatrix)
# Specificity: 0.64
F_meas(vRandomForestPred_Year2_ConfusedMatrix)
# F_measure: 0.7623089

vYear2AreaUnderCurve <- roc(class ~vRandomForestPred_Year2, data = gData_Year2_Cleaned_NAS)
plot(vYear2AreaUnderCurve)
vYear2AreaUnderCurve
# Area under the curve: 0.6325

#--------------- Year 3
vRandomForestPred_Year3 <- predict(gRandomForestYear1Model, gData_Year3_Cleaned_NAS, type='response')
vRandomForestPred_Year3 <- ifelse(vRandomForestPred_Year3 > 0.5,1,0)

vMisClasificError <- mean(vRandomForestPred_Year3 != gData_Year3_Cleaned_NAS$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.638674664381605"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year3_ConfusedMatrix <- table(vRandomForestPred_Year3, gData_Year3_Cleaned_NAS$class)
vRandomForestPred_Year3_ConfusedMatrix
# vRandomForestPred_Year3    0    1
#                        0 6389  176
#                        1 3619  319

recall(vRandomForestPred_Year3_ConfusedMatrix)
# Recall: 0.6383893
precision(vRandomForestPred_Year3_ConfusedMatrix)
# Precision: 0.9731912
specificity(vRandomForestPred_Year3_ConfusedMatrix)
# Specificity: 0.6444444
F_meas(vRandomForestPred_Year3_ConfusedMatrix)
# F_measure: 0.7710131

vYear3AreaUnderCurve <- roc(class ~vRandomForestPred_Year3, data = gData_Year3_Cleaned_NAS)
plot(vYear3AreaUnderCurve)
vYear3AreaUnderCurve
# Area under the curve: 0.6414

#--------------- Year 4
vRandomForestPred_Year4 <- predict(gRandomForestYear1Model, gData_Year4_Cleaned_NAS, type='response')
vRandomForestPred_Year4 <- ifelse(vRandomForestPred_Year4 > 0.5,1,0)

vMisClasificError <- mean(vRandomForestPred_Year4 != gData_Year4_Cleaned_NAS$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.650224673202614"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year4_ConfusedMatrix <- table(vRandomForestPred_Year4, gData_Year4_Cleaned_NAS$class)
vRandomForestPred_Year4_ConfusedMatrix
# vRandomForestPred_Year4    0    1
#                       0 6014  162
#                       1 3263  353

recall(vRandomForestPred_Year4_ConfusedMatrix)
# Recall: 0.6482699
precision(vRandomForestPred_Year4_ConfusedMatrix)
# Precision: 0.9737694
specificity(vRandomForestPred_Year4_ConfusedMatrix)
# Specificity: 0.6854369
F_meas(vRandomForestPred_Year4_ConfusedMatrix)
# F_measure: 0.7783602

vYear4AreaUnderCurve <- roc(class ~vRandomForestPred_Year4, data = gData_Year4_Cleaned_NAS)
plot(vYear4AreaUnderCurve)
vYear4AreaUnderCurve
# Area under the curve: 0.6669

#--------------- Year 5
vRandomForestPred_Year5 <- predict(gRandomForestYear1Model, gData_Year5_Cleaned_NAS, type='response')
vRandomForestPred_Year5 <- ifelse(vRandomForestPred_Year5 > 0.5,1,0)

vMisClasificError <- mean(vRandomForestPred_Year5 != gData_Year5_Cleaned_NAS$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.702707275803722"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year5_ConfusedMatrix <- table(vRandomForestPred_Year5, gData_Year5_Cleaned_NAS$class)
vRandomForestPred_Year5_ConfusedMatrix
# vRandomForestPred_Year5    0    1
#                        0 3830   87
#                        1 1670  323

recall(vRandomForestPred_Year5_ConfusedMatrix)
# Recall: 0.6963636
precision(vRandomForestPred_Year5_ConfusedMatrix)
# Precision: 0.9777891
specificity(vRandomForestPred_Year5_ConfusedMatrix)
# Specificity: 0.7878049
F_meas(vRandomForestPred_Year5_ConfusedMatrix)
# F_measure: 0.8134225

vYear5AreaUnderCurve <- roc(class ~vRandomForestPred_Year5, data = gData_Year5_Cleaned_NAS)
plot(vYear5AreaUnderCurve)
vYear5AreaUnderCurve
# Area under the curve: 0.7421

#-------------------Data Mining Task 2C + 3C
#---------------Build SVM
gSVMYear1Model <- svm(class ~.,vData_balanced, cost=10, kernel="polynomial")
summary(gSVMYear1Model)

#--------------- Year 1
vSVMPred_Year1 <- predict(gSVMYear1Model, vData_balanced, type='response')
vSVMPred_Year1 <- ifelse(vSVMPred_Year1 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year1 != vData_balanced$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.575645756457565"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year1_ConfusedMatrix <- table(vSVMPred_Year1, vData_balanced$class)
vSVMPred_Year1_ConfusedMatrix
# vSVMPred_Year1   0   1
#              0 138 115
#              1   0  18

recall(vSVMPred_Year1_ConfusedMatrix)
# Recall: 1
precision(vSVMPred_Year1_ConfusedMatrix)
# Precision: 0.5454545
specificity(vSVMPred_Year1_ConfusedMatrix)
# Specificity: 0.1353383
F_meas(vSVMPred_Year1_ConfusedMatrix)
# F_measure: 0.7058824

vYear1AreaUnderCurve <- roc(class ~vSVMPred_Year1, data = vData_balanced)
plot(vYear1AreaUnderCurve)
vYear1AreaUnderCurve
# Area under the curve: 0.5677

#--------------- Year 2
vSVMPred_Year2 <- predict(gSVMYear1Model, gData_Year2_Cleaned_NoNA_SCALE_FRAMED, type='response')
vSVMPred_Year2 <- ifelse(vSVMPred_Year2 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year2 != gData_Year2_Cleaned_NoNA_SCALE_FRAMED$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.0411874569940037"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year2_ConfusedMatrix <- table(vSVMPred_Year2, gData_Year2_Cleaned_NoNA_SCALE_FRAMED$class)
vSVMPred_Year2_ConfusedMatrix
# vSVMPred_Year2   0   1
#              0  21    2
#              1 9752  398

recall(vSVMPred_Year2_ConfusedMatrix)
# Recall: 0.002148777
precision(vSVMPred_Year2_ConfusedMatrix)
# Precision: 0.9130435
specificity(vSVMPred_Year2_ConfusedMatrix)
# Specificity: 0.995
F_meas(vSVMPred_Year2_ConfusedMatrix)
# F_measure: 0.004287464

vYear2AreaUnderCurve <- roc(class ~vSVMPred_Year2, data = gData_Year2_Cleaned_NoNA_SCALE_FRAMED)
plot(vYear2AreaUnderCurve)
vYear2AreaUnderCurve
# Area under the curve: 0.4986

#--------------- Year 3
vSVMPred_Year3 <- predict(gSVMYear1Model, gData_Year3_Cleaned_NoNA_SCALE_FRAMED, type='response')
vSVMPred_Year3 <- ifelse(vSVMPred_Year3 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year3 != gData_Year3_Cleaned_NoNA_SCALE_FRAMED$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.0715033799866704"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year3_ConfusedMatrix <- table(vSVMPred_Year3, gData_Year3_Cleaned_NoNA_SCALE_FRAMED$class)
vSVMPred_Year3_ConfusedMatrix
# vSVMPred_Year3   0   1
#              0  263    7
#              1 9745  488

recall(vSVMPred_Year3_ConfusedMatrix)
# Recall: 0.02627898
precision(vSVMPred_Year3_ConfusedMatrix)
# Precision: 0.9740741
specificity(vSVMPred_Year3_ConfusedMatrix)
# Specificity: 0.9858586
F_meas(vSVMPred_Year3_ConfusedMatrix)
# F_measure: 0.05117727

vYear3AreaUnderCurve <- roc(class ~vSVMPred_Year3, data = gData_Year3_Cleaned_NoNA_SCALE_FRAMED)
plot(vYear3AreaUnderCurve)
vYear3AreaUnderCurve
# Area under the curve: 0.5061

#--------------- Year 4
vSVMPred_Year4 <- predict(gSVMYear1Model, gData_Year4_Cleaned_NoNA_SCALE_FRAMED, type='response')
vSVMPred_Year4 <- ifelse(vSVMPred_Year4 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year4 != gData_Year4_Cleaned_NoNA_SCALE_FRAMED$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.0608660130718954"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year4_ConfusedMatrix <- table(vSVMPred_Year4, gData_Year4_Cleaned_NoNA_SCALE_FRAMED$class)
vSVMPred_Year4_ConfusedMatrix
# vSVMPred_Year4   0   1
#              0   86    5
#              1 9191  510

recall(vSVMPred_Year4_ConfusedMatrix)
# Recall: 0.009270238
precision(vSVMPred_Year4_ConfusedMatrix)
# Precision: 0.9450549
specificity(vSVMPred_Year4_ConfusedMatrix)
# Specificity: 0.9902913
F_meas(vSVMPred_Year4_ConfusedMatrix)
# F_measure: 0.01836038

vYear4AreaUnderCurve <- roc(class ~vSVMPred_Year4, data = gData_Year4_Cleaned_NoNA_SCALE_FRAMED)
plot(vYear4AreaUnderCurve)
vYear4AreaUnderCurve
# Area under the curve: 0.4998

#--------------- Year 5
vSVMPred_Year5 <- predict(gSVMYear1Model, gData_Year5_Cleaned_NoNA_SCALE_FRAMED, type='response')
vSVMPred_Year5 <- ifelse(vSVMPred_Year5 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year5 != gData_Year5_Cleaned_NoNA_SCALE_FRAMED$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.930287648054146"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year5_ConfusedMatrix <- table(vSVMPred_Year5, gData_Year5_Cleaned_NoNA_SCALE_FRAMED$class)
vSVMPred_Year5_ConfusedMatrix
# vSVMPred_Year5   0   1
#              0 5497  409
#              1    3    1

recall(vSVMPred_Year5_ConfusedMatrix)
# Recall: 0.9994545
precision(vSVMPred_Year5_ConfusedMatrix)
# Precision: 0.9307484
specificity(vSVMPred_Year5_ConfusedMatrix)
# Specificity: 0.002439024
F_meas(vSVMPred_Year5_ConfusedMatrix)
# F_measure: 0.9638787

vYear5AreaUnderCurve <- roc(class ~vSVMPred_Year5, data = gData_Year5_Cleaned_NoNA_SCALE_FRAMED)
plot(vYear5AreaUnderCurve)
vYear5AreaUnderCurve
# Area under the curve: 0.5009

#-------------------
# Test Design - Build B
# Data Mining Task 1 (Use Year 1-5 datasets)
# 1A - Merge Year 1,2,3 as train data and Year 4,5 as test data
# 1B - Apply fix to some missing data based on subject matter
#      Remove some columns after exploration "identified as bad columns"
# 1C - Remove columns identified by subject matter expert as redundant
# "Attr4","Attr9","Attr11","Attr12","Attr13","Attr14","Attr22","Attr24","Attr25",
# "Attr26","Attr28","Attr31","Attr33","Attr35","Attr39","Attr40","Attr42","Attr48",
# "Attr49","Attr50","Attr51","Attr53","Attr54","Attr56","Attr64"
# 1D - Impute missing data with KNN
# 1E - Scale 0 to 1
# Data Mining Task 2 (Use Year 1-3 dataset - that is cleaned)
# 2A - Build Logistic Regression Model
# 2B - Random Forest Model
# 2C - Build Support Vector Model
# 2D - Compare and Evaluate
# Data Mining Task 3 (Use Year 4-5 datasets - that are cleaned)
# 3A - Test Logistic Regression Model on Year 4-5 datasets
# 3B - Test Random Forest Model on Year 4-5 datasets
# 3C - Test Support Vector Model on Year 4-5 datasets
# 3D - Compare and Evaluate
# Test Design Build B - Conclusion of Best Model, Findings and Recommendations

#-------------------Data Mining Task 1A
#---------------Merge Year 1,2,3 as train data and Year 4,5 as test data
# Load the DATA file in R
df_1year <- read.csv(gWorkingFilePath_Year1, header=TRUE, na.strings="?")
df_2year <- read.csv(gWorkingFilePath_Year2, header=TRUE, na.strings="?")
df_3year <- read.csv(gWorkingFilePath_Year3, header=TRUE, na.strings="?")
df_4year <- read.csv(gWorkingFilePath_Year4, header=TRUE, na.strings="?")
df_5year <- read.csv(gWorkingFilePath_Year5, header=TRUE, na.strings="?")

totalrows_train = nrow(df_1year) + nrow(df_2year) + nrow(df_3year)
totalrows_train   # 27703

totalrows_test = nrow(df_4year) + nrow(df_5year)
totalrows_test    # 15702

# Minor exploration, ensure data integrity
df_combined <- rbind(df_1year, df_2year, df_3year, df_4year, df_5year) 
colnames(df_combined) # Attr1 - Attr64, class
dim(df_combined)   # 43405 66
str(df_combined)

df_combined$class <- as.factor(df_combined$class)

#-------------------Data Mining Task 1B
#---------------Apply fix to some missing data based on subject matter
#      Remove some columns after exploration "identified as bad columns"

# Check number of missing data
apply(df_combined, 2, function(x) { sum(is.na(x)) })

cat("Row with no missing data:", sum(complete.cases(df_combined)))   # 19967 rows with no missing data
cat("Row with missing data: ", sum(!complete.cases(df_combined)))    # 23438 rows with missing data

aggr(df_combined)  # shows percentage of missing values in each column
# Note: Can investigate removing Attr21, Attr27, Attr37, Attr45, Attr60
#       due to many missing values in columns
#
# After consulting Subject Matter Expert, derive the following conclusion: 
# - Attr21: Changed missing value to 0. This refers to previous year's sales, because may be a new company.
# - Attr27: Changed missing value to 0, This shows how much return incurred through interest and other misc expenses. Some companies might not have loans from other institutions.
# - Attr37: Remove, because too much missing values. 
# - Attr45: Remove, because it is same as Attr60. Attr60 is more generalized form, as it does not includes Operating expenses.
# - Attr60: Don't remove, because this shows how companies managed to convert products to sales.

# Replace missing values from Attr21 and Attr27 with 0
df_combined$Attr21[is.na(df_combined$Attr21)] <- 0
df_combined$Attr27[is.na(df_combined$Attr27)] <- 0

# Remove column Attr37 and Attr45
df_combined <- subset(df_combined, select=-c(Attr37,Attr45))
colnames(df_combined)

#-------------------Data Mining Task 1C
#---------------Remove columns identified by subject matter expert as redundant
# According to Subject Matter Expert, these are the attributes number to be removed:
#          4 9 11 12 13 14 22 24 25 26 28 31 33 35 39 40 42 48 49 50 51 53 54 56 64

df_reduced_using_expert <- subset(df_combined, select=-c(Attr4 , Attr9 , Attr11, Attr12, Attr13, Attr14, Attr22,
                                                         Attr24, Attr25, Attr26, Attr28, Attr31, Attr33, Attr35,
                                                         Attr39, Attr40, Attr42, Attr48, Attr49, Attr50, Attr51,
                                                         Attr53, Attr54, Attr56, Attr64))



colnames(df_reduced_using_expert)

#-------------------Data Mining Task 1D
#---------------Impute missing data with KNN
set.seed(gSeedCore)
df_imputed_using_expert <- kNN(df_reduced_using_expert, imp_var = FALSE)
df_train_expert <- df_imputed_using_expert[1:totalrows_train, ]
df_test_expert  <- df_imputed_using_expert[(totalrows_train+1):nrow(df_imputed_using_expert) , ]

summary(df_train_expert)
summary(df_test_expert)
dim(df_train_expert)
# 27703    38
dim(df_test_expert)
# 15702    38

write.csv(df_test_expert, file = "../0_Datasets/df_test_expert.csv", row.names=FALSE)
write.csv(df_train_expert, file = "../0_Datasets/df_train_expert.csv", row.names=FALSE)

#-------------------Data Mining Task 1E
#---------------Scale 0 to 1
df_train_expert <- read.csv("../0_Datasets/df_test_expert.csv", header=TRUE)
df_test_expert <- read.csv("../0_Datasets/df_train_expert.csv", header=TRUE)

write.csv(df_imputed_using_expert, file = "../0_Datasets/df_imputed_using_expert.csv", row.names=FALSE)
df_imputed_using_expert_SCALE <- read.csv("../0_Datasets/df_imputed_using_expert.csv", header=TRUE)
df_imputed_using_expert_SCALE <- apply(df_imputed_using_expert_SCALE, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X)))
df_train_expert_SCALE <- df_imputed_using_expert_SCALE[1:totalrows_train, ]
df_test_expert_SCALE <- df_imputed_using_expert_SCALE[(totalrows_train+1):nrow(df_imputed_using_expert) , ]

#-------------------Dealing with Rare Event Prediction
#---------------Apply Under and Over Sample in hopes of getting a Balanced dataset
# Put Class Matrix into Dataframe
df_train_expert_FRAMED<-data.frame(df_train_expert_SCALE)
df_test_expert_FRAMED<-data.frame(df_test_expert_SCALE)

# Create balanced Year 1, 2, 3 data # 1167 bankrupt cases
vData_balanced <- ovun.sample(class ~ ., data = df_train_expert_FRAMED, method="both", N = 1167, p=0.5, seed = 1)$data
summary(vData_balanced)
dim(vData_balanced)
# 1167   38

vData_balanced_NOSCALE <- ovun.sample(class ~ ., data = df_train_expert, method="both", N = 1167, p=0.5, seed = 1)$data
summary(vData_balanced_NOSCALE)
dim(vData_balanced_NOSCALE)

#-------------------Data Mining Task 2A + 3A
#---------------Build Logistic Regression Model
# Train on Year 1, Year2, Year3 data
# Predict Year 4, Year 5

#--------------- Build Model
set.seed(gSeedCore)

gLogRedYear123Model <- glm(class ~.,family=binomial(link='logit'),data=vData_balanced_NOSCALE)
summary(gLogRedYear123Model)
anova(gLogRedYear123Model, test="Chisq")

#--------------- Year 1, 2, 3
vLogPred_Year123 <- predict(gLogRedYear123Model, vData_balanced_NOSCALE, type='response')
vLogPred_Year123 <- ifelse(vLogPred_Year123 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year123 != vData_balanced_NOSCALE$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.710368466152528"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vLogPred_Year123_ConfusedMatrix <- table(vLogPred_Year123, vData_balanced_NOSCALE$class)
vLogPred_Year123_ConfusedMatrix
#  vLogPred_Year123    0   1
#                   0 482 211
#                   1 127 347

recall(vLogPred_Year123_ConfusedMatrix)
# Recall: 0.7914614
precision(vLogPred_Year123_ConfusedMatrix)
# Precision: 0.6955267
specificity(vLogPred_Year123_ConfusedMatrix)
# Specificity: 0.6218638
F_meas(vLogPred_Year123_ConfusedMatrix)
# F_measure: 0.7403994

vYear123AreaUnderCurve <- roc(class ~vLogPred_Year123, data = vData_balanced_NOSCALE)
plot(vYear123AreaUnderCurve)
vYear123AreaUnderCurve
# Area under the curve: 0.7067

#--------------- Year 4, 5
vLogPred_Year45 <- predict(gLogRedYear123Model, df_test_expert, type='response')
vLogPred_Year45 <- ifelse(vLogPred_Year45 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year45 != df_test_expert$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.73558820344367"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vLogPred_Year45_ConfusedMatrix <- table(vLogPred_Year45, df_test_expert$class)
vLogPred_Year45_ConfusedMatrix
#  vLogPred_Year45       0     1
#                   0 19844   632
#                   1  6693   534

recall(vLogPred_Year45_ConfusedMatrix)
# Recall: 0.7477861
precision(vLogPred_Year45_ConfusedMatrix)
# Precision: 0.9691346
specificity(vLogPred_Year45_ConfusedMatrix)
# Specificity: 0.457976
F_meas(vLogPred_Year45_ConfusedMatrix)
# F_measure: 0.844192

vYear45AreaUnderCurve <- roc(class ~vLogPred_Year45, data = df_test_expert)
plot(vYear45AreaUnderCurve)
vYear45AreaUnderCurve
# Area under the curve: 0.6029

#-------------------Data Mining Task 2B +3B
#---------------Build Random Forest

#--------------- Build Model
set.seed(gSeedCore)
gRandomForestYear123Model <- randomForest(class~., data = vData_balanced_NOSCALE, ntree=30) # try with different num of ntree
gRandomForestYear123Model

#--------------- Year 1, 2, 3
vRandomForestPred_Year123 <- predict(gRandomForestYear123Model, vData_balanced_NOSCALE, type='response')
vRandomForestPred_Year123 <- ifelse(vRandomForestPred_Year123 > 0.5,1,0)
vRandomForestPred_Year123
vMisClasificError <- mean(vRandomForestPred_Year123 != vData_balanced_NOSCALE$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.995715509854327"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year123_ConfusedMatrix <- table(vRandomForestPred_Year123, vData_balanced_NOSCALE$class)
vRandomForestPred_Year123_ConfusedMatrix
# vRandomForestPred_Year123   0   1
#                         0 607   3
#                         1   2 555

recall(vRandomForestPred_Year123_ConfusedMatrix)
# Recall: 0.9967159
precision(vRandomForestPred_Year123_ConfusedMatrix)
# Precision: 0.995082
specificity(vRandomForestPred_Year123_ConfusedMatrix)
# Specificity: 0.9946237
F_meas(vRandomForestPred_Year123_ConfusedMatrix)
# F_measure: 0.9958983

vYear123AreaUnderCurve <- roc(class ~vRandomForestPred_Year123, data = vData_balanced_NOSCALE)
plot(vYear123AreaUnderCurve)
vYear123AreaUnderCurve
# Area under the curve: 0.9957

#--------------- Year 4, 5
vRandomForestPred_Year45 <- predict(gRandomForestYear123Model, df_test_expert, type='response')
vRandomForestPred_Year45 <- ifelse(vRandomForestPred_Year45 > 0.5,1,0)
vRandomForestPred_Year45
vMisClasificError <- mean(vRandomForestPred_Year45 != df_test_expert$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.666245532974768"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year45_ConfusedMatrix <- table(vRandomForestPred_Year45, df_test_expert$class)
vRandomForestPred_Year45_ConfusedMatrix
# vRandomForestPred_Year45   0   1
#                      0 17597   306
#                      1  8940   860

recall(vRandomForestPred_Year45_ConfusedMatrix)
# Recall: 0.6631119
precision(vRandomForestPred_Year45_ConfusedMatrix)
# Precision: 0.9829079
specificity(vRandomForestPred_Year45_ConfusedMatrix)
# Specificity: 0.7375643
F_meas(vRandomForestPred_Year45_ConfusedMatrix)
# F_measure: 0.7919442

vYear45AreaUnderCurve <- roc(class ~vRandomForestPred_Year45, data = df_test_expert)
plot(vYear45AreaUnderCurve)
vYear45AreaUnderCurve
# Area under the curve: 0.7003

#-------------------Data Mining Task 2C + 3C
#---------------Build SVM
set.seed(gSeedCore)
gSVMYear123Model <- svm(class ~.,vData_balanced, cost=10, kernel="polynomial")
summary(gSVMYear123Model)

#--------------- Year 1, 2, 3
vSVMPred_Year123 <- predict(gSVMYear123Model, vData_balanced, type='response')
vSVMPred_Year123 <- ifelse(vSVMPred_Year123 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year123 != vData_balanced$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.594687232219366"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year123_ConfusedMatrix <- table(vSVMPred_Year123, vData_balanced$class)
vSVMPred_Year123_ConfusedMatrix
# vSVMPred_Year123   0   1
#                0 603 467
#                1   6  91

recall(vSVMPred_Year123_ConfusedMatrix)
# Recall: 0.9901478
precision(vSVMPred_Year123_ConfusedMatrix)
# Precision: 0.5635514
specificity(vSVMPred_Year123_ConfusedMatrix)
# Specificity: 0.1630824
F_meas(vSVMPred_Year123_ConfusedMatrix)
# F_measure: 0.7182847

vYear123AreaUnderCurve <- roc(class ~vSVMPred_Year123, data = vData_balanced)
plot(vYear123AreaUnderCurve)
vYear123AreaUnderCurve
# Area under the curve: 0.5766

#--------------- Year 4, 5
vSVMPred_Year45 <- predict(gSVMYear123Model, df_test_expert_FRAMED, type='response')
vSVMPred_Year45 <- ifelse(vSVMPred_Year45 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year45 != df_test_expert_FRAMED$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.909947777353203"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year45_ConfusedMatrix <- table(vSVMPred_Year45, df_test_expert_FRAMED$class)
vSVMPred_Year45_ConfusedMatrix
# vSVMPred_Year45    0      1
#               0 14154   791
#               1   623   134

recall(vSVMPred_Year45_ConfusedMatrix)
# Recall: 0.9578399
precision(vSVMPred_Year45_ConfusedMatrix)
# Precision: 0.9470726
specificity(vSVMPred_Year45_ConfusedMatrix)
# Specificity: 0.1448649
F_meas(vSVMPred_Year45_ConfusedMatrix)
# F_measure: 0.9524258

vYear45AreaUnderCurve <- roc(class ~vSVMPred_Year45, data = df_test_expert_FRAMED)
plot(vYear45AreaUnderCurve)
vYear45AreaUnderCurve
# Area under the curve: 0.5514

#-------------------
# Test Design - Build C
# Data Mining Task 1 (Use Year 1-5 datasets)
# 1A - Merge Year 1,2,3 as train data and Year 4,5 as test data
# 1B - Apply fix to some missing data based on subject matter
#      Remove some columns after exploration "identified as bad columns"
# 1C [PIVOT DIFFERING POINT FROM DESIGN B] 
#      Check correlation table to see if some columns can be removed. 
#      Remove identified columns.
# 1D - Impute missing data with KNN
# 1E - Scale 0 to 1
# Data Mining Task 2 (Use Year 1-3 dataset - that is cleaned)
# 2A - Build Logistic Regression Model
# 2B - Random Forest Model
# 2C - Build Support Vector Model
# 2D - Compare and Evaluate
# Data Mining Task 3 (Use Year 4-5 datasets - that are cleaned)
# 3A - Test Logistic Regression Model on Year 4-5 datasets
# 3B - Test Neural Network Model on Year 4-5 datasets
# 3C - Test Support Vector Model on Year 4-5 datasets
# 3D - Compare and Evaluate
# Test Design Build C - Conclusion of Best Model, Findings and Recommendations

#-------------------Data Mining Task 1A
#---------------Merge Year 1,2,3 as train data and Year 4,5 as test data
# Load the DATA file in R
df_1year <- read.csv(gWorkingFilePath_Year1, header=TRUE, na.strings="?")
df_2year <- read.csv(gWorkingFilePath_Year2, header=TRUE, na.strings="?")
df_3year <- read.csv(gWorkingFilePath_Year3, header=TRUE, na.strings="?")
df_4year <- read.csv(gWorkingFilePath_Year4, header=TRUE, na.strings="?")
df_5year <- read.csv(gWorkingFilePath_Year5, header=TRUE, na.strings="?")

totalrows_train = nrow(df_1year) + nrow(df_2year) + nrow(df_3year)
totalrows_train   # 27703

totalrows_test = nrow(df_4year) + nrow(df_5year)
totalrows_test    # 15702

# Minor exploration, ensure data integrity
df_combined <- rbind(df_1year, df_2year, df_3year, df_4year, df_5year) 
colnames(df_combined) # Attr1 - Attr64, class
dim(df_combined)   # 43405 66
str(df_combined)

df_combined$class <- as.factor(df_combined$class)

#-------------------Data Mining Task 1B
#---------------Apply fix to some missing data based on subject matter
#      Remove some columns after exploration "identified as bad columns"

# Check number of missing data
apply(df_combined, 2, function(x) { sum(is.na(x)) })

cat("Row with no missing data:", sum(complete.cases(df_combined)))   # 19967 rows with no missing data
cat("Row with missing data: ", sum(!complete.cases(df_combined)))    # 23438 rows with missing data

aggr(df_combined)  # shows percentage of missing values in each column
# Note: Can investigate removing Attr21, Attr27, Attr37, Attr45, Attr60
#       due to many missing values in columns
#
# After consulting Subject Matter Expert, derive the following conclusion: 
# - Attr21: Changed missing value to 0. This refers to previous year's sales, because may be a new company.
# - Attr27: Changed missing value to 0, This shows how much return incurred through interest and other misc expenses. Some companies might not have loans from other institutions.
# - Attr37: Remove, because too much missing values. 
# - Attr45: Remove, because it is same as Attr60. Attr60 is more generalized form, as it does not includes Operating expenses.
# - Attr60: Don't remove, because this shows how companies managed to convert products to sales.

# Replace missing values from Attr21 and Attr27 with 0
df_combined$Attr21[is.na(df_combined$Attr21)] <- 0
df_combined$Attr27[is.na(df_combined$Attr27)] <- 0

# Remove column Attr37 and Attr45
df_combined <- subset(df_combined, select=-c(Attr37,Attr45))
colnames(df_combined)

#-------------------Data Mining Task 1C
# [PIVOT DIFFERING POINT FROM BUILD B]
#      Check correlation table to see if some columns can be removed. 
#      Remove identified columns.

df_cor <- cor(df_combined[1:(ncol(df_combined)-1)], use = "complete.obs")
df_cor

corrplot(df_cor, type="upper")

hc <- findCorrelation(df_cor, cutoff=0.8, verbose = T)
hc = sort(hc)
hc
# Due to high correlation, these columns are recommended to be removed:
#          2  4  6  7  8 10 11 13 14 18 19 20 21 22 24 26 28 29 31 32 33 34 36 40 41 42 44 47 50 54 56 60 61

df_reduced_using_cor <- df_combined[, -hc]
colnames(df_reduced_using_cor)

#-------------------Data Mining Task 1D
#---------------Impute missing data with KNN
set.seed(gSeedCore)
df_imputed_using_cor <- kNN(df_reduced_using_cor, imp_var = FALSE)
df_train_cor <- df_imputed_using_cor[1:totalrows_train, ]
df_test_cor  <- df_imputed_using_cor[(totalrows_train+1):nrow(df_imputed_using_cor) , ]
summary(df_train_cor)
summary(df_test_cor)
dim(df_train_cor)
# 27703    27
dim(df_test_cor)
# 15702    27

write.csv(df_train_cor, file = "../0_Datasets/df_train_cor.csv", row.names=FALSE)
write.csv(df_test_cor, file = "../0_Datasets/df_test_cor.csv", row.names=FALSE)

#-------------------Data Mining Task 1E
#---------------Scale 0 to 1
df_train_cor <- read.csv("../0_Datasets/df_train_cor.csv", header=TRUE)
df_test_cor <- read.csv("../0_Datasets/df_test_cor.csv", header=TRUE)

write.csv(df_imputed_using_cor, file = "../0_Datasets/df_imputed_using_cor.csv", row.names=FALSE)
df_imputed_using_cor <- read.csv("../0_Datasets/df_imputed_using_cor.csv", header=TRUE)
df_imputed_using_cor_SCALE <- apply(df_imputed_using_cor, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X)))

df_train_cor_SCALE <- df_imputed_using_cor_SCALE[1:totalrows_train, ]
df_test_cor_SCALE <- df_imputed_using_cor_SCALE[(totalrows_train+1):nrow(df_imputed_using_cor) , ]

#-------------------Dealing with Rare Event Prediction
#---------------Apply Under and Over Sample in hopes of getting a Balanced dataset
# Put Class Matrix into Dataframe
df_train_cor_FRAMED<-data.frame(df_train_cor_SCALE)
df_test_cor_FRAMED<-data.frame(df_test_cor_SCALE)

# Create balanced Year 1, 2, 3 data # 1167 bankrupt cases
vData_balanced <- ovun.sample(class ~ ., data = df_train_cor_FRAMED, method="both", N = 1167, p=0.5, seed = 1)$data
summary(vData_balanced)
dim(vData_balanced)
# 1167   27

# Create balanced Year 1, 2, 3 data # 1167 bankrupt cases
vData_balanced_NOSCALE <- ovun.sample(class ~ ., data = df_train_cor, method="both", N = 1167, p=0.5, seed = 1)$data
summary(vData_balanced_NOSCALE)
dim(vData_balanced_NOSCALE)
# 1167   27

#-------------------Data Mining Task 2A + 3A
#---------------Build Logistic Regression Model
# Train on Year 1, Year2, Year3 data
# Predict Year 4, Year 5

#--------------- Build Model
set.seed(gSeedCore)
gLogRedYear123Model <- glm(class ~.,family=binomial(link='logit'),data=vData_balanced_NOSCALE)
summary(gLogRedYear123Model)
anova(gLogRedYear123Model, test="Chisq")

#--------------- Year 1, 2, 3
vLogPred_Year123 <- predict(gLogRedYear123Model, vData_balanced_NOSCALE, type='response')
vLogPred_Year123 <- ifelse(vLogPred_Year123 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year123 != vData_balanced_NOSCALE$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.692373607540703"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vLogPred_Year123_ConfusedMatrix <- table(vLogPred_Year123, vData_balanced_NOSCALE$class)
vLogPred_Year123_ConfusedMatrix
#  vLogPred_Year123    0   1
#                   0 458 208
#                   1 151 350

recall(vLogPred_Year123_ConfusedMatrix)
# Recall: 0.7520525
precision(vLogPred_Year123_ConfusedMatrix)
# Precision: 0.6876877
specificity(vLogPred_Year123_ConfusedMatrix)
# Specificity: 0.6272401
F_meas(vLogPred_Year123_ConfusedMatrix)
# F_measure: 0.7184314

vYear123AreaUnderCurve <- roc(class ~vLogPred_Year123, data = vData_balanced_NOSCALE)
plot(vYear123AreaUnderCurve)
vYear123AreaUnderCurve
# Area under the curve: 0.6896

#--------------- Year 4, 5
vLogPred_Year45 <- predict(gLogRedYear123Model, df_test_cor, type='response')
vLogPred_Year45 <- ifelse(vLogPred_Year45 > 0.5,1,0)

vMisClasificError <- mean(vLogPred_Year45 != df_test_cor$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.80652146223411"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vLogPred_Year45_ConfusedMatrix <- table(vLogPred_Year45, df_test_cor$class)
vLogPred_Year45_ConfusedMatrix
#  vLogPred_Year45       0     1
#                   0 12090   351
#                   1  2687   574

recall(vLogPred_Year45_ConfusedMatrix)
# Recall: 0.8181634
precision(vLogPred_Year45_ConfusedMatrix)
# Precision: 0.9717868
specificity(vLogPred_Year45_ConfusedMatrix)
# Specificity: 0.6205405
F_meas(vLogPred_Year45_ConfusedMatrix)
# F_measure: 0.8883827

vYear45AreaUnderCurve <- roc(class ~vLogPred_Year45, data = df_test_cor)
plot(vYear45AreaUnderCurve)
vYear45AreaUnderCurve
# Area under the curve: 0.7194

#-------------------Data Mining Task 2B +3B
#---------------Build Random Forest

#--------------- Build Model
set.seed(gSeedCore)
gRandomForestYear123Model <- randomForest(class~., data = vData_balanced_NOSCALE, ntree=30) # try with different num of ntree
gRandomForestYear123Model

#--------------- Year 1, 2, 3
vRandomForestPred_Year123 <- predict(gRandomForestYear123Model, vData_balanced_NOSCALE, type='response')
vRandomForestPred_Year123 <- ifelse(vRandomForestPred_Year123 > 0.5,1,0)
vRandomForestPred_Year123
vMisClasificError <- mean(vRandomForestPred_Year123 != vData_balanced_NOSCALE$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.995715509854327"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year123_ConfusedMatrix <- table(vRandomForestPred_Year123, vData_balanced_NOSCALE$class)
vRandomForestPred_Year123_ConfusedMatrix
# vRandomForestPred_Year123   0   1
#                         0 607   3
#                         1   2 555

recall(vRandomForestPred_Year123_ConfusedMatrix)
# Recall: 0.9967159
precision(vRandomForestPred_Year123_ConfusedMatrix)
# Precision: 0.995082
specificity(vRandomForestPred_Year123_ConfusedMatrix)
# Specificity: 0.9946237
F_meas(vRandomForestPred_Year123_ConfusedMatrix)
# F_measure: 0.9958983

vYear123AreaUnderCurve <- roc(class ~vRandomForestPred_Year123, data = vData_balanced_NOSCALE)
plot(vYear123AreaUnderCurve)
vYear123AreaUnderCurve
# Area under the curve: 0.9957

#--------------- Year 4, 5
vRandomForestPred_Year45 <- predict(gRandomForestYear123Model, df_test_cor, type='response')
vRandomForestPred_Year45 <- ifelse(vRandomForestPred_Year45 > 0.5,1,0)
vRandomForestPred_Year45
vMisClasificError <- mean(vRandomForestPred_Year45 != df_test_cor$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.80741306839893"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vRandomForestPred_Year45_ConfusedMatrix <- table(vRandomForestPred_Year45, df_test_cor$class)
vRandomForestPred_Year45_ConfusedMatrix
# vRandomForestPred_Year45   0   1
#                      0 11989   236
#                      1  2788   689

recall(vRandomForestPred_Year45_ConfusedMatrix)
# Recall: 0.8113284
precision(vRandomForestPred_Year45_ConfusedMatrix)
# Precision: 0.9806953
specificity(vRandomForestPred_Year45_ConfusedMatrix)
# Specificity: 0.7448649
F_meas(vRandomForestPred_Year45_ConfusedMatrix)
# F_measure: 0.8880083

vYear45AreaUnderCurve <- roc(class ~vRandomForestPred_Year45, data = df_test_cor)
plot(vYear45AreaUnderCurve)
vYear45AreaUnderCurve
# Area under the curve: 0.7781

#-------------------Data Mining Task 2C + 3C
#---------------Build SVM
set.seed(gSeedCore)
gSVMYear123Model <- svm(class ~.,vData_balanced, cost=10, kernel="polynomial")
summary(gSVMYear123Model)

#--------------- Year 1, 2, 3
vSVMPred_Year123 <- predict(gSVMYear123Model, vData_balanced, type='response')
vSVMPred_Year123 <- ifelse(vSVMPred_Year123 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year123 != vData_balanced$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.582690659811482"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year123_ConfusedMatrix <- table(vSVMPred_Year123, vData_balanced$class)
vSVMPred_Year123_ConfusedMatrix
# vSVMPred_Year123   0   1
#                 0 601 479
#                 1   8  79

recall(vSVMPred_Year123_ConfusedMatrix)
# Recall: 0.9868637
precision(vSVMPred_Year123_ConfusedMatrix)
# Precision: 0.5564815
specificity(vSVMPred_Year123_ConfusedMatrix)
# Specificity: 0.1415771
F_meas(vSVMPred_Year123_ConfusedMatrix)
# F_measure: 0.7116637

vYear123AreaUnderCurve <- roc(class ~vSVMPred_Year123, data = vData_balanced)
plot(vYear123AreaUnderCurve)
vYear123AreaUnderCurve
# Area under the curve: 0.5642

#--------------- Year 4, 5
vSVMPred_Year45 <- predict(gSVMYear123Model, df_test_cor_FRAMED, type='response')
vSVMPred_Year45 <- ifelse(vSVMPred_Year45 > 0.5,1,0)

vMisClasificError <- mean(vSVMPred_Year45 != df_test_cor_FRAMED$class)
print(paste('Accuracy',1-vMisClasificError))
# "Accuracy 0.918354349764361"
# As this is a rare event prediction, accuracy is not regarded when choosing model
# It is put in as a parameter for observation

vSVMPred_Year45_ConfusedMatrix <- table(vSVMPred_Year45, df_test_cor_FRAMED$class)
vSVMPred_Year45_ConfusedMatrix
# vSVMPred_Year45    0      1
#                0 14294   799
#                1   483   126

recall(vSVMPred_Year45_ConfusedMatrix)
# Recall: 0.9673141
precision(vSVMPred_Year45_ConfusedMatrix)
# Precision: 0.9470616
specificity(vSVMPred_Year45_ConfusedMatrix)
# Specificity: 0.1362162
F_meas(vSVMPred_Year45_ConfusedMatrix)
# F_measure: 0.9570807

vYear45AreaUnderCurve <- roc(class ~vSVMPred_Year45, data = df_test_cor_FRAMED)
plot(vYear45AreaUnderCurve)
vYear45AreaUnderCurve
# Area under the curve: 0.5518
