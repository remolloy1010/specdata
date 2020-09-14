complete <- function(directory, id = 1:332) {
    
    pollutantArrayCombo <- c()
    len_sulfate <- c()
    len_nitrate <- c()
    id_vector <- c()
 
    # Loop through each id specified
    for (i in id) {

        # Read csv file & output data table
        fileID <- formatC(i, width=3, flag="0")
        filename <- paste('./', directory, '/', fileID, '.csv', sep='')
        dataTable <- read.csv(filename)
        
        # Remove NA and find mean of pollutant data
        dataTableClean <- complete.cases(dataTable)

        sulfateArrayClean <- dataTable[dataTableClean,]['sulfate']
        nitrateArrayClean <- dataTable[dataTableClean,]['nitrate']
        id_vector <- append(id_vector, i)
        len_sulfate <- append(len_sulfate, lengths(sulfateArrayClean))
        len_nitrate <- append(len_nitrate, lengths(nitrateArrayClean))
        # print((sulfateArrayClean))
        # print(lengths(nitrateArrayClean))
        # print(lengths(sulfateArrayClean))
        }
        # print(paste("pollutant array: ", pollutantArrayClean))
        # df <- rbind(df, c(num, lengths(sulfateArrayClean)))
    df <- data.frame('id' = id_vector,
                    'nobs' = len_sulfate)
        # pollutantArrayCombo <- rbind("id"= pollutantArrayCombo, "nobs"=pollutantArrayClean)
        # print(paste("dimension of array: ", dim(pollutantArrayCombo)))
    df_clean <- df[complete.cases(df),]
    
    return (df_clean)
    
}
complete("specdata", 1)
complete("specdata", c(2,4,8,10,12))
complete("specdata", 30:25)
complete("specdata", 54)
complete("specdata", c(6,10,20,34,100,200,310))
complete("specdata", 1:332)


