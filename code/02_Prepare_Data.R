
# Make sure the names for the Neighborhoods we are interested are all spelled correctly
sort(unique(train$Neighborhood))


getAllNA <- function(df) {
    nmax <- length(names(df))
    
    for (colidx in 1:nmax) {
        colname <- names(df)[colidx]
        nasum <- sum(is.na(df[,colidx]))
        if (nasum > 0) {
            cat( sprintf("Column index %d - %s of type %s  : has %d NA's\n", colidx, colname, class(df[0,colidx]), nasum) )
        }
    }
}

fixNA <- function(df) {
    nmax <- length(names(df))
    
    newdf <- data.frame(df)
    
    for (colidx in 1:nmax) {
        colname <- names(newdf)[colidx]
        nasum <- sum(is.na(newdf[,colidx]))
        if (nasum > 0) {
            classtype <- class(newdf[0,colidx])
            if (classtype == "factor") {
                newdf[,colidx] <- as.character(newdf[,colidx])
                indexes = which( is.na(newdf[,colidx]) == TRUE)
                newdf[indexes,colidx] <- ""
            } else if (classtype == "integer") {
                indexes = which( is.na(newdf[,colidx]) == TRUE)
                newdf[indexes,colidx] <- 0
            }
        }
    }
    
    return (newdf)
}

cleantrain <- fixNA(train)
getAllNA(cleantrain)


qoi1 <- cleantrain[which(train$Neighborhood %in% c('NAmes','Edwards','BrkSide')),]