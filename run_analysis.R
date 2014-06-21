library(reshape)

activities = read.table("data/activity_labels.txt", col.names = c("activity.id", "activity"))

#Convert series of parens, dashes, and commas to a period and remove any terminal periods
features = read.table("data/features.txt", col.names = c("feature.id", "feature"))$feature
features = gsub("[\\(\\)\\-,]+", ".", features, perl = TRUE) 
features = gsub("\\.+$", "", features, perl = TRUE)

s1 <- read.table("data/test/subject_test.txt", col.names = c("subject.id"))
y1 <- read.table("data/test/Y_test.txt", col.names = c("activity.id"))
x1 <- read.table("data/test/X_test.txt", col.names = features)

s2 <- read.table("data/train/subject_train.txt", col.names = c("subject.id"))
y2 <- read.table("data/train/Y_train.txt", col.names = c("activity.id"))
x2 <- read.table("data/train/X_train.txt", col.names = features)

s <- rbind(s1, s2)
y <- merge(rbind(y1, y2), activities)
x <- rbind(x1, x2)

#Only use x fields ending in mean or std optionally followed with .X, .Y, or .Z
fields = features[grepl("(mean|std)(\\.[XYZ])?$", features, perl = TRUE)]

data <- cbind(s, y["activity"], x[fields]) #The first data set

melted <- melt(data, id = c("subject.id", "activity"), measure.vars = fields) 
casted = cast(melted, subject.id + activity ~ variable, mean) #The second data set

write.table(data, file = "first.txt", row.names = FALSE)
write.table(casted, file = "second.txt", row.names = FALSE)
