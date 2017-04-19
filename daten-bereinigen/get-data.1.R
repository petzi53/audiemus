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

umfrage.1 <- read_excel(
        "../daten/umfrage-tirol-36tn.xlsx",
        sheet = 1,
        col_names = TRUE,
        col_types = NULL,
        na = "",
        skip = 0
        )
saveRDS(umfrage.1, file = "../daten/umfrage-tirol.1.rds")


## ------------------------------------------------------------------------
tirol.1 <- as_tibble(t(umfrage.1))

## ----auspraegungen-in-variable-ueberfuehren------------------------------

# schultyp
<<<<<<< HEAD
tirol.1$V2[tirol.1$V3 == "x"] <- 1 # AHS
tirol.1$V2[tirol.1$V4 == "x"] <- 2 # NMS
tirol.1$V2[tirol.1$V5 == "x"] <- 3 # PTS
names(tirol.1)[names(tirol.1) == 'V2'] <- 'schultyp'
tirol.1$schultyp <- factor(as.factor(tirol.1$schultyp), 
                           levels = c(1, 2, 3), 
                           labels = c("AHS", "NMS", "PTS"))

# t.pc.ja
tirol.1$V7[tirol.1$V8 == "x"] <- 1
tirol.1$V7[tirol.1$V9 == "x"] <- 2
tirol.1$V7[tirol.1$V10 == "x"] <- 3
tirol.1$V7[tirol.1$V11 == "x"] <- 4
tirol.1$V7[tirol.1$V12 == "x"] <- 5
names(tirol.1)[names(tirol.1) == 'V7'] <- 't.pc.ja'
tirol.1$t.pc.ja <- factor(as.factor(tirol.1$t.pc.ja), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("sehr gut", "ausreichend", "ausbaufähig", "schlecht", "nicht vorhanden"),
        ordered = TRUE)

# t.pc.nein 
# wird wegen verwirrender Formulierung nicht genützt!
# zur Erinnerung bleibt A,B,C,D,E als falsche Codierung bestehen
=======
tirol.1$V2[tirol.1$V3 == "x"] <- "A"
tirol.1$V2[tirol.1$V4 == "x"] <- "B"
tirol.1$V2[tirol.1$V5 == "x"] <- "C"
names(tirol.1)[names(tirol.1) == 'V2'] <- 'schultyp'

# t.pc.ja
tirol.1$V7[tirol.1$V8 == "x"] <- "A"
tirol.1$V7[tirol.1$V9 == "x"] <- "B"
tirol.1$V7[tirol.1$V10 == "x"] <- "C"
tirol.1$V7[tirol.1$V11 == "x"] <- "D"
tirol.1$V7[tirol.1$V12 == "x"] <- "E"
names(tirol.1)[names(tirol.1) == 'V7'] <- 't.pc.ja'

# t.pc.nein
>>>>>>> 197d6e53b5af75583f9610134386d3953fe7d9a2
tirol.1$V13[tirol.1$V14 == "x"] <- "A"
tirol.1$V13[tirol.1$V15 == "x"] <- "B"
tirol.1$V13[tirol.1$V16 == "x"] <- "C"
tirol.1$V13[tirol.1$V17 == "x"] <- "D"
tirol.1$V13[tirol.1$V18 == "x"] <- "E"
names(tirol.1)[names(tirol.1) == 'V13'] <- 't.pc.nein'

# t.tablet
<<<<<<< HEAD
tirol.1$V19[tirol.1$V20 == "x"] <- 1
tirol.1$V19[tirol.1$V21 == "x"] <- 2
tirol.1$V19[tirol.1$V22 == "x"] <- 3
tirol.1$V19[tirol.1$V23 == "x"] <- 4
tirol.1$V19[tirol.1$V24 == "x"] <- 5
names(tirol.1)[names(tirol.1) == 'V19'] <- 't.tablet'
tirol.1$t.tablet <- factor(as.factor(tirol.1$t.tablet), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("sehr gut", "ausreichend", "ausbaufähig", "schlecht", "nicht vorhanden"),
        ordered = TRUE)

# t.lan
tirol.1$V25[tirol.1$V26 == "x"] <- 1
tirol.1$V25[tirol.1$V27 == "x"] <- 2
tirol.1$V25[tirol.1$V28 == "x"] <- 3
tirol.1$V25[tirol.1$V29 == "x"] <- 4
tirol.1$V25[tirol.1$V30 == "x"] <- 5
names(tirol.1)[names(tirol.1) == 'V25'] <- 't.lan'
tirol.1$t.lan <- factor(as.factor(tirol.1$t.lan), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("sehr gut", "ausreichend", "ausbaufähig", "schlecht", "nicht vorhanden"),
        ordered = TRUE)

# t.wlan
tirol.1$V31[tirol.1$V32 == "x"] <- 1
tirol.1$V31[tirol.1$V33 == "x"] <- 2
tirol.1$V31[tirol.1$V34 == "x"] <- 3
tirol.1$V31[tirol.1$V35 == "x"] <- 4
tirol.1$V31[tirol.1$V36 == "x"] <- 5
names(tirol.1)[names(tirol.1) == 'V31'] <- 't.wlan'
tirol.1$t.wlan <- factor(as.factor(tirol.1$t.wlan), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("sehr gut", "ausreichend", "ausbaufähig", "schlecht", "nicht vorhanden"),
        ordered = TRUE)

