#create subfolders
dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")
#load dataset
data <-read.csv(file.choose())
#view data
view(data)
View(data)
#inspect dataset structure
str(data)
#identify variables with incorrect or inconsistent data types and convert to appropriate data types
#convert gender to factor
data$gender <-as.factor(data$gender)
str(data)
#convert diagnosis to factor
data$diagnosis <-as.factor(data$diagnosis)
str(data)
#convert smoker to factor
data$smoker <-as.factor(data$smoker)
#create new variable for smoking status as a binary factor
#1 for Yes, 0 for No
data$smoking_status <- factor(ifelse(data$smoker == "Yes", 1, 0), levels = c(0, 1))
str(data)
levels(data$smoking_status)
#save the cleansed dataset
write.csv(smoking_status, file="clean_data.csv")
write.csv(data, file="clean_data.csv")
write.csv(data, file="clean_data/patient_info_clean.csv")
