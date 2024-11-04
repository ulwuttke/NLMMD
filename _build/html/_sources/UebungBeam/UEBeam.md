# FEM Übungsbeispiel: linear/nichtlinear

## Vorabbemerkungen
Übungsbeispiel für das FEM-Programm (solver) OptiStruct {cite}`opti2021-2`
- zum Kennenlernen der Dateistruktur
- zum Einstieg in die Befehlszeilensteuerung
- als Beispiel für den Unterschied linearer und nichtlinearer Rechnungen

<!---Eine gute Stichworthilfe erhält man über den [Altair OptiStruct Reference Guide](https://2021.help.altair.com/2021/hwsolvers/os/topics/solvers/os/ref_guide_os_c.htm)--->

Für die Bearbeitung der Textdateien empfiehlt sich ein ordentlicher Texteditor wie z.B. [notepad++](https://notepad-plus-plus.org/)

Die im Folgenden verwendeten .fem-Dateien stehen über die [CampUas-Seite](https://campuas.frankfurt-university.de/course/view.php?id=1796) zur verfügung.

Das betrachtete Berechnungsbeispiel ist ein simpeler Kragträger aus einem fiktiven Material, der mit einer Einzelkraft belastet ist.
 
![Kragarm](Kragarm.png)

Nach der linearen Biegetheorie ergibt sich für diesen Kragträger eine deutlich zu große Verformung:

$I=\pi d^4/64 = \pi\cdot 20^{4}/64 \text{mm}^{4}=7854\text{mm}^{4}$

$w=\frac{1}{3} \frac{F\cdot l^{3}}{EI}=\frac{1}{3} \frac{F\cdot 1000^{3}}{100000\cdot 490,9} \text{mm}=424\text{mm}$


## Start der Berechnung

Das Starten der Berechnung kann auf zwei Arten erfolgen:
- über die Kommandozeild der Eingabeaufforderung (command shell) (hier beispielhaft zum Start der Berechnung in Windows mit der Datei *230912_BeamLin.fem*; beim Selbstversuch ist der Pfad natürlich ggf. anzupassen; siehe auch [run OptiStruct *from a skript*](https://2021.help.altair.com/2021/hwsolvers/os/topics/solvers/os/run_optistruct_intro_r.htm); die Erzeugt *.h3d*-Datei kann dann über Hyperview geöffnet werden):
```
C:\"Program Files"\Altair\2021.2\hwsolvers\scripts\optistruct 230912_BeamLin.fem

```
- über die GUI von Hyperworks und den Import via *Solver Deck* und anschließenden Start der Berechnung über *Analysis -> OptiSttruct*

```{dropdown} Altair Hyperworks 2021.2: Einlesen .fem Datei
![IportSolverDeck](Opti2021_ImpSolDeck.jpg)
```

```{dropdown} Altair Hyperworks 2021.2: Start der Berechnung und Anzeigen der Ergebnisse
![StartOptiStruct](Opti2021_BerStart.jpg)
```

## Struktur und Ihhalt der .fem Datei

Natülich lassen sich alle Berechnugnseinstellungen auch über die Menüstruktur von Hyperworks {cite}`HypWor2021-2` bzw. Hypermesh eingeben. Da die Menüführung aber wie bei jedem Programm nicht so ganz eingängig ist, im Rahmen des Kurses das Grundmodell vorgegeben ist und letztlich nur das Material angepasst werden muss, ist es (hoffentlich) einfacher, direkt in der *.fem* Textdatei zu arbeiten (der grundsätzliche Aufbau der Eingabedatei ist [hier](https://2021.help.altair.com/2021/hwsolvers/os/topics/solvers/os/data_input_file_r.htm) beschrieben). Die *$*-Zeichen in der Datei sind Kommentarsymbole, d.h. diese Zeile wird nicht eingelesen und für die Berechnung ohne Belang. 

Die Struktur der Datei wird am Beispiel der Datei [230912_BeamLin.fem](fem_files/230912_BeamLin.fem) für eine klassiche lineare Rechnung erläutert. 

Der erste wichtige Block in der *Subcase Information* bzw. *i/O-Section* ist der [*ANALYSIS*-Eintrag](https://2021.help.altair.com/2021/hwsolvers/os/topics/solvers/os/analysis_sub_r.htm) mit der nachfolgenden Zuordnung der Randbedingungen und Lasten:
```
$$ ===Static (lin. Geom) ===
ANALYSIS STATCS
  SPC = 1001
  LOAD = 1002
```

*ANALYSIS STATICS* definiert eine linear statische Berechnung. Das bedeutet es können nur lineare Materialien verwendet werden und auch die Verformung wird linearisiert (entspricht der klassischen linearen Biegetheorie). 
Die Zahl hinter *SPC* (=*Single Point Constraint*) ist die ID der Lagerungsbedinung, die in der Rechnung berücksichtigt werden soll und verweist auf den weiter unten in der *Bulk Data Section* stehenden [SPC-Eintrag](https://2021.help.altair.com/2021/hwsolvers/os/topics/solvers/os/spc_bulk_r.htm)

```
$$========= RB  ============ 
$$ 
SPC,1001,101,123456,0.0
SPC,1001,201,123456,0.0
```

Die Zahlenfolge *123456* beschreibt dabei die Freiheitsgrade des Knotens, die mit der Randbedingung festgehalten werden. In diesem Beispiel werden alle Verscuiebungen(*123*) und auch alle Verdrehnungen (*456*) festgehalten. 

Die Zahl hinter *LOAD* ist entsprechend die ID des zu berechnenden Lastfalls. Also den auch in der *Bulk Data Section* stehenden [FORCE-EIntrag](https://2021.help.altair.com/2021/hwsolvers/os/topics/solvers/os/force_bulk_r.htm): 

```
$$===Belastung=====
$$
FORCE,1002,102,0,1.e+3,0.0,-1.,0.0
FORCE,1002,206,0,1.e+3,0.0,-1.,0.0 
```

Die Bedeutung der einzelnen Einträge hinter sind in im [*Altair OptiStruct Referenc Guide*](https://2021.help.altair.com/2021/hwsolvers/os/topics/solvers/os/ref_guide_os_c.htm) beschrieben (als Beispiel sind oben *SPC* und *FORCE* direkt zur Hilfeseite von *Altair* verlinkt).  

Die Geometrie ergibt sich aus den Elementen (hier Balkenlemente vom Typ *CBAR*) die über die Knoten (*GRID*) verknüpft werden:  

```
$$ Balken aus einem Element
GRID,101,0,0.0,0.0,0.0
GRID,102,0,1000.,0.,0.
CBAR,1,22,101,102,0.,1.,1.,GGG
$$
$$ Balken aus mehreren Elementen
GRID,201,0,0.0,250.,0.0
GRID,202,0,200.,250.,0.0
[...]
```

Wie zu erkennen wird nicht nur ein Balken, sondern zwei erzeugt: einmal aus nur einem Element und ein weiteres mal aus mehreren Elementen. Daher waren auch die oben genannten Lasten und Lagerungsbedingunen immer dopelt angegeben. Warum hier so vorgeganen wurde, wird bei der Auswertung der Berechnung erläutert. In dem oberen Eintrag werden zwei Knoten mit der ID*101* bzw. ID*102* an den Positonen (0;0;0) und (0;0;1000.) erzeugt und mit einem Balken. Der Balken bekommt seine Eigenschaften über die *Property Definition* mit der ID*22*, hier über den Eintrag *PBARL* (Rundstab mit R=10): 

```
$$=== Eigenschaften =======
$$ 
PBARL, 22, 33,,ROD
,10.
$$
```

Das Material wird in dem Eintrag über die ID*33* der *PBARL*-Definition zugewiesen. Definiert wird es durch den *MAT1*-Eintrag mit der entsprechenden *ID*:

```
$$=== Materialien ========= 
MAT1,33,100000.,,0.3,
$$
```

```{note}
Alle Zahlenwerte sind ohne Einheit angeggeben. Die Einheiten sind natürlcih zu beachten. Bei rein statischen Rechnungen ohhne Eigengewicht ist die Sache recht einfach: Alle Werte sind in *mm* und *N* einzugeben, dann ergeben sich die Verformungen auch in *mm* und die Spannungen in *MPa*
```

## Lineare Berechnung

Nach dem Abschluss der Berechnung der Datei *230912_BeamLin.fem* kann die erzeugte .h3d-Datei in Hyperview geöffnet werden und es sollte sich das folgende Bild ergeben:

![Icons](HyView2021Beam02.jpg)

```{dropdown} Tipps zur Darstellung
![Icons](HyView2021Beam01.jpg)
1: Ausrichten in der x-y-Ebene
2: Skalieren der Verformung (*Scale Factor* = 1,0) und Darstellen der undeformierten Struktur (*Udeformed Shape -> Edges*)
3: Darstellung der Verformung als Farbplot (*Contur*, *Result Type -> Deformatoin, Mag*)
```

In dem Bild ist nun auch der Grund für die "zwei Balken" zu erkennen. Beide Balken verformen sich am Endknoten gleich und zwar um einen Betrag von $4.42E+2->442\text{mm}$ in y-Richtung (zu erkennen, wenn nur die x bzw. y-Komponente der Verformung dargestellt wird). Das entspricht (zum Glpück) der klassichen Handrechnung. Man erkenn aber, dass das Programm die Verformung zwar richtig rechnet, aber bei nur einem Element die Knoten einfach falsch linear verbindet. Erst bei mehreren Balken werden an jedem Konten auch Zwischenwerte berechnet und damit kann die Balkenverformung besser abgebildet werden.

Aufgrund der linearen Rechnung (insb. der linearisierten Geometie) ist aber trotz der großen Verformung in y-Richtung die Verformung in x-Richtung gleich Null. Das kann so natürlich nicht sein, da so der Balken ja länger werden müsste.

## Nichtlineare Berechnung 

Als ersten Schritt zur Nichtlinearen Rechnung ist die Berechnugnsdatei wie folgt angepasst (*230912_BeamNLin.fem*):

Im *ANALYSIS* wird die Option *NLSTAT* gewählt. Zusätzlich werden die Optionen *NLPARAM* und *NLOUT* gesetzt. Über *NLOUT* wird zudem vorgegeben, dass Zwischenwerte mit ausgegeben werden (Ansonsten würde ggf. nur das letzte Ergebnis ausgespielt und damit stünden keine Informationen über den Kraft-Weg-Verlauf bei steigender Kraft zur Verfügung).

```
ANALYSIS NLSTAT
  SPC = 1001
  LOAD = 1002
  NLPARM = 1003
  NLOUT = 1004
[...]
BEGIN BULK
[...]
$$
NLPARM,1003,100
NLOUT,1004,TIME,10044
SET,10044,TIME,LIST
+,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8
+,0.9,1.0 
```

Das neue Ergenis ist allerdings ernüchternd.

![Icons](HyView2021Beam03.jpg)

Da nun für Mehrere Zeitschritte Ergebnisse vorliegen, muss man bei der Darstellung ein paar Dinge beachten:

**(1)** wählt den Lastfaktor (Rechenzeit) aus. Wenn Hier $0,0$ steht, ist der Balken noch unbelastet
Bei **(2)** sollte *Transient Annimation Mode* ausgewählt sein. Dann kann man mit dem Schieberegler **(3)** die Last steigern.
Über **(4)** lässt sich das Diagramm erzeugen. 

Es ist zu erkennen, dass nun zwar iterativ aber aufgrund der weiterhin linearisierten Geometrie im Grunde die Rechnung nicht nichtlinear wird. Erst durch die Ergänzung *LGDISP*,w ird nun auch die Verformung "richtig" berechnet, da nun die Geometrie nicht mehr linearisiert wird. 
```
  NLPARM(LGDISP) = 1003
```
 Über die Eingabedatei *230912_BeamNLinLaDisp.fem* ergibt sich das folgende Ergebnis:

![Icons](HyView2021Beam04.jpg)

```{dropdown} ... hier das ordentliche Diagramm
![Ergebnisdiagramm](ErgNLLaDisp.png)
```

Das Folgende ist in dem Bild hervorzuheben:

- bis zu Belastung von $F=100\text{N}$ (*TIME=0.1* entspricht dem Lastfaktor von $0,1$) ist der Verluaf der Verformung mit Zunahme der Last annähernd linear; die Verformung in x-Richtung ist näherungsweise Null,
- danach verformt sich die Spitze des Kragarms auch deutlich in x-Richtung ($u$).
- die Art der Vernetztung hat einen deutlichen Einfluss: bei dem Balken aus mehreren Elementen ist ein deutlich nichtlinearer Verlauf der Verformung in y-Richtung ($w$) zu erkennen; der Balken aus einem Element folgt in seiner Verformung einem Kreisbogen (hier nicht zu sehen, kann aber über den Vergleich der $x/y$-Werte mit der kreisgleichung gezeigt werden).


