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
<<<<<<< HEAD
if (!require("forcats"))
        {install.packages("forcats", repos = 'http://cran.wu.ac.at/')
        library(forcats)}
=======
>>>>>>> 197d6e53b5af75583f9610134386d3953fe7d9a2



## ----load-first-sheet-of-excel-file-into-r-memory------------------------

umfrage.4 <- read_excel(
        "../daten/umfrage-tirol-36tn.xlsx",
        sheet = 4,
        col_names = TRUE,
        col_types = NULL,
        na = "",
        skip = 0
        )
saveRDS(umfrage.4, file = "../daten/umfrage-tirol.4.rds")


## ----vertausche-reihen-und-spalten---------------------------------------
tirol.4 <- as_tibble(t(umfrage.4))

## ----auspraegungen-in-variable-ueberfuehren------------------------------

# i.fach
<<<<<<< HEAD
tirol.4$V2[tirol.4$V3 == "x"] <- 1
tirol.4$V2[tirol.4$V4 == "x"] <- 2
tirol.4$V2[tirol.4$V5 == "x"] <- 3
tirol.4$V2[tirol.4$V6 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V2'] <- 'i.fach'
tirol.4$i.fach <- factor(as.factor(tirol.4$i.fach), 
        levels = c(1, 2, 3), 
        labels = c("sehr interessiert", "interessiert", "nicht interessiert"),
        ordered = TRUE)


# i.allgemein
tirol.4$V7[tirol.4$V8 == "x"] <- 1
tirol.4$V7[tirol.4$V9 == "x"] <- 2
tirol.4$V7[tirol.4$V10 == "x"] <- 3
tirol.4$V7[tirol.4$V11 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V7'] <- 'i.allgemein'
tirol.4$i.allgemein <- factor(as.factor(tirol.4$i.allgemein), 
        levels = c(1, 2, 3), 
        labels = c("sehr interessiert", "interessiert", "nicht interessiert"),
        ordered = TRUE)


# i.schueler
tirol.4$V12[tirol.4$V13 == "x"] <- 1
tirol.4$V12[tirol.4$V14 == "x"] <- 2
tirol.4$V12[tirol.4$V15 == "x"] <- 3
tirol.4$V12[tirol.4$V16 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V12'] <- 'i.schueler'
tirol.4$i.schueler <- factor(as.factor(tirol.4$i.schueler), 
        levels = c(1, 2, 3), 
        labels = c("sehr interessiert", "interessiert", "nicht interessiert"),
        ordered = TRUE)

# i.planung
tirol.4$V17[tirol.4$V18 == "x"] <- 1
tirol.4$V17[tirol.4$V19 == "x"] <- 2
tirol.4$V17[tirol.4$V20 == "x"] <- 3
tirol.4$V17[tirol.4$V21 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V17'] <- 'i.planung'
tirol.4$i.planung <- factor(as.factor(tirol.4$i.planung), 
        levels = c(1, 2, 3), 
        labels = c("sehr interessiert", "interessiert", "nicht interessiert"),
        ordered = TRUE)


# i.handy
tirol.4$V22[tirol.4$V23 == "x"] <- 1
tirol.4$V22[tirol.4$V24 == "x"] <- 2
tirol.4$V22[tirol.4$V25 == "x"] <- 3
tirol.4$V22[tirol.4$V26 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V22'] <- 'i.handy'
tirol.4$i.handy <- factor(as.factor(tirol.4$i.handy), 
        levels = c(1, 2, 3), 
        labels = c("sehr interessiert", "interessiert", "nicht interessiert"),
        ordered = TRUE)

# i.fortbildung
tirol.4$V27[tirol.4$V28 == "x"] <- 1
tirol.4$V27[tirol.4$V29 == "x"] <- 2
tirol.4$V27[tirol.4$V30 == "x"] <- 3
tirol.4$V27[tirol.4$V31 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V27'] <- 'i.fortbildung'
tirol.4$i.fortbildung <- factor(as.factor(tirol.4$i.fortbildung), 
        levels = c(1, 2, 3), 
        labels = c("sehr interessiert", "interessiert", "nicht interessiert"),
        ordered = TRUE)
=======
tirol.4$V2[tirol.4$V3 == "x"] <- "A"
tirol.4$V2[tirol.4$V4 == "x"] <- "B"
tirol.4$V2[tirol.4$V5 == "x"] <- "C"
tirol.4$V2[tirol.4$V6 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V2'] <- 'i.fach'


# i.allgemein
tirol.4$V7[tirol.4$V8 == "x"] <- "A"
tirol.4$V7[tirol.4$V9 == "x"] <- "B"
tirol.4$V7[tirol.4$V10 == "x"] <- "C"
tirol.4$V7[tirol.4$V11 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V7'] <- 'i.allgemein'


# i.schueler
tirol.4$V12[tirol.4$V13 == "x"] <- "A"
tirol.4$V12[tirol.4$V14 == "x"] <- "B"
tirol.4$V12[tirol.4$V15 == "x"] <- "C"
tirol.4$V12[tirol.4$V16 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V12'] <- 'i.schueler'

# i.planung
tirol.4$V17[tirol.4$V18 == "x"] <- "A"
tirol.4$V17[tirol.4$V19 == "x"] <- "B"
tirol.4$V17[tirol.4$V20 == "x"] <- "C"
tirol.4$V17[tirol.4$V21 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V17'] <- 'i.planung'


# i.handy
tirol.4$V22[tirol.4$V23 == "x"] <- "A"
tirol.4$V22[tirol.4$V24 == "x"] <- "B"
tirol.4$V22[tirol.4$V25 == "x"] <- "C"
tirol.4$V22[tirol.4$V26 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V22'] <- 'i.handy'

# i.fortbildung
tirol.4$V27[tirol.4$V28 == "x"] <- "A"
tirol.4$V27[tirol.4$V29 == "x"] <- "B"
tirol.4$V27[tirol.4$V30 == "x"] <- "C"
tirol.4$V27[tirol.4$V31 == "x"] <- NA
names(tirol.4)[names(tirol.4) == 'V27'] <- 'i.fortbildung'
>>>>>>> 197d6e53b5af75583f9610134386d3953fe7d9a2


# sonstiges
names(tirol.4)[names(tirol.4) == 'V32'] <- 'note.interesse'
names(tirol.4)[names(tirol.4) == 'V33'] <- 'note.sonstiges'



## ----loesche-ueberfluessige-spalten--------------------------------------


tirol.4[c(1, 3:6, 8:11, 13:16, 18:21, 23:26, 28:31, 34)] <- list(NULL)

tirol.4 <- slice(tirol.4, 3:n())

## ----speichere-bereinigte-datei-unter-neuen-namen------------------------
saveRDS(tirol.4, file = "../daten/tirol.4.rds")

