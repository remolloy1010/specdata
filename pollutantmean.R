pollutantmean <- function(pollutant, id=1:332){
    ## 'directory' is a character vector of length 1 indicating the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating the name of the pollutant for which we will calculate the mean; either "sulfate" or "nitrate"
    
    ## 'id' is an integer vector indicating teh monitor ID numbers to be used
    
    ## Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
    
    ## NOTE: do not round result!
    

    # Read csv file & output data table
    for (num in id) {
        if (id < 10) {
            fileID <- paste('00',id,sep='')
        }
        else if (id < 100) {
            fileID <- paste('0',id,sep='')
        }
        else {
            fileID <- id
        }
    }
    
    filename <- paste(fileID, 'csv', sep='.')
    dataTable <- read.csv(filename)
    
    # Remove NA and find mean of pollutant data
    pollutantArrayClean <- complete.cases(dataTable[pollutant])
    meanPollutant <- mean(pollutantArrayClean)
    
    return (meanPollutant)
}