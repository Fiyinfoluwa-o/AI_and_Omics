
#1 Check Cholesterol level using if
cholesterol_level <- 230
if(cholesterol_level > 240){
  print("High cholesterol") 
}

#2 An if else statement to check if blood pressure is normal
Systolic_bp <- 100
if(Systolic_bp < 120){
  print("Blood pressure is normal")
}else{
  print("Blood pressure is high!")
}

#3 Automating Data Type Conversion with for loop
#Load the datasets first
patient_info <- read.csv("patient_info.csv")
metadata <- read.csv("metadata.csv")
getwd()

# For patient_info.csv
# Make a copy
patient_info_new <- patient_info
# Identify columns to convert
str(patient_info_new)
# We have 3 columns to convert, they are: gender, diagnosis, and smoker
# To convert the columns automatically into factors
for(i in 1:ncol(patient_info_new)){
  if(is.character(patient_info_new[[i]])){
    patient_info_new[[i]] <- as.factor(patient_info_new[[i]])
  }
}
str(patient_info_new)
str(patient_info)

# For metadata.csv
# Make a copy
metadata_new <- metadata
# Identify columns to convert
str(metadata)
# We have 2 columns to convert, they are: height, gender
# To convert the columns automatically into factors
for(i in 1:ncol(metadata_new)){
  if(is.character(metadata_new[[i]])){
    metadata_new[[i]] <- as.factor(metadata_new[[i]])
  }
}
str(metadata_new)
str(metadata)

# Converting factors to numeric codes
# Using patient_info_new as a example
str(patient_info_new)
patient_info_new <- data.frame(gender = c("Female", "Male"), diagnosis = c("Cancer", "Normal"), smoker = c("Yes", "No"), stringsAsFactors = TRUE)
#  Columns to convert
binary_cols <- c("smoker")
# Loop to convert "Yes" -> 1, "No" -> 0
for (col in binary_cols) {
  patient_info_new[[col]] <- ifelse(patient_info_new[[col]] == "Yes", 1, 0)
}

# View result
print(patient_info_new)

# Verification:
# Compare the original and modified datasets to confirm changes.
str(patient_info)
str(patient_info_new)

#save entire workspace
save.image(file="full_workspace.RData")
load("full_workspace.RData")
