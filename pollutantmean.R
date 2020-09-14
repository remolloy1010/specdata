pollutantmean <- function(directory, pollutant, id = 1:332){

    # Initialize array of means from pollutant data
    meanPollutantArray <- c()
    pollutantArrayCombo <- c()

    
    # Loop through each id specified
    for (num in id) {
        # print(paste("num: ", num))
    
        # Read csv file & output data table
        fileID <- formatC(num, width=3, flag="0")
        filename <- paste('./', directory, '/', fileID, '.csv', sep='')
        dataTable <- read.csv(filename)

        # Remove NA and find mean of pollutant data
        dataTableClean <- complete.cases(dataTable)

        pollutantArrayClean <- dataTable[dataTableClean,][pollutant]
        # print(paste("pollutant array: ", pollutantArrayClean))
        
        pollutantArrayCombo <- rbind(pollutantArrayCombo, pollutantArrayClean)
        # print(paste("dimension of array: ", dim(pollutantArrayCombo)))


        
    }

    # Flatten list to find mean of all values in list
    unlist_pollutantArrayCombo <- unlist(pollutantArrayCombo)
    
    return (mean(unlist_pollutantArrayCombo))
    
    
}
pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")



