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

umfrage.5 <- read_excel(
        "../daten/umfrage-tirol-36tn.xlsx",
        sheet = 5,
        col_names = TRUE,
        col_types = NULL,
        na = "",
        skip = 0
        )
saveRDS(umfrage.5, file = "../daten/umfrage-tirol.5.rds")


## ----vertausche-reihen-und-spalten---------------------------------------
tirol.5 <- as_tibble(t(umfrage.5))

## ----auspraegungen-in-variable-ueberfuehren------------------------------

# medien.deutsch = FRAGE 1
tirol.5$V1[tirol.5$V2 == "x"] <- "A"
tirol.5$V1[tirol.5$V3 == "x"] <- "D"
tirol.5$V1[tirol.5$V4 == "x"] <- "B"
tirol.5$V1[tirol.5$V5 == "x"] <- "C"
names(tirol.5)[names(tirol.5) == 'V1'] <- 'medien.deutsch'




# a steht für audiemus

# a.eingesetzt = FRAGE 4
tirol.5$V6[tirol.5$V7 == "x"] <- "A"
tirol.5$V6[tirol.5$V8 == "x"] <- "B"
names(tirol.5)[names(tirol.5) == 'V6'] <- 'a.eingesetzt'

########

# FRAGEN-BATTERIE 5:  Warum nicht eingesetzt?
# a steht für audiemus


