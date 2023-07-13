@echo off

:: ------------------------------- Änderungsindex -------------------------------

::Datum			Name				Änder									Version
::01.03.2023	Sebastian Hertel	Einfügen Kapitel 1-20 in Ordneranlage	V3.1







:: ------------------------------------------------------------------------------



if "%1"=="" goto eingabe
if "%2"=="" goto eingabe
if "%3"=="" goto eingabe

Set Karobau_Code=%1
set Anlagennummer=%2
set ARG=%3
set LW=%4
set Auswahl=%5
set ARG_NR=%6
set Zaehler=%7
set Anlegen=%8


set ARG1=0
set ARG2=0
set ARG3=0
set ARG4=0
set ARG5=0
set ARG6=0
set ARG7=0
set ARG8=0
set ARG9=0

:eingabe

set /p Karobau_Code=Karobaucode eingeben (z.B. K3 ):
set /p Anlagennummer=Anlagennummer eingeben (z.B. U1A1 ): 
set /p ARG_Anzahl=Anzahl Arbeitsgruppen eingeben (z.B. 1-9 ):
Set /P LW= Ziellaufwerk eingeben ( D ):
::Set /P Auswahl=Sollen die Daten aktualisiert werden ( J/N ):
Set /P Anlegen=Soll die Ordnerstruktur angelegt werden ( J/N ):

if /i "%Auswahl%"=="J" set neu=/Y /S /D /U
if /i "%Auswahl%"=="J" set pfad=Update
if /i "%Auswahl%"=="N" set neu=/A /S /Y
if /i "%Auswahl%"=="N" set pfad=Erstellung

if /i "%ARG_NR%"=="1" set ARG1







if /i "%Anlegen%"=="N" goto nicht_anlegen








::---------------------------------------------------------------------------------------------------------
:://////////////////////////////////// Programmstart Ordnerstruktur anlegen \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

set ARG_NR=1
set Zaehler=0



echo Hauptordner Anlegen

:://////////////////////////////////// 00 Inhalt \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 				MKdir %lw%:\00_Inhalt
				
:://////////////////////////////////// 01 Anlagenbeschreibung \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\				
				MKdir %lw%:\01_Anlagenbeschreibung\01_0_Betriebshandbuch
				MKdir %lw%:\01_Anlagenbeschreibung\01_1_Produktionsdaten
				MKdir %lw%:\01_Anlagenbeschreibung\01_2_Anlagenlayout
				MKdir %lw%:\01_Anlagenbeschreibung\01_3_Anlagenstammbaum
				MKdir %lw%:\01_Anlagenbeschreibung\01_4_Teilestammbaum
				MKdir %lw%:\01_Anlagenbeschreibung\01_5_Bauteiluebersicht_mit_Fuegefolgen
				MKdir %lw%:\01_Anlagenbeschreibung\01_6_Taktzeitdiagramm
				MKdir %lw%:\01_Anlagenbeschreibung\01_7_Medienbedarfsliste
				MKdir %lw%:\01_Anlagenbeschreibung\01_8_Verfuegbarkeit
				MKdir %lw%:\01_Anlagenbeschreibung\01_9_Beschreibung_der_Anlage
				MKdir %lw%:\01_Anlagenbeschreibung\01_10_Anlagenkonzepte
				
:://////////////////////////////////// 02 Sicherheitsbestimmungen \\\\\\\\\\\\\\\\\\\\\\\\\\\\				
				MKdir %lw%:\02_Sicherheitsbestimmungen
				
:://////////////////////////////////// 03 Sicherheits und Schutzeinrichtungen \\\\\\\\\\\\\\\\				
				MKdir %lw%:\03_Sicherheits-_und_Schutzeinrichtungen
				
:://////////////////////////////////// 04 Bemivorschriften und Handbücher \\\\\\\\\\\\\\\\					
				MKdir %lw%:\04_Bemivorschriften_und_Handbuecher
				
:://////////////////////////////////// 05 Montage der Anlage \\\\\\\\\\\\\\\\					
				MKdir %lw%:\05_Montage_der_Anlage
