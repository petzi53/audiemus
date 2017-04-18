## ----label = "global-options", echo=FALSE, highlight=TRUE----------------
knitr::opts_chunk$set(
        message = F,
        error = F,
        warning = F,
        comment = NA,
        highlight = T,
        prompt = T
        )

if (!require("tidyverse")) 
        {install.packages("tidyverse", repos = 'http://cran.wu.ac.at/')
        library(tidyverse)}
if (!require("reshape2"))
        {install.packages("reshape2", repos = 'http://cran.wu.ac.at/')
        library(reshape2)}
if (!require("readxl"))
        {install.packages("readxl", repos = 'http://cran.wu.ac.at/')
        library(readxl)}
if (!require("pander"))
        {install.packages("pander", repos = 'http://cran.wu.ac.at/')
        library(pander)}

# install packages for writing Excel file (xlsx-format)
if (!require("xlsx")) 
        {install.packages("xlsx", repos = 'http://cran.wu.ac.at/')
        library(xlsx)}
if (!require("rJava"))
        {install.packages("rJava", repos = 'http://cran.wu.ac.at/')
        library(rJava)}
if (!require("xlsxjars"))
        {install.packages("xlsxjars", repos = 'http://cran.wu.ac.at/')
        library(xlsxjars)}



## ----combine-all-data-sets-----------------------------------------------


tirol1 <- readRDS("../daten/tirol.1.rds")
tirol2 <- readRDS("../daten/tirol.2.rds")
tirol3 <- readRDS("../daten/tirol.3.rds")
tirol4 <- readRDS("../daten/tirol.4.rds")
tirol5 <- readRDS("../daten/tirol.5.rds")
tirol0 <- do.call("cbind", list(tirol1, tirol2, tirol3, tirol4, tirol5))
tirol0 <- as_tibble(tirol0)
saveRDS(tirol0, file = "../daten/tirol0.rds")

write.xlsx(x = tirol0, file = "../daten/tirol0.xlsx",
           sheetName = "Umfrage", col.names = TRUE, showNA = TRUE)
      

## ----kommentare-beseitigen-und-abspeichern-------------------------------

tirol.notes <- select(tirol0, starts_with("note."))
tirol <- select(tirol0, -starts_with("note."))
write.xlsx(x = tirol, file = "../daten/audiemus.xlsx", 
           sheetName = "Umfrage-Codes", col.names = TRUE, showNA = TRUE, append = FALSE) 
write.xlsx(x = tirol.notes, file = "../daten/audiemus.xlsx", 
           sheetName = "Kommentare", col.names = TRUE, showNA = TRUE, append = TRUE) 
saveRDS(tirol, file = "../daten/umfrage.rds" )
saveRDS(tirol.notes, file = "../daten/kommentare.rds" )

## ----save-data-----------------------------------------------------------
audiemus <- tirol

saveRDS(audiemus, file = "../daten/audiemus.rds")

write.xlsx(x = audiemus, file = "../daten/audiemus.xlsx",
           sheetName = "Umfrage-Factors", col.names = TRUE, showNA = TRUE, append = TRUE)
      

