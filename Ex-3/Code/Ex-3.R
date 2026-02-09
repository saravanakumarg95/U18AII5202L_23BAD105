# 23BAD105
# Saravanakumar G
library(dplyr)

# 1. Load the dataset
health <- read.csv("C:\\Users\\DAAI\\Downloads\\3.healthcare_data.csv")

# 2. Preprocess Data: Remove Patient_ID and filter for numeric columns
# Using the dplyr pipe to remove Patient_ID as per your image
health_clean <- health %>% select(-Patient_ID)
numeric_data <- health_clean[sapply(health_clean, is.numeric)]

# 3. Basic Scatter Plot Matrix
pairs(numeric_data, 
      main = "Scatter Plot Matrix of Health Indicators")

# 4. Create Age Groups and Plot with Color Encoding
# Binning Age into: Young (0-30), Middle (31-45), Senior (46-60), Elder (61-100)
health$Age_Group <- cut(health$Age, 
                        breaks = c(0, 30, 45, 60, 100), 
                        labels = c("Young", "Middle", "Senior", "Elder"))

# Convert factors to numeric for color mapping
colors <- as.numeric(health$Age_Group)

pairs(numeric_data, 
      col = colors, 
      pch = 19, 
      main = "Scatter Plot Matrix with Age Group Encoding")

# Add legend to the plot
legend("topright", 
       legend = levels(health$Age_Group), 
       col = 1:length(levels(health$Age_Group)), 
       pch = 19)

# 5. Correlation Analysis
# Calculate and print the correlation matrix for complete observations
cor_matrix <- cor(numeric_data, use = "complete.obs")
print(cor_matrix)