pollutantmean <- function(directory, pollutant, id=1:332){
    ## 'directory' is a character vector of length 1 indicating the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating the name of the pollutant for which we will calculate the mean; either "sulfate" or "nitrate"
    
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    
    ## Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
    
    ## NOTE: do not round result!
    
    # Initialize array of means from pollutant data
    meanPollutantArray <- c()
    
    # Loop through each id specified
    for (num in id) {
        print(num)
    
        # Read csv file & output data table
        fileID <- formatC(num, width=3, flag="0")
        filename <- paste('./', directory, '/', fileID, '.csv', sep='')
        dataTable <- read.csv(filename)
        print(dataTable)
        
        # Remove NA and find mean of pollutant data
        dataTableClean <- complete.cases(dataTable)
        #print(pollutantArrayClean)
        #meanPollutant2 <- mean(dataTable[pollutantArrayClean,]))
        
        pollutantArrayClean <- dataTable[dataTableClean,][pollutant]
        print(pollutantArrayClean)
        
        #meanPollutant <- mean(pollutantArrayClean)
        meanPollutant <- mean(as.matrix(pollutantArrayClean))
        print(meanPollutant)
        meanPollutantArray <- append(meanPollutantArray, meanPollutant)
        print(meanPollutantArray)
        meanAllMonitors <- mean(meanPollutantArray)
        print(meanAllMonitors)
        
    }
    
    return (meanPollutant)
    
    
}