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
if (!require("forcats"))
        {install.packages("forcats", repos = 'http://cran.wu.ac.at/')
        library(forcats)}



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
umfrage.t.5 <- as_tibble(t(umfrage.5)) # um Namen der Variablen nachzusehen

## ----auspraegungen-in-variable-ueberfuehren------------------------------

# medien.deutsch = FRAGE 1
# Achtung: Hier auf die Reihefolge achten: 
# Ja, nein, manchmal, fast nie -> ja, manchmal, fast nie, nein
tirol.5$V2[tirol.5$V2 == "x"] <- 1 # ja
tirol.5$V2[tirol.5$V3 == "x"] <- 4 # nein
tirol.5$V2[tirol.5$V4 == "x"] <- 2 # manchmal
tirol.5$V2[tirol.5$V5 == "x"] <- 3 # fast nie
names(tirol.5)[names(tirol.5) == 'V2'] <- 'medien.deutsch'
tirol.5$medien.deutsch <- factor(as.factor(tirol.5$medien.deutsch),
        levels = c(1, 2, 3, 4),
        labels = c("ja", "manchmal", "fast nie", "nein"),
        ordered = TRUE)


# a steht für audiemus

# a.eingesetzt = FRAGE 4
tirol.5$V6[tirol.5$V7 == "x"] <- 1
tirol.5$V6[tirol.5$V8 == "x"] <- 2
names(tirol.5)[names(tirol.5) == 'V6'] <- 'a.eingesetzt'
tirol.5$a.eingesetzt <- factor(as.factor(tirol.5$a.eingesetzt), 
        levels = c(1, 2), 
        labels = c("ja", "nein"))

########

# FRAGEN-BATTERIE 5:  Warum nicht eingesetzt?
# a steht für audiemus


# a.keine.zeit
tirol.5$V10[tirol.5$V11 == "x"] <- 1
names(tirol.5)[names(tirol.5) == 'V10'] <- 'a.keine.zeit'
tirol.5$a.keine.zeit <- factor(as.factor(tirol.5$a.keine.zeit), 
        levels = c(2, 1, 0), 
        labels = c("nutze audiemus", "trifft zu", "trifft nicht zu"))
tirol.5$a.keine.zeit[tirol.5$a.eingesetzt == "ja"] <- "nutze audiemus"



# a.kein.interesse
tirol.5$V16[tirol.5$V17 == "x"] <- 1
names(tirol.5)[names(tirol.5) == 'V16'] <- 'a.kein.interesse'
tirol.5$a.kein.interesse <- factor(as.factor(tirol.5$a.kein.interesse), 
        levels = c(2, 1, 0), 
        labels = c("nutze audiemus", "trifft zu", "trifft nicht zu"))
tirol.5$a.kein.interesse[tirol.5$a.eingesetzt == "ja"] <- "nutze audiemus"



# a.keine.technik
tirol.5$V22[tirol.5$V23 == "x"] <- 1
names(tirol.5)[names(tirol.5) == 'V22'] <- 'a.keine.technik'
tirol.5$a.keine.technik <- factor(as.factor(tirol.5$a.keine.technik), 
        levels = c(2, 1, 0), 
        labels = c("nutze audiemus", "trifft zu", "trifft nicht zu"))
tirol.5$a.keine.technik[tirol.5$a.eingesetzt == "ja"] <- "nutze audiemus"


# a.keine.kompetenz
tirol.5$V28[tirol.5$V29 == "x"] <- 1
names(tirol.5)[names(tirol.5) == 'V28'] <- 'a.keine.kompetenz'
tirol.5$a.keine.kompetenz <- factor(as.factor(tirol.5$a.keine.kompetenz), 
        levels = c(2, 1, 0), 
        labels = c("nutze audiemus", "trifft zu", "trifft nicht zu"))
tirol.5$a.keine.kompetenz[tirol.5$a.eingesetzt == "ja"] <- "nutze audiemus"


# a.zu.kompliziert
tirol.5$V34[tirol.5$V35 == "x"] <- 1
names(tirol.5)[names(tirol.5) == 'V34'] <- 'a.zu.kompliziert'
tirol.5$a.zu.kompliziert <- factor(as.factor(tirol.5$a.zu.kompliziert), 
        levels = c(2, 1, 0), 
        labels = c("nutze audiemus", "trifft zu", "trifft nicht zu"))
tirol.5$a.zu.kompliziert[tirol.5$a.eingesetzt == "ja"] <- "nutze audiemus"

# a.unbekannt (nachträglich kodiert!!)
tirol.5$V99[tirol.5$V99 == "x"] <- 1
names(tirol.5)[names(tirol.5) == 'V99'] <- 'a.unbekannt'
tirol.5$a.unbekannt <- factor(as.factor(tirol.5$a.unbekannt), 
        levels = c(2, 1, 0), 
        labels = c("nutze audiemus", "trifft zu", "trifft nicht zu"))
