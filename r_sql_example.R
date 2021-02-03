###########################################################################
#
# SQL example
#--------------------------------------------------------------------------
#
# Created by K. Aagaard
#
# Modified:  
# 03 February 2021
# By: Kevin Aagaard
#
###########################################################################

# Initialize settings (workspace, directory, etc.) ------------------------

#Clear the workspace
rm(
  list = 
    ls()
)

#Clear the console
cat(
  '\014'
)

#Set seed for random number generation
set.seed(123)

#Include necessary libraries
x = 
  c(
    "sqldf"
  )

# # If you don't know if you've installed the packages for some of these 
# # libraries, run this:
# install.packages(x)

# # `emo` not available for R traditionally
# devtools::install_github("hadley/emo")

lapply(
  x, 
  library, 
  character.only = TRUE
)

rm(
  x
)

#Set working directory (should be universal)
setwd(
  dirname(
    rstudioapi::callFun(
      "getActiveDocumentContext"
    )$path
  )
)

getwd()


#
# Data --------------------------------------------------------------------
# Example queries with installed data

# SELECT, * = wildcard
sqldf(
  'SELECT age, circumference 
  FROM Orange'
  )

# LIMIT
sqldf(
  'SELECT *
  FROM iris 
  LIMIT 5'
)

# ORDER, `ASC` = ascending; `DESC` = descending
sqldf(
  'SELECT * 
  FROM Orange 
  ORDER BY age ASC, circumference DESC 
  LIMIT 5'
)

# WHERE
sqldf(
  'SELECT * 
  FROM Orange 
  WHERE (age > 700 AND circumference > 150) OR Tree = 5'
)

sqldf(
  'SELECT * 
  FROM Orange 
  WHERE Tree IN (1, 3, 4) AND circumference < 150'
)

sqldf(
  'SELECT * 
  FROM Orange 
  WHERE Tree NOT IN (1, 3, 4) AND circumference < 150'
)

# LIKE, % = wildcard
sqldf(
  'SELECT * 
  FROM chickwts 
  WHERE feed LIKE "%bean" 
  LIMIT 5'
)

sqldf(
  'SELECT * 
  FROM chickwts 
  WHERE feed NOT LIKE "%bean" 
  LIMIT 5'
)

# Aggregating data
# AVG, MEDIAN, MAX, MIN, and SUM
# Can GROUP BY columns and rename with AS
sqldf(
  'SELECT AVG(circumference) 
  FROM Orange'
)

sqldf(
  'SELECT tree, AVG(circumference) 
  AS meancirc 
  FROM Orange 
  GROUP BY tree'
)

# Summarizing data structure
sqldf(
  'SELECT COUNT() 
  AS numrows 
  FROM iris'
)

sqldf(
  'SELECT COUNT(Species) 
  FROM iris'
)


#
# More advanced tools and commands for remotely stored data ---------------
# https://www.w3schools.com/sql/default.asp
# http://sqlzoo.net/
# http://www.w3resource.com/sql/tutorials.php


#