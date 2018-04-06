
outdir <- "data/clean/"
cleantrainFile <- paste0(outdir, "cleantrain.csv")
qoi1File <- paste0(outdir, "qoi1.csv")

write.csv(cleantrain, file=cleantrainFile)
write.csv(qoi1, file=qoi1File)