tirol.5$a.unbekannt[tirol.5$a.eingesetzt == "ja"] <- "nutze audiemus"

###########

### FRAGEN-BATTERIE 6: Erfahrungen des Einsatzes
# e steht für audiemus-Erfahrung

# e.technik.ok
tirol.5$V43[tirol.5$V44 == "x"] <- 1
tirol.5$V43[tirol.5$V45 == "x"] <- 2
tirol.5$V43[tirol.5$V46 == "x"] <- 3
tirol.5$V43[tirol.5$V47 == "x"] <- 4
tirol.5$V43[tirol.5$V48 == "x"] <- 5
names(tirol.5)[names(tirol.5) == 'V43'] <- 'e.technik.ok'
tirol.5$e.technik.ok <- factor(as.factor(tirol.5$e.technik.ok), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("trifft voll zu", "trifft weitgehend zu", 
                   "trifft überwiegend zu", "triff eher nicht zu", "trifft gar nicht zu"),
        ordered = TRUE)



# e.usability
tirol.5$V50[tirol.5$V51 == "x"] <- 1
tirol.5$V50[tirol.5$V52 == "x"] <- 2
tirol.5$V50[tirol.5$V53 == "x"] <- 3
tirol.5$V50[tirol.5$V54 == "x"] <- 4
tirol.5$V50[tirol.5$V55 == "x"] <- 5
names(tirol.5)[names(tirol.5) == 'V50'] <- 'e.usability'
tirol.5$e.usability <- factor(as.factor(tirol.5$e.usability), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("trifft voll zu", "trifft weitgehend zu", 
                   "trifft überwiegend zu", "triff eher nicht zu", "trifft gar nicht zu"),
        ordered = TRUE)


# e.zielgruppe
tirol.5$V57[tirol.5$V58 == "x"] <- 1
tirol.5$V57[tirol.5$V59 == "x"] <- 2
tirol.5$V57[tirol.5$V60 == "x"] <- 3
tirol.5$V57[tirol.5$V61 == "x"] <- 4
tirol.5$V57[tirol.5$V62 == "x"] <- 5
names(tirol.5)[names(tirol.5) == 'V57'] <- 'e.zielgruppe'
tirol.5$e.zielgruppe <- factor(as.factor(tirol.5$e.zielgruppe), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("trifft voll zu", "trifft weitgehend zu", 
                   "trifft überwiegend zu", "triff eher nicht zu", "trifft gar nicht zu"),
        ordered = TRUE)


# e.relevant
tirol.5$V64[tirol.5$V65 == "x"] <- 1
tirol.5$V64[tirol.5$V66 == "x"] <- 2
tirol.5$V64[tirol.5$V67 == "x"] <- 3
tirol.5$V64[tirol.5$V68 == "x"] <- 4
tirol.5$V64[tirol.5$V69 == "x"] <- 5
names(tirol.5)[names(tirol.5) == 'V64'] <- 'e.relevant'
tirol.5$e.relevant <- factor(as.factor(tirol.5$e.relevant), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("trifft voll zu", "trifft weitgehend zu", 
                   "trifft überwiegend zu", "triff eher nicht zu", "trifft gar nicht zu"),
        ordered = TRUE)


# e.motivierend
tirol.5$V71[tirol.5$V72 == "x"] <- 1
tirol.5$V71[tirol.5$V73 == "x"] <- 2
tirol.5$V71[tirol.5$V74 == "x"] <- 3
tirol.5$V71[tirol.5$V75 == "x"] <- 4
tirol.5$V71[tirol.5$V76 == "x"] <- 5
names(tirol.5)[names(tirol.5) == 'V71'] <- 'e.motivierend'
tirol.5$e.motivierend <- factor(as.factor(tirol.5$e.motivierend), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("trifft voll zu", "trifft weitgehend zu", 
                   "trifft überwiegend zu", "triff eher nicht zu", "trifft gar nicht zu"),
        ordered = TRUE)



# e.zusatzmaterial
tirol.5$V78[tirol.5$V79 == "x"] <- 1
tirol.5$V78[tirol.5$V80 == "x"] <- 2
tirol.5$V78[tirol.5$V81 == "x"] <- 3
tirol.5$V78[tirol.5$V82 == "x"] <- 4
tirol.5$V78[tirol.5$V83 == "x"] <- 5
names(tirol.5)[names(tirol.5) == 'V78'] <- 'e.zusatzmaterial'
tirol.5$e.zusatzmaterial <- factor(as.factor(tirol.5$e.zusatzmaterial), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("trifft voll zu", "trifft weitgehend zu", 
                   "trifft überwiegend zu", "triff eher nicht zu", "trifft gar nicht zu"),
        ordered = TRUE)


