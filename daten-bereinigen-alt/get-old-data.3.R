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

umfrage.3 <- read_excel(
        "../daten/umfrage-tirol-36tn.xlsx",
        sheet = 3,
        col_names = TRUE,
        col_types = NULL,
        na = "",
        skip = 0
        )
saveRDS(umfrage.3, file = "../daten/umfrage-tirol.3.rds")


## ----vertausche-reihen-und-spalten---------------------------------------
tirol.3 <- as_tibble(t(umfrage.3))

## ----auspraegungen-in-variable-ueberfuehren------------------------------

# w.ausstattung
tirol.3$V2[tirol.3$V3 == "x"] <- "A"
tirol.3$V2[tirol.3$V4 == "x"] <- "B"
tirol.3$V2[tirol.3$V5 == "x"] <- "C"
tirol.3$V2[tirol.3$V6 == "x"] <- "D"
tirol.3$V2[tirol.3$V7 == "x"] <- "E"
tirol.3$V2[tirol.3$V8 == "x"] <- NA

# w.raumwechsel
tirol.3$V10[tirol.3$V11 == "x"] <- "A"
tirol.3$V10[tirol.3$V12 == "x"] <- "B"
tirol.3$V10[tirol.3$V13 == "x"] <- "C"
tirol.3$V10[tirol.3$V14 == "x"] <- "D"
tirol.3$V10[tirol.3$V15 == "x"] <- "E"
tirol.3$V10[tirol.3$V16 == "x"] <- NA


# w.curricula
tirol.3$V18[tirol.3$V19 == "x"] <- "A"
tirol.3$V18[tirol.3$V20 == "x"] <- "B"
tirol.3$V18[tirol.3$V21 == "x"] <- "C"
tirol.3$V18[tirol.3$V22 == "x"] <- "D"
tirol.3$V18[tirol.3$V23 == "x"] <- "E"
tirol.3$V18[tirol.3$V24 == "x"] <- NA


# w.kooperation
tirol.3$V25[tirol.3$V26 == "x"] <- "A"
tirol.3$V25[tirol.3$V27 == "x"] <- "B"
tirol.3$V25[tirol.3$V28 == "x"] <- "C"
tirol.3$V25[tirol.3$V29 == "x"] <- "D"
tirol.3$V25[tirol.3$V30 == "x"] <- "E"
tirol.3$V25[tirol.3$V31 == "x"] <- NA


# w.mehrwert
tirol.3$V32[tirol.3$V33 == "x"] <- "A"
tirol.3$V32[tirol.3$V34 == "x"] <- "B"
tirol.3$V32[tirol.3$V35 == "x"] <- "C"
tirol.3$V32[tirol.3$V36 == "x"] <- "D"
tirol.3$V32[tirol.3$V37 == "x"] <- "E"
tirol.3$V32[tirol.3$V38 == "x"] <- NA


# w.support
tirol.3$V39[tirol.3$V40 == "x"] <- "A"
tirol.3$V39[tirol.3$V41 == "x"] <- "B"
tirol.3$V39[tirol.3$V42 == "x"] <- "C"
tirol.3$V39[tirol.3$V43 == "x"] <- "D"
tirol.3$V39[tirol.3$V44 == "x"] <- "E"
tirol.3$V39[tirol.3$V45 == "x"] <- NA


# w.fachbildung
tirol.3$V46[tirol.3$V47 == "x"] <- "A"
tirol.3$V46[tirol.3$V48 == "x"] <- "B"
tirol.3$V46[tirol.3$V49 == "x"] <- "C"
tirol.3$V46[tirol.3$V50 == "x"] <- "D"
tirol.3$V46[tirol.3$V51 == "x"] <- "E"
tirol.3$V46[tirol.3$V52 == "x"] <- NA


# w.did.bildung
tirol.3$V54[tirol.3$V55 == "x"] <- "A"
tirol.3$V54[tirol.3$V56 == "x"] <- "B"
tirol.3$V54[tirol.3$V57 == "x"] <- "C"
tirol.3$V54[tirol.3$V58 == "x"] <- "D"
tirol.3$V54[tirol.3$V59 == "x"] <- "E"
tirol.3$V54[tirol.3$V60 == "x"] <- NA


# w.oer
tirol.3$V62[tirol.3$V63 == "x"] <- "A"
tirol.3$V62[tirol.3$V64 == "x"] <- "B"
tirol.3$V62[tirol.3$V65 == "x"] <- "C"
tirol.3$V62[tirol.3$V66 == "x"] <- "D"
tirol.3$V62[tirol.3$V67 == "x"] <- "E"
tirol.3$V62[tirol.3$V68 == "x"] <- NA


# w.plattform
tirol.3$V69[tirol.3$V70 == "x"] <- "A"
tirol.3$V69[tirol.3$V71 == "x"] <- "B"
tirol.3$V69[tirol.3$V72 == "x"] <- "C"
tirol.3$V69[tirol.3$V73 == "x"] <- "D"
tirol.3$V69[tirol.3$V74 == "x"] <- "E"
tirol.3$V69[tirol.3$V75 == "x"] <- NA


