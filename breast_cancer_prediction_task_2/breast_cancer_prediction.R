## Loading Library
library(readr)
library(class)
install.packages('gmodels')
library(gmodels)
library(dplyr)

# Load the breast cancer dataset
data("BreastCancer", package = "mlbench")

# Assign the dataset to a variable
bc_data <- BreastCancer
View(bc_data)


# Data Exploration
table(bc_data$Class)
round(prop.table(table(bc_data$Class)) * 100, digits = 1)

sum(is.na(bc_data))
bc_data_clean<-na.omit(bc_data)

sum(is.na(bc_data_clean))

summary(bc_data_clean)

# Data transformation
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

bc_data_clean<-select(bc_data_clean,-Id)
colnames(bc_data_clean)[colnames(bc_data_clean) == "Class"] <- "diagnosis"
View(bc_data_clean)
summary(bc_data_clean)
new_bcd <- as.data.frame(lapply(select(bc_data_clean,-diagnosis), normalize))








