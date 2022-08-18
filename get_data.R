# Load libraries
library(tidyverse) # collection of r packages for data science
library(here)

# Check working directory
getwd()
here::i_am("get_data.R")

# Download data 
dir.create("data")
setwd("data")

dir.create("data_raw")
setwd("data_raw")

# 1) Download the trip data for the last 12 months from https://divvy-tripdata.s3.amazonaws.com/index.html

# 1.1) Create a vector with the dates to download
dates_to_download <- c(paste0("20210", c(1:4)), paste0("20200", c(5:9)), paste0("2020", c(10:12)))

# Download the files  
download.file(
  paste0("https://divvy-tripdata.s3.amazonaws.com/", dates_to_download, "-divvy-tripdata.zip"),
  paste0(dates_to_download, "-divvy-tripdata.zip")
)

# Read data files for each month and append them into one dataframe. 
file_names <- dir("./")
trip_data <- do.call(rbind, lapply(file_names, read_csv))

# Move back to project root folder
setwd("./../..")
getwd()

# trip_data2 <- do.call(rbind, lapply(paste0("./data/data_raw/",file_names), read_csv))