:://////////////////////////////////// 06 Inbetriebnahme \\\\\\\\\\\\\\\\					
				MKdir %lw%:\06_Inbetriebnahme\06_8_Inbetriebnahmeprotokolle\06_8_1_Abluft
				MKdir %lw%:\06_Inbetriebnahme\06_8_Inbetriebnahmeprotokolle\06_8_2_Abnahmeprotokolle
				MKdir %lw%:\06_Inbetriebnahme\06_8_Inbetriebnahmeprotokolle\06_8_3_Intec
				MKdir %lw%:\06_Inbetriebnahme\06_8_Inbetriebnahmeprotokolle\06_8_4_Kuka_Roboter
				
				
				MKdir %lw%:\07_Betrieb_der_Anlage
				
				MKdir %lw%:\08_Wartung_und_Instandhaltung
				
				MKdir %lw%:\09_Demontage_der_Anlage
				
				MKdir %lw%:\10_Komponentenwechselkonzept
				
				
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\0_Eplan_P8_ZW1 
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\1_Betriebsanleitung
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_0_Eplan_PDF\Ablage_in_BMS.txt
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_1_Netzwerktechnik
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_1_Netzwerktechnik\IP-Adressliste\Ablage_in_BMS.txt
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_1_Netzwerktechnik\Messprotokoll
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_1_Netzwerktechnik\Netzwerkstruktur\Ablage_in_BMS.txt
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_2_Geraetehandbuecher
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_3_Bauteillisten
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_4_Waermeberechnung
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_5_Einspeisekonzept
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_6_Beleuchtungskonzept
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_2_Lizenzversion
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\Fremdanlagen
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\Grossdatenanzeigen
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\Intern
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\SCADA
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\5_Parametersaetze							
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\6_Zertifikate\6_6_Sistema
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\6_Zertifikate\6_8_Einweisungen				
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\7_Wartung_Elektrik
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\8_Checklisten		
				
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_01_Konformitaetserklaerung_der_Anlage
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_02_Einbauerklaerung_Anlagenkomponenten
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_03_DGUV-V3_Bescheinigung
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_04_Pruefbuecher\Siehe_Kapitel_20.txt
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_05_Schutztore\Siehe_Kapitel_20.txt
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_06_Druckbehaelter\Siehe_Kapitel_20.txt
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_07_Scanner_Lichtschranke\Siehe_Kapitel_20.txt
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_08_Hebezeug\Siehe_Kapitel_20.txt
				MKdir %lw%:\12_Konformitaetserklaerungen_und_Bescheinigungen\12_09_Pruefpflichtige_Anlagen\Siehe_Kapitel_20.txt
				
				
				MKdir %lw%:\13_Risikobeurteilung_Gefahrenanalyse\13_1_Sicherheitslayout
				MKdir %lw%:\13_Risikobeurteilung_Gefahrenanalyse\13_2_Risikobeurteilung
				MKdir %lw%:\13_Risikobeurteilung_Gefahrenanalyse\13_3_Mitarbeiterunterweisun
				
				MKdir %lw%:\14_Ausgabe_und_Aenderungsstand
				
				MKdir %lw%:\15_Ersatz_und_Verschleissteillisten\15_1_Ersatzteilliste_Mech
				MKdir %lw%:\15_Ersatz_und_Verschleissteillisten\15_2_Ersatzteilliste_Elektr
				
				MKdir %lw%:\16_Mechanikplaene\16_01_Pneumatikplan_Funktionsplan
				MKdir %lw%:\16_Mechanikplaene\16_03_Kuehlwasserplan
				MKdir %lw%:\16_Mechanikplaene\16_04_Bolzenplan
				MKdir %lw%:\16_Mechanikplaene\16_06_Klebernahtplan
				MKdir %lw%:\16_Mechanikplaene\16_07_Punkteplan
				MKdir %lw%:\16_Mechanikplaene\16_09_Schweißen_MAG_Nahtplan
				MKdir %lw%:\16_Mechanikplaene\16_11_Spannplan
				MKdir %lw%:\16_Mechanikplaene\16_17_Kukaload
				MKdir %lw%:\16_Mechanikplaene\16_18_SPA
				MKdir %lw%:\16_Mechanikplaene\16_19_LDP
				
				MKdir %lw%:\17_Prozess_FMEA
				
				MKdir %lw%:\18_Qualitaet
				
				MKdir %lw%:\19_Zeichnungen_und_Stuecklisten
				
				MKdir %lw%:\20_Firmenunterlagen\20_1_Beistellumfangliste
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Albany
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Braeuer
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\DLS
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Feldpausch
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\FFT-Foerdertechnik\Baender
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\FFT-Foerdertechnik\Traegerwagen
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Fronius
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Hebezeuge
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\HSP_Stahlbau
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Ifsys
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Intech
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\IWS_Kettengehaenge
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Kuka\7_Achse
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Kuka\Rackchanger
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Kuka\Roboter
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Kuka\WZ_Achsen
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Mias
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Nimak\Buckelmaschine
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Nimak\Schweisszangen
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Remech_Overhead
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Sick
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Siemens
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Sinterleghe
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Statik_Auszugschiene
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Statik_Stahlbau_Galgen
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Tuenkers\Stauband
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Tuenkers\Drehtische
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Tuenkers\Praegen
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\VW-Werkzeugbau
				MKdir %lw%:\20_Firmenunterlagen\20_2_Dokumentation_Kaufteile\Yale