# w.zeit
tirol.3$V76[tirol.3$V77 == "x"] <- "A"
tirol.3$V76[tirol.3$V78 == "x"] <- "B"
tirol.3$V76[tirol.3$V79 == "x"] <- "C"
tirol.3$V76[tirol.3$V80 == "x"] <- "D"
tirol.3$V76[tirol.3$V81 == "x"] <- "E"
tirol.3$V76[tirol.3$V82 == "x"] <- NA

# w.anerkennung
tirol.3$V84[tirol.3$V85 == "x"] <- "A"
tirol.3$V84[tirol.3$V86 == "x"] <- "B"
tirol.3$V84[tirol.3$V87 == "x"] <- "C"
tirol.3$V84[tirol.3$V88 == "x"] <- "D"
tirol.3$V84[tirol.3$V89 == "x"] <- "E"
tirol.3$V84[tirol.3$V90 == "x"] <- NA


# w.informatik
tirol.3$V91[tirol.3$V92 == "x"] <- "A"
tirol.3$V91[tirol.3$V93 == "x"] <- "B"
tirol.3$V91[tirol.3$V94 == "x"] <- "C"
tirol.3$V91[tirol.3$V95 == "x"] <- "D"
tirol.3$V91[tirol.3$V96 == "x"] <- "E"
tirol.3$V91[tirol.3$V97 == "x"] <- NA


# w.med.kompetenz
tirol.3$V98[tirol.3$V99 == "x"] <- "A"
tirol.3$V98[tirol.3$V100 == "x"] <- "B"
tirol.3$V98[tirol.3$V101 == "x"] <- "C"
tirol.3$V98[tirol.3$V103 == "x"] <- "D"
tirol.3$V98[tirol.3$V104 == "x"] <- "E"


# w.digi.buch
tirol.3$V105[tirol.3$V106 == "x"] <- "A"
tirol.3$V105[tirol.3$V107 == "x"] <- "B"
tirol.3$V105[tirol.3$V108 == "x"] <- "C"
tirol.3$V105[tirol.3$V108 == "x"] <- "D"
tirol.3$V105[tirol.3$V110 == "x"] <- "E"
tirol.3$V105[tirol.3$V111 == "x"] <- NA



## ----spalten-umbenennen--------------------------------------------------


names(tirol.3)[names(tirol.3) == 'V2'] <- 'w.ausstattung'

names(tirol.3)[names(tirol.3) == 'V10'] <- 'w.raumwechsel'

names(tirol.3)[names(tirol.3) == 'V18'] <- 'w.curricula'

names(tirol.3)[names(tirol.3) == 'V25'] <- 'w.kooperation'

names(tirol.3)[names(tirol.3) == 'V32'] <- 'w.mehrwert'

names(tirol.3)[names(tirol.3) == 'V39'] <- 'w.support'

names(tirol.3)[names(tirol.3) == 'V46'] <- 'w.fachbildung'

names(tirol.3)[names(tirol.3) == 'V54'] <- 'w.did.bildung'

names(tirol.3)[names(tirol.3) == 'V62'] <- 'w.oer'

names(tirol.3)[names(tirol.3) == 'V69'] <- 'w.plattform'

names(tirol.3)[names(tirol.3) == 'V76'] <- 'w.zeit'

names(tirol.3)[names(tirol.3) == 'V84'] <- 'w.anerkennung'

names(tirol.3)[names(tirol.3) == 'V91'] <- 'w.informatik'

names(tirol.3)[names(tirol.3) == 'V98'] <- 'w.med.kompetenz'

names(tirol.3)[names(tirol.3) == 'V105'] <- 'w.digi.buch'

# Kommentarspalten umbenannt

names(tirol.3)[names(tirol.3) == 'V9'] <-   'note.ausstattung'
names(tirol.3)[names(tirol.3) == 'V17'] <-  'note.wechsel'
names(tirol.3)[names(tirol.3) == 'V53'] <-  'note.fachbildung'
names(tirol.3)[names(tirol.3) == 'V61'] <-  'note.did.bildung'
names(tirol.3)[names(tirol.3) == 'V83'] <-  'note.zeit'
names(tirol.3)[names(tirol.3) == 'V112'] <- 'note.digi.buch'


## ----loesche-ueberfluessige-spalten--------------------------------------


tirol.3[c(1, 3:8, 11:16, 19:24, 26:31, 33:38, 40:45,
          47:52, 55:60, 63:68, 70:75, 77:82, 85:90, 92:97, 99:104, 106:111)] <- list(NULL)

tirol.3 <- slice(tirol.3, 3:n())

## ----speichere-bereinigte-datei-unter-neuen-namen------------------------
saveRDS(tirol.3, file = "../daten/tirol.3.rds")

