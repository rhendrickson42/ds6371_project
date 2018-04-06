
dataDir <- "data/kaggle/"
trainFile <- paste0(dataDir, "train.csv")
testFile <- paste0(dataDir, "test.csv")
sampleFile <- paste0(dataDir, "sample_submission.csv")

train <- read.csv(trainFile, header=TRUE, sep=",")
test <- read.csv(testFile, header=TRUE, sep=",")
sample <- read.csv(sampleFile, header=TRUE, sep=",")
