library(reshape2)

train.x <- read.table("./train/X_train.txt")
train.y <- read.table("./train/y_train.txt")
train.subject <- read.table("./train/subject_train.txt")
test.x <- read.table("./test/X_test.txt")
test.y <- read.table("./test/y_test.txt")
test.subject <- read.table("./test/subject_test.txt")

x <- rbind(train.x, test.x)
y <- rbind(train.y, test.y)
subject <- rbind(train.subject, test.subject)

names(y) <- c("label")
names(subject) <- c("subject")
features <- read.table("./features.txt", stringsAsFactors = FALSE)
names(x) <- features[,2]

# select the columns (variables) that are derived by mean() and std() methods
search <- grep("mean.*()|std.*()", names(x))
nx <- x[, search]

# transform y (label code) to label (label)
activity.labels <- read.table("./activity_labels.txt", stringsAsFactors = FALSE)
label <- merge(y, activity.labels, by = 1)[2]
names(label) = c("label")

data <- cbind(subject, label, nx)

# Compute the means, grouped by subject/label
melted <- melt(data, id.var = c("subject", "label"))
means <- dcast(melted , subject + label ~ variable, mean)

# Save the resulting dataset
write.table(means, file="./tidy_data.txt")

# Output final dataset
means