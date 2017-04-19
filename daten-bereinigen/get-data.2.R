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



## ----load-first-sheet-of-excel-file-into-r-memory------------------------

umfrage.2 <- read_excel(
        "../daten/umfrage-tirol-36tn.xlsx",
        sheet = 2,
        col_names = TRUE,
        col_types = NULL,
        na = "",
        skip = 0
        )
saveRDS(umfrage.2, file = "../daten/umfrage-tirol.2.rds")


## ------------------------------------------------------------------------
tirol.2 <- as_tibble(t(umfrage.2))

## ----auspraegungen-in-variable-ueberfuehren------------------------------

# k.computer
tirol.2$V1[tirol.2$V2 == "x"] <- "A"
tirol.2$V1[tirol.2$V3 == "x"] <- "B"
tirol.2$V1[tirol.2$V4 == "x"] <- "C"
tirol.2$V1[tirol.2$V5 == "x"] <- "D"
tirol.2$V1[tirol.2$V6 == "x"] <- "E"
names(tirol.2)[names(tirol.2) == 'V1'] <- 'k.computer'


# k.didaktik
tirol.2$V7[tirol.2$V8 == "x"] <- "A"
tirol.2$V7[tirol.2$V9 == "x"] <- "B"
tirol.2$V7[tirol.2$V10 == "x"] <- "C"
tirol.2$V7[tirol.2$V11 == "x"] <- "D"
tirol.2$V7[tirol.2$V12 == "x"] <- "E"
names(tirol.2)[names(tirol.2) == 'V7'] <- 'k.didaktik'


# k.motivation
tirol.2$V13[tirol.2$V14 == "x"] <- "A"
tirol.2$V13[tirol.2$V15 == "x"] <- "B"
tirol.2$V13[tirol.2$V16 == "x"] <- "C"
tirol.2$V13[tirol.2$V17 == "x"] <- "D"
tirol.2$V13[tirol.2$V18 == "x"] <- "E"
names(tirol.2)[names(tirol.2) == 'V13'] <- 'k.motivation'


# k.schueler
tirol.2$V19[tirol.2$V20 == "x"] <- "A"
tirol.2$V19[tirol.2$V21 == "x"] <- "B"
tirol.2$V19[tirol.2$V22 == "x"] <- "C"
tirol.2$V19[tirol.2$V23 == "x"] <- "D"
tirol.2$V19[tirol.2$V24 == "x"] <- "E"
names(tirol.2)[names(tirol.2) == 'V19'] <- 'k.schueler'


# k.schule
tirol.2$V25[tirol.2$V26 == "x"] <- "A"
tirol.2$V25[tirol.2$V27 == "x"] <- "B"
tirol.2$V25[tirol.2$V28 == "x"] <- "C"
tirol.2$V25[tirol.2$V29 == "x"] <- "D"
tirol.2$V25[tirol.2$V30 == "x"] <- "E"
names(tirol.2)[names(tirol.2) == 'V25'] <- 'k.schule'


# k.it.betreuung
tirol.2$V31[tirol.2$V32 == "x"] <- "A"
tirol.2$V31[tirol.2$V33 == "x"] <- "B"
tirol.2$V31[tirol.2$V34 == "x"] <- "C"
tirol.2$V31[tirol.2$V35 == "x"] <- "D"
tirol.2$V31[tirol.2$V36 == "x"] <- "E"
names(tirol.2)[names(tirol.2) == 'V31'] <- 'k.it.betreuung'


## ----loesche-ueberfluessige-spalten--------------------------------------

tirol.2 <- slice(tirol.2, 3:n())
tirol.2[c(2:6, 8:12, 14:18, 20:24, 26:30, 32:37)] <- list(NULL)

## ----speichere-bereinigte-datei-unter-neuen-namen------------------------
saveRDS(tirol.2, file = "../daten/tirol.2.rds")

