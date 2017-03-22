# audiemus

Erfolgsfaktoren für digitale Lehr- und Lernmaterialien in Schulen der Sekundarstufe 1

Als Ergänzung zur Masterthese von Claudia Mair "Gestaltung und Implementierung einer digitalen Lehr-/Lernumgebung für die Sekundarstufe 1 - eine Design-Based Research-Untersuchung" wird hier ein Datensatz exploriert, der im Zusammenhang mit der Masterthese erhoben wurde.

Es wird geprüft inwieweit die Daten für einen Artikel auf der Freiburg-Konferenz eingesetzt werden kann. (Genauer Angaben folgen noch. Dieser Test ist vorerst nur ein Platzhalter.)

***
# Nutzung des Repositoriums

## Welche Unterlagen gibt es?

* [audiemus-fragebogen.pdf](https://github.com/petzi53/audiemus/blob/master/dateien/audiemus-fragebogen.pdf): Fragebogen (388.5 kB), wie er verschickt wurde. Ohne Codierung! 
* [audiemus-umfrage.tirol.xslx](https://github.com/petzi53/audiemus/raw/master/dateien/audiemus-umfrage-tirol.xlsx): Ursprüngliches Excel-File (25.4 kB), das von SchülerInnen an Hand der entsprechenden Ergebnisse der Umfrage über [SurveyMonkey](https://de.surveymonkey.com/results/SM-2WD2HRDG/) erstellt wurde.
* [audiemus-tirol.xlsx](https://github.com/petzi53/audiemus/raw/master/dateien/audiemus-tirol.xlsx): Excel-File (17.4 kB) für die Datenauswertung bereits aufbereitet mit drei Reitern: 
    - Excel-Blatt mit Codering (z.B. A, B, C, D, E), 
    - Excel-Blatt mit faktorisierten Variablen (z.B. sehr gut, gut, ausreichend, schlecht, nicht vorhanden)
    - Excel-Blatt mit kommentierten Antworten (muss noch durchgesehen und für Datenauswertung aufbereitet werden.)


## Welche Dateien lesen?

1. Dateien mit der Endung ".md" können direkt eingesehen werden. Sie zeigen den Fließtext an, nicht jedoch die Ergebnisse aus der R Programmierung.

2. Dataeien mit der Endung ".html" zeigen sowohl Fließtext als auch die Ergebnisse der R Programmierung an. Sie können jedoch nicht direkt in GitHub angesehen werden. Dafür ist es notwendig, dass ein Bookmarklet installiert wird.

## Wie sind ".html"-Dateien zu lesen?

Dazu braucht es eine spezielle URL, die kann mit einem Bookmarklet autoamtisch generiert werden.

Das Bookmarklet findet sich auf: http://htmlpreview.github.io/ (Den Link "HTMLPreview" mit drag & drop in die Browserleiste verschieben.) Danach können ".html"-Dateien mit zwei Schritten aufgerufen werden:

* In die ".html"-Datei klicken: Es öffnet sich der HTML-Code der entsprechenden Seite.

* Danach das Bookmarklet aufrufen: Es öffnet sich die Seite zum Lesen.

## Wo zuerst hinschauen?

Die aktuelle Fassung ist im Zweig Master (Branch: Master) zu finden. Beim Aufrufen der Seite sollte eigentlich immer der Master-Zweig automatisch eingestellt sein.

Der Ordner "daten-bereinigen" ist bloß eine komplizierte Umschichtung der Daten ("data wrangling"), damit sie für R gut bearbeitbar werden. Inhaltlich beginnt die Arbeit erst im Ordner "daten-explorieren". 