# e.testmodus
tirol.5$V85[tirol.5$V86 == "x"] <- 1
tirol.5$V85[tirol.5$V87 == "x"] <- 2
tirol.5$V85[tirol.5$V88 == "x"] <- 3
tirol.5$V85[tirol.5$V89 == "x"] <- 4
tirol.5$V85[tirol.5$V90 == "x"] <- 5
names(tirol.5)[names(tirol.5) == 'V85'] <- 'e.testmodus'
tirol.5$e.testmodus <- factor(as.factor(tirol.5$e.testmodus), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("trifft voll zu", "trifft weitgehend zu", 
                   "trifft überwiegend zu", "triff eher nicht zu", "trifft gar nicht zu"),
        ordered = TRUE)


# e.praktikabel
tirol.5$V92[tirol.5$V93 == "x"] <- 1
tirol.5$V92[tirol.5$V94 == "x"] <- 2
tirol.5$V92[tirol.5$V95 == "x"] <- 3
tirol.5$V92[tirol.5$V96 == "x"] <- 4
tirol.5$V92[tirol.5$V97 == "x"] <- 5
names(tirol.5)[names(tirol.5) == 'V92'] <- 'e.praktikabel'
tirol.5$e.praktikabel <- factor(as.factor(tirol.5$e.praktikabel), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("trifft voll zu", "trifft weitgehend zu", 
                   "trifft überwiegend zu", "triff eher nicht zu", "trifft gar nicht zu"),
        ordered = TRUE)


# Kommentarspalten umbenennen:

names(tirol.5)[names(tirol.5) == 'V40'] <- 'note.audiemus'
names(tirol.5)[names(tirol.5) == 'V49'] <- 'note.technik.ok'
names(tirol.5)[names(tirol.5) == 'V70'] <- 'note.relevant'
names(tirol.5)[names(tirol.5) == 'V91'] <- 'note.test'
names(tirol.5)[names(tirol.5) == 'V98'] <- 'note.praktikabel'

# Wenn es irgend eine Antwort zu den 6 Items oder bei den Anmerkungen gab, 
# dann sind alle `NA`-Werte mit "trifft nicht zu" zu kodieren.
# #########################################################################
tirol.5$a.keine.zeit[tirol.5$note.audiemus == "Antwort" &
                             is.na(tirol.5$a.keine.zeit)] <- "trifft nicht zu"
tirol.5$a.kein.interesse[tirol.5$note.audiemus == "Antwort" &
                              is.na(tirol.5$a.kein.interesse)] <- "trifft nicht zu"
tirol.5$a.keine.technik[tirol.5$note.audiemus == "Antwort" &
                              is.na(tirol.5$a.keine.technik)] <- "trifft nicht zu"
tirol.5$a.keine.kompetenz[tirol.5$note.audiemus == "Antwort" &
                             is.na(tirol.5$a.keine.kompetenz)] <- "trifft nicht zu"
tirol.5$a.zu.kompliziert[tirol.5$note.audiemus == "Antwort" &
                             is.na(tirol.5$a.zu.kompliziert)] <- "trifft nicht zu"
tirol.5$a.unbekannt[tirol.5$note.audiemus == "Antwort" &
                             is.na(tirol.5$a.unbekannt)] <- "trifft nicht zu"

# Wenn es keine Antwort auf die 5 Items gabe, aber kommentiert wurde,
# dann sind ebenfalls alle `NA`-Werte mit "trifft nicht zu" zu kodieren.
# ##########################################################################

tirol.5$a.keine.zeit[tirol.5$note.audiemus != "k.A." &
                     is.na(tirol.5$a.keine.zeit)] <- "trifft nicht zu"
tirol.5$a.kein.interesse[tirol.5$note.audiemus != "k.A." &
                                 is.na(tirol.5$a.kein.interesse)] <- "trifft nicht zu"
tirol.5$a.keine.technik[tirol.5$note.audiemus != "k.A." &
                                is.na(tirol.5$a.keine.technik)] <- "trifft nicht zu"
tirol.5$a.keine.kompetenz[tirol.5$note.audiemus != "k.A." &
                                  is.na(tirol.5$a.keine.kompetenz)] <- "trifft nicht zu"
tirol.5$a.zu.kompliziert[tirol.5$note.audiemus != "k.A." &
                                 is.na(tirol.5$a.zu.kompliziert)] <- "trifft nicht zu"
tirol.5$a.unbekannt[tirol.5$note.audiemus != "k.A." &
                            is.na(tirol.5$a.unbekannt)] <- "trifft nicht zu"


## ----loesche-ueberfluessige-spalten-und-zeilen---------------------------


tirol.5[c(1, 3:5, 7:9, 11:15, 17:21, 23:27, 29:33, 35:39, 41:42, 44:48,
          51:56, 58:63, 65:69, 72:77, 79:84, 86:90, 93:97)] <- list(NULL)

tirol.5 <- slice(tirol.5, 3:n())

## ----speichere-bereinigte-datei-unter-neuen-namen------------------------
saveRDS(tirol.5, file = "../daten/tirol.5.rds")