:schleife1								
(MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\0_Eplan_P8_ZW1								
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_0_Eplan_PDF
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\IP-Adresslisten
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Messprotokolle\CU
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Messprotokolle\POF
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Netzwerstruktur
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_3_Bauteillisten\Ersatzteile
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_3_Bauteillisten\Schleppleitungen
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_4_Waermeberechnung				
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\3_Software\3_1_SPS_Archiv				
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\4_Roboter				
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_1_Antriebstechnik\geregelte_Antriebe\Datensicherung
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_1_Antriebstechnik\geregelte_Antriebe\Dokumentation
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_1_Antriebstechnik\ungeregelte_Antriebe
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_2_Sensoren\1-Durchfluss
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_2_Sensoren\2_Lichttaster
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_2_Sensoren\3-BWS
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_3_Prozessgeraete
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_4_sonstige\RFID
							
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_1_Konformitaet
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_2_DGUV_3
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_3_Sicherheitstechnik
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_3_Sicherheitstechnik\Antriebstechnik
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_3_Sicherheitstechnik\BWS
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_4_Sicherheitsmatrix
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_5_Sicherheitslayout
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_7_Pruefberichte
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_9_EMV_DGUV_15
				MKdir %lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_10_Beleuchtungsmessung				
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto Anlegen_beendet
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife1

::goto schluss

:nicht_anlegen
echo Ordnerstruktur wird nicht angelegt



:Anlegen_beendet
:: //////////////////////////////////////////// Programmstart einsortieren \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

::------------------------------------- Grundordnerinhalte ARG algemein einsortierne -------------------------------

:://////////////////////////////////////////// Kapitel 00_Inhalt \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Inhaltsverzeichnis einsortieren
move %~d0\Quellordner\Kapitel_00_%Karobau_Code%%Anlagennummer%_V??_a.pdf %LW%:\00_Inhalt\
pause
move %~d0\Quellordner\Kapitel_00_%Karobau_Code%%Anlagennummer%_V??_a.doc %LW%:\00_Inhalt\
pause
:://////////////////////////////////////////// Kapitel 01_Anlagenbeschreibung \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Anlagenbeschreibung einsortieren
move %~d0\Quellordner\????-?????-??-??-%Anlagennummer%-???-????_VAA_??????.dgn %LW%:\01_Anlagenbeschreibung\01_2_Anlagenlayout
move %~d0\Quellordner\????-?????-??-??-%Anlagennummer%-???-????_VAA_??????.pdf %LW%:\01_Anlagenbeschreibung\01_2_Anlagenlayout

:://////////////////////////////////////////// 01_0_Betriebshandbuch \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
:://////////////////////////////////////////// 01_1_Produktionsdaten \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
:://////////////////////////////////////////// 01_2_Anlagenlayout \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

:://////////////////////////////////////////// 01_3_Anlagenstammbaum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Anlagenstammbaum einsortieren
move %~d0\Quellordner\??-??-???_???_???_Stammbaum_??_%Anlagennummer%.xls %LW%:\01_Anlagenbeschreibung\01_2_Anlagenlayout

:://////////////////////////////////////////// 01_4_Teilestammbaum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Teilestammbaum einsortieren
move %~d0\Quellordner\??_???_???_??????_%Anlagennummer%_???_V??_??????.pdf %LW%:\01_Anlagenbeschreibung\01_4_Teilestammbaum\

:://////////////////////////////////////////// 01_5_Bauteileuebersicht_mit_fuegefolgen \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Bauteileuebersicht einsortieren
::move %~d0\Quellordner\??_???_???_??????_%Anlagennummer%_???_V??_??????.pdf %LW%:\01_Anlagenbeschreibung\01_4_Teilestammbaum\

:://////////////////////////////////////////// 01_6_Taktzeitdiagramm \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Taktzeitdiagramm einsortieren
move %~d0\Quellordner\?????_%Anlagennummer%_?????_TZD_????????.pdf %LW%:\01_Anlagenbeschreibung\01_6_Taktzeitdiagramm\
move %~d0\Quellordner\?????_%Anlagennummer%_?????_TZD_????????.xlsx %LW%:\01_Anlagenbeschreibung\01_6_Taktzeitdiagramm\
move %~d0\Quellordner\?????_%Anlagennummer%_?????_TZD_????????.xls %LW%:\01_Anlagenbeschreibung\01_6_Taktzeitdiagramm\

:://////////////////////////////////////////// 01_7_Medienbedarfsliste \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Taktzeitdiagramm einsortieren

:://////////////////////////////////////////// 01_8_Verfuegbarkeit \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Verfuegbarkeit einsortieren
move %~d0\Quellordner\Anlagenverfuegbarkeit_???_???_??_%Anlagennummer%_????????.pptx %LW%:\01_Anlagenbeschreibung\01_6_Taktzeitdiagramm\






:://////////////////////////////////////////// Kapitel 11 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Betriebsanleitung verschieben
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%_BAAL_* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\1_Betriebsanleitung\ 
echo Einspeisekonzepte verschieben
move %~d0\Quellordner\*%Karobau_Code%%Anlagennummer%_EnergieBeleucht* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\2_Hardware\2_5_Einspeisekonzept\ 


Echo Interne Schnittstellenprotokolle verschieben
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%*_%Karobau_Code%%Anlagennummer%*_SIGW* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\Intern

Echo Fremdanlagen Schnittstellenprotokolle verschieben
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%*_K*_SIGW* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\Fremdanlagen
move %~d0\Quellordner\K*_%Karobau_Code%%Anlagennummer%*_SIGW* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\Fremdanlagen

Echo Koppellisten und Meldelisten verschieben
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%*_ZUML_* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\SCADA
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%*_ZUKL_* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\3_Software\3_3_Schnittstellen\SCADA

Echo Sistema verschieben
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%*_SIST_* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\6_Zertifikate\6_6_Sistema

Echo Anlagenunterweisung und Teilnehmerlisten verschieben
move %~d0\Quellordner\*Teilnehmerliste* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\6_Zertifikate\6_8_Einweisungen
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%_Anlagenunterweisung_* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%\6_Zertifikate\6_8_Einweisungen


::------------------------------------- Arbeitsgruppenspezifische Unterlagen einsortierne -------------------------------

echo Eplan ZW1 verschieben

set ARG_nr=1
set Zaehler=0
:schleife2
(
move %~d0\Quellordner\*%Karobau_Code%%Anlagennummer%%ARG_nr%-E*.zw1 %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\0_Eplan_P8_ZW1
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife2_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife2
:schleife2_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Eplan PDF verschieben

set ARG_nr=1
set Zaehler=0
:schleife3
(
move %~d0\Quellordner\*E%Karobau_Code%%Anlagennummer%%ARG_nr%-E*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_0_Eplan_PDF
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife3_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife3
:schleife3_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Netzwerk Messprotokolle verschieben

set ARG_nr=1
set Zaehler=0
:schleife4
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_MPGO_LWL*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Messprotokolle
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife4_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife4
:schleife4_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Netzwerk CU Messprotokolle verschieben

set ARG_nr=1
set Zaehler=0
:schleife5
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_Messprotokolle_Kupfer* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Messprotokolle\CU
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife5_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife5
:schleife5_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Netzwerk POF Messprotokolle verschieben

set ARG_nr=1
set Zaehler=0
:schleife6
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_Validierungsbericht*.PDF %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Messprotokolle\POF
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife6_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife6
:schleife6_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Netzwerk PNGN verschieben

set ARG_nr=1
set Zaehler=0
:schleife7
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_PNGN_??????.PDF %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Netzwerstruktur
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_PNGN_??????.xls* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Netzwerstruktur
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_PNTS_??????.PDF %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Netzwerstruktur
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_PNTO_??????.PDF %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Netzwerstruktur
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_Topologie*.PDF %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_1_Netzwerktechnik\Netzwerstruktur
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife7_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife7
:schleife7_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Ersatzteillisten verschieben

set ARG_nr=1
set Zaehler=0
:schleife8
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_ETLE_??????.xls* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_3_Bauteillisten\Ersatzteile
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife8_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife8
:schleife8_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Ersatzteillisten verschieben

set ARG_nr=1
set Zaehler=0
:schleife9
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_ETLE_??????.xls* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_3_Bauteillisten\Ersatzteile
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife9_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife9
:schleife9_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Schleppleitungen verschieben

set ARG_nr=1
set Zaehler=0
:schleife10
(
move %~d0\Quellordner\Schleppleitung*%Karobau_Code%%Anlagennummer%%ARG_nr%_*.xls* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_3_Bauteillisten\Schleppleitungen
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife10_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife10
:schleife10_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Waermeberechnung verschieben

set ARG_nr=1
set Zaehler=0
:schleife11
(
move %~d0\Quellordner\*%Karobau_Code%%Anlagennummer%%ARG_nr%_Waermeberechnung*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\2_Hardware\2_4_Waermeberechnung
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife11_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife11
:schleife11_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
::echo SPS Backup verschieben

::set ARG_nr=1
::set Zaehler=0
:::schleife12
::(
::move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_*.zip %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\3_Software\3_1_SPS_Archiv
::)
::set /a zaehler=zaehler+1
::if %ARG_Anzahl% EQU %Zaehler% goto schleife12_en
::set /a ARG_nr=ARG_nr+1
::if %ARG_Anzahl% GTR %Zaehler% goto schleife12
:::schleife12_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Roboter Backup verschieben

set ARG_nr=1
set Zaehler=0
:schleife13
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%?????R* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\4_Roboter
::xcopy %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%?????R* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\4_Roboter /Y /S /D /U
::RD %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%?????*R* /S /Q
)
::XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX




::XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife13_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife13
:schleife13_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Geregelte Antriebe Datensicherung verschieben

set ARG_nr=1
set Zaehler=0
:schleife14
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%*SEW*.zip %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_1_Antriebstechnik\geregelte_Antriebe\Datensicherung
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife14_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife14
:schleife14_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Geregelte Antriebe Datensicherung verschieben

set ARG_nr=1
set Zaehler=0
:schleife15
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%*_FUSC_*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_1_Antriebstechnik\geregelte_Antriebe\Dokumentation
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%*_FUSC_*.SCX %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_1_Antriebstechnik\geregelte_Antriebe\Dokumentation
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%*_FUAL_??????.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_1_Antriebstechnik\geregelte_Antriebe\Dokumentation
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife15_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife15
:schleife15_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo BWS Datensicherung verschieben

set ARG_nr=1
set Zaehler=0
:schleife16
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%*B*_BWCF*.PDF %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_2_Sensoren\3-BWS
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%*.skp %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_2_Sensoren\3-BWS
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife16_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife16
:schleife16_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo RFID Datensicherung verschieben

set ARG_nr=1
set Zaehler=0
:schleife17
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_RFU_*.sdv %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_4_sonstige\RFID
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_RFU_*.spr %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\5_Parametersaetze\5_4_sonstige\RFID
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife17_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife17
:schleife17_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo DGUV3 Datensicherung verschieben

set ARG_nr=1
set Zaehler=0
:schleife18
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_UVV3_*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_2_DGUV_3
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife18_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife18
:schleife18_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
::echo DGUV3 Datensicherung verschieben

::set ARG_nr=1
::set Zaehler=0
:::schleife19
::(
::move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_UVV3_*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_2_DGUV_3
::)
::set /a zaehler=zaehler+1
::if %ARG_Anzahl% EQU %Zaehler% goto schleife19_en
::set /a ARG_nr=ARG_nr+1
::if %ARG_Anzahl% GTR %Zaehler% goto schleife19
::schleife19_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo BWS Protokoll verschieben

set ARG_nr=1
set Zaehler=0
:schleife20
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%*-BWSP-???*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_3_Sicherheitstechnik\BWS
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%*_BWCF_??????.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_3_Sicherheitstechnik\BWS
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife20_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife20
:schleife20_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Safety Matrix verschieben

set ARG_nr=1
set Zaehler=0
:schleife21
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_SAFM_??????.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_4_Sicherheitsmatrix
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_SAFM_??????.xls* %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_4_Sicherheitsmatrix
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife21_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife21
:schleife21_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Sicherheitskonzept verschieben

set ARG_nr=1
set Zaehler=0
:schleife22
(
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%_SIKO_??????.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_5_Sicherheitslayout

)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife22_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife22
:schleife22_en

::------------------------------------------------------------------------------------------------------------------------------------------------------
echo Pruefberichte verschieben

set ARG_nr=1
set Zaehler=0
:schleife23
(
move %~d0\Quellordner\*%Karobau_Code%%Anlagennummer%??%ARG_nr%*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_7_Pruefberichte
move %~d0\Quellordner\*%Karobau_Code%%Anlagennummer%??GA?*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_7_Pruefberichte
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%_EESP_KV66_??????.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_7_Pruefberichte
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_EESP_??????.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_7_Pruefberichte
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_EASP_??????.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_7_Pruefberichte
move %~d0\Quellordner\%Karobau_Code%%Anlagennummer%%ARG_nr%_*IEC_*.pdf %LW%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%\6_Zertifikate\6_7_Pruefberichte
)
set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife23_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife23
:schleife23_en


::-------------------------------------------------------Auswertung Leerordner--------------------------------------------------------------
echo Leere Ordner Übergeordnet ermitteln

@echo off &setlocal enabledelayedexpansion
set "folder=%lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%"
>"%Karobau_Code%%Anlagennummer%_leere_Ordner.csv" (for /f "delims=" %%a in ('dir /b /s /ad "%folder%"') do (
    set cnt=0
    for %%b in ("%%a\*") do set /a cnt+=1
    if !cnt! == 0 echo.%%a
))


set ARG_nr=1
set Zaehler=0
:schleife24


@echo off &setlocal enabledelayedexpansion
set "folder=%lw%:\11_Elektrik\%Karobau_Code%%Anlagennummer%%ARG_nr%"
>"%Karobau_Code%%Anlagennummer%%ARG_nr%_leere_Ordner.csv" (for /f "delims=" %%a in ('dir /b /s /ad "%folder%"') do (
    set cnt=0
    for %%b in ("%%a\*") do set /a cnt+=1
    if !cnt! == 0 echo.%%a
))

set /a zaehler=zaehler+1
if %ARG_Anzahl% EQU %Zaehler% goto schleife24_en
set /a ARG_nr=ARG_nr+1
if %ARG_Anzahl% GTR %Zaehler% goto schleife24
:schleife24_en



echo programmende
pause
exit