# a.keine.zeit
tirol.5$V9[tirol.5$V11 == "x"] <- "A"
tirol.5$V9[tirol.5$V12 == "x"] <- "B"
tirol.5$V9[tirol.5$V13 == "x"] <- "C"
tirol.5$V9[tirol.5$V14 == "x"] <- "D"
tirol.5$V9[tirol.5$V15 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V9'] <- 'a.keine.zeit'



# a.kein.interesse
tirol.5$V16[tirol.5$V17 == "x"] <- "A"
tirol.5$V16[tirol.5$V18 == "x"] <- "B"
tirol.5$V16[tirol.5$V19 == "x"] <- "C"
tirol.5$V16[tirol.5$V20 == "x"] <- "D"
tirol.5$V16[tirol.5$V21 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V16'] <- 'a.kein.interesse'



# a.keine.technik
tirol.5$V22[tirol.5$V23 == "x"] <- "A"
tirol.5$V22[tirol.5$V24 == "x"] <- "B"
tirol.5$V22[tirol.5$V25 == "x"] <- "C"
tirol.5$V22[tirol.5$V26 == "x"] <- "D"
tirol.5$V22[tirol.5$V27 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V22'] <- 'a.keine.technik'


# a.keine.kompetenz
tirol.5$V28[tirol.5$V29 == "x"] <- "A"
tirol.5$V28[tirol.5$V30 == "x"] <- "B"
tirol.5$V28[tirol.5$V31 == "x"] <- "C"
tirol.5$V28[tirol.5$V32 == "x"] <- "D"
tirol.5$V28[tirol.5$V33 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V28'] <- 'a.keine.kompetenz'


# a.zu.kompliziert
tirol.5$V34[tirol.5$V35 == "x"] <- "A"
tirol.5$V34[tirol.5$V36 == "x"] <- "B"
tirol.5$V34[tirol.5$V37 == "x"] <- "C"
tirol.5$V34[tirol.5$V38 == "x"] <- "D"
tirol.5$V34[tirol.5$V39 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V34'] <- 'a.zu.kompliziert'


###########

### FRAGEN-BATTERIE 6: Erfahrungen des Einsatzes
# e steht für audiemus-Erfahrung

# e.technik.ok
tirol.5$V43[tirol.5$V44 == "x"] <- "A"
tirol.5$V43[tirol.5$V45 == "x"] <- "B"
tirol.5$V43[tirol.5$V46 == "x"] <- "C"
tirol.5$V43[tirol.5$V47 == "x"] <- "D"
tirol.5$V43[tirol.5$V48 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V43'] <- 'e.technik.ok'



# e.usability
tirol.5$V50[tirol.5$V51 == "x"] <- "A"
tirol.5$V50[tirol.5$V52 == "x"] <- "B"
tirol.5$V50[tirol.5$V53 == "x"] <- "C"
tirol.5$V50[tirol.5$V54 == "x"] <- "D"
tirol.5$V50[tirol.5$V55 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V50'] <- 'e.usability'


# e.zielgruppe
tirol.5$V57[tirol.5$V58 == "x"] <- "A"
tirol.5$V57[tirol.5$V59 == "x"] <- "B"
tirol.5$V57[tirol.5$V60 == "x"] <- "C"
tirol.5$V57[tirol.5$V61 == "x"] <- "D"
tirol.5$V57[tirol.5$V62 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V57'] <- 'e.zielgruppe'


# e.relevant
tirol.5$V64[tirol.5$V65 == "x"] <- "A"
tirol.5$V64[tirol.5$V66 == "x"] <- "B"
tirol.5$V64[tirol.5$V67 == "x"] <- "C"
tirol.5$V64[tirol.5$V68 == "x"] <- "D"
tirol.5$V64[tirol.5$V69 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V64'] <- 'e.relevant'


# e.motivierend
tirol.5$V71[tirol.5$V72 == "x"] <- "A"
tirol.5$V71[tirol.5$V73 == "x"] <- "B"
tirol.5$V71[tirol.5$V74 == "x"] <- "C"
tirol.5$V71[tirol.5$V75 == "x"] <- "D"
tirol.5$V71[tirol.5$V76 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V71'] <- 'e.motivierend'



# e.zusatz
tirol.5$V78[tirol.5$V79 == "x"] <- "A"
tirol.5$V78[tirol.5$V80 == "x"] <- "B"
tirol.5$V78[tirol.5$V81 == "x"] <- "C"
tirol.5$V78[tirol.5$V82 == "x"] <- "D"
tirol.5$V78[tirol.5$V83 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V78'] <- 'e.zusatz'


# e.test
tirol.5$V85[tirol.5$V86 == "x"] <- "A"
tirol.5$V85[tirol.5$V87 == "x"] <- "B"
tirol.5$V85[tirol.5$V88 == "x"] <- "C"
tirol.5$V85[tirol.5$V89 == "x"] <- "D"
tirol.5$V85[tirol.5$V90 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V85'] <- 'e.test'


# e.praktikabel
tirol.5$V92[tirol.5$V93 == "x"] <- "A"
tirol.5$V92[tirol.5$V94 == "x"] <- "B"
tirol.5$V92[tirol.5$V95 == "x"] <- "C"
tirol.5$V92[tirol.5$V96 == "x"] <- "D"
tirol.5$V92[tirol.5$V97 == "x"] <- "E"
names(tirol.5)[names(tirol.5) == 'V92'] <- 'e.praktikabel'


# Kommentarspalten umbenennen:

names(tirol.5)[names(tirol.5) == 'V40'] <- 'note.audiemus'

names(tirol.5)[names(tirol.5) == 'V49'] <- 'note.technik.ok'

names(tirol.5)[names(tirol.5) == 'V70'] <- 'note.relevant'

names(tirol.5)[names(tirol.5) == 'V91'] <- 'note.test'

names(tirol.5)[names(tirol.5) == 'V98'] <- 'note.praktikabel'


## ----loesche-ueberfluessige-spalten--------------------------------------


tirol.5[c(2:5, 7:8, 10:15, 17:21, 23:27, 29:33, 35:39, 41:42, 44:48,
          51:56, 58:63, 65:69, 72:77, 79:84, 86:90, 93:97)] <- list(NULL)

tirol.5 <- slice(tirol.5, 3:n())

## ----speichere-bereinigte-datei-unter-neuen-namen------------------------
saveRDS(tirol.5, file = "../daten/tirol.5.rds")

