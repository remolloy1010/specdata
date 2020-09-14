corr <- function(directory, threshold=0) {
    

    # Initialize vectors
    id_vector <- c()
    obs_vector <- c()
    corr_vector <- c()
    
    
    df <- complete("specdata", 1:332)
    # print(df)
    for (obs in df$nobs){
        if(obs >= threshold){
            id <- df$id[df$nobs == obs]
            obs_new <- df$nobs[df$nobs == obs]
            id_vector <- append(id_vector, id)
            obs_vector <- append(obs_vector, obs_new)
            
        }

    }

    print(dim(id_vector)[1])
    print(dim(obs_vector)[1])
    obs_df <- data.frame("id" = id_vector,
                      "obs" = obs_vector)

    print(obs_df)
    
    for (i in obs_df$id){
        # Read csv file & output data table
        fileID <- formatC(i, width=3, flag="0")
        filename <- paste('./', directory, '/', fileID, '.csv', sep='')
        dataTable <- read.csv(filename)
        # print(filename)
        
        # Remove NA and find mean of pollutant data
        dataTableClean <- complete.cases(dataTable)
        clean_array <- dataTable[dataTableClean,]
        # print(dim(clean_array))
        sulfateArrayClean <- dataTable[dataTableClean,]['sulfate']
        # print(sulfateArrayClean)
        nitrateArrayClean <- dataTable[dataTableClean,]['nitrate']
        # print(paste('length of sulfate: ', dim(sulfateArrayClean)[1]))
        # print(paste('length of nitrate: ', dim(nitrateArrayClean)[1]))
        corr_val <- cor(sulfateArrayClean, nitrateArrayClean)
        corr_vector <- append(corr_vector, corr_val)
        # print(corr_val)
        # print(corr_vector)
    }
    return (corr_vector)

}
    
    
corr("specdata", 1000)
cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