# t.beamer
tirol.1$V37[tirol.1$V38 == "x"] <- 1
tirol.1$V37[tirol.1$V39 == "x"] <- 2
tirol.1$V37[tirol.1$V40 == "x"] <- 3
tirol.1$V37[tirol.1$V41 == "x"] <- 4
tirol.1$V37[tirol.1$V42 == "x"] <- 5
names(tirol.1)[names(tirol.1) == 'V37'] <- 't.beamer'
tirol.1$t.beamer <- factor(as.factor(tirol.1$t.beamer), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("sehr gut", "ausreichend", "ausbaufähig", "schlecht", "nicht vorhanden"),
        ordered = TRUE)

# t.whiteboard
tirol.1$V43[tirol.1$V44 == "x"] <- 1
tirol.1$V43[tirol.1$V45 == "x"] <- 2
tirol.1$V43[tirol.1$V46 == "x"] <- 3
tirol.1$V43[tirol.1$V47 == "x"] <- 4
tirol.1$V43[tirol.1$V48 == "x"] <- 5
names(tirol.1)[names(tirol.1) == 'V43'] <- 't.whiteboard'
tirol.1$t.whiteboard <- factor(as.factor(tirol.1$t.whiteboard), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("sehr gut", "ausreichend", "ausbaufähig", "schlecht", "nicht vorhanden"),
        ordered = TRUE)

# kopfhoerer
tirol.1$V49[tirol.1$V50 == "x"] <- 1
tirol.1$V49[tirol.1$V51 == "x"] <- 2
tirol.1$V49[tirol.1$V52 == "x"] <- 3
tirol.1$V49[tirol.1$V53 == "x"] <- 4
tirol.1$V49[tirol.1$V54 == "x"] <- 5
names(tirol.1)[names(tirol.1) == 'V49'] <- 't.kopfhoerer'
tirol.1$t.kopfhoerer <- factor(as.factor(tirol.1$t.kopfhoerer), 
        levels = c(1, 2, 3, 4, 5), 
        labels = c("sehr gut", "ausreichend", "ausbaufähig", "schlecht", "nicht vorhanden"),
        ordered = TRUE)
=======
tirol.1$V19[tirol.1$V20 == "x"] <- "A"
tirol.1$V19[tirol.1$V21 == "x"] <- "B"
tirol.1$V19[tirol.1$V22 == "x"] <- "C"
tirol.1$V19[tirol.1$V23 == "x"] <- "D"
tirol.1$V19[tirol.1$V24 == "x"] <- "E"
names(tirol.1)[names(tirol.1) == 'V19'] <- 't.tablet'

# t.lan
tirol.1$V25[tirol.1$V26 == "x"] <- "A"
tirol.1$V25[tirol.1$V27 == "x"] <- "B"
tirol.1$V25[tirol.1$V28 == "x"] <- "C"
tirol.1$V25[tirol.1$V29 == "x"] <- "D"
tirol.1$V25[tirol.1$V30 == "x"] <- "E"
names(tirol.1)[names(tirol.1) == 'V25'] <- 't.lan'

# t.wlan
tirol.1$V31[tirol.1$V32 == "x"] <- "A"
tirol.1$V31[tirol.1$V33 == "x"] <- "B"
tirol.1$V31[tirol.1$V34 == "x"] <- "C"
tirol.1$V31[tirol.1$V35 == "x"] <- "D"
tirol.1$V31[tirol.1$V36 == "x"] <- "E"
names(tirol.1)[names(tirol.1) == 'V31'] <- 't.wlan'

# t.beamer
tirol.1$V37[tirol.1$V38 == "x"] <- "A"
tirol.1$V37[tirol.1$V39 == "x"] <- "B"
tirol.1$V37[tirol.1$V40 == "x"] <- "C"
tirol.1$V37[tirol.1$V41 == "x"] <- "D"
tirol.1$V37[tirol.1$V42 == "x"] <- "E"
names(tirol.1)[names(tirol.1) == 'V37'] <- 't.beamer'

# t.whiteboard
tirol.1$V43[tirol.1$V44 == "x"] <- "A"
tirol.1$V43[tirol.1$V45 == "x"] <- "B"
tirol.1$V43[tirol.1$V46 == "x"] <- "C"
tirol.1$V43[tirol.1$V47 == "x"] <- "D"
tirol.1$V43[tirol.1$V48 == "x"] <- "E"
names(tirol.1)[names(tirol.1) == 'V43'] <- 't.whiteboard'

# kopfhoerer
tirol.1$V49[tirol.1$V50 == "x"] <- "A"
tirol.1$V49[tirol.1$V51 == "x"] <- "B"
tirol.1$V49[tirol.1$V52 == "x"] <- "C"
tirol.1$V49[tirol.1$V53 == "x"] <- "D"
tirol.1$V49[tirol.1$V54 == "x"] <- "E"
names(tirol.1)[names(tirol.1) == 'V49'] <- 't.kopfhoerer'
>>>>>>> 197d6e53b5af75583f9610134386d3953fe7d9a2

names(tirol.1)[names(tirol.1) == 'V55'] <- 'note.kopfhoerer'

## ----loesche-ueberfluessige-spalten--------------------------------------

tirol.1 <- slice(tirol.1, 3:n())
tirol.1[c(1, 3:6, 8:12, 14:18, 20:24, 26:30, 32:36, 38:42, 44:48, 50:54)] <- list(NULL)

## ----speichere-bereinigte-datei-unter-neuen-namen------------------------
saveRDS(tirol.1, file = "../daten/tirol.1.rds")

