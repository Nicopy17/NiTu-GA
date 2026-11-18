# ADR-002: RAG statt Training, Zahlen deterministisch aus der Quelle

- **Status:** vorgeschlagen
- **Datum:** 18.11.2026
- **Bezug:** AIC Feld 7, Quality Goals Q1 und Q2, Risiko #4 Halluzination, US 3.2 (#23), US 3.3 (#24), US 4.3 (#28)

## Kontext

Das System soll Berichte mit Firmendaten erstellen, ohne Zahlen zu erfinden (Q1: 100 % korrekte Zahlen mit Quelle)
und ohne dass Firmendaten dauerhaft gespeichert oder zum Training verwendet werden (Q2, DSGVO).
Franz misstraut KI-Tools genau aus diesen beiden Gründen.

## Entscheidung

1. Das Sprachmodell wird **nicht** mit Firmendaten trainiert oder feinabgestimmt. Es bekommt die nötigen
   Informationen nur zur Laufzeit als Kontext (Retrieval-Augmented Generation, RAG).
2. **Zahlen erzeugt nie das Sprachmodell.** Werte werden deterministisch aus der Datenquelle gelesen
   (Tabellen einlesen, Zuordnung zu Platzhaltern, Berechnungen wie Veränderung zum Vormonat im Code).
   Jede Zahl trägt ihre Quelle (Datei, Blatt, Zelle).
3. Das Sprachmodell formuliert nur Textabschnitte. Es bekommt dafür die bereits berechneten Zahlen als Kontext.
   Nach der Erzeugung prüft das System, dass jede Zahl im Text in den gelieferten Werten vorkommt.
   Sonst wird die Stelle markiert (US 3.3).
4. Rohdaten werden nach Auftragsende gelöscht (US 4.3). Dauerhaft bleiben nur Vorlage und bestätigte Zuordnungen.

## Betrachtete Alternativen

| Alternative | Vorteile | Nachteile |
|---|---|---|
| **RAG, Zahlen deterministisch (gewählt)** | Keine Firmendaten im Modell; jede Zahl prüfbar; Modell austauschbar | Mehr eigene Logik für Einlesen und Prüfen |
| Feinabstimmung des Modells mit Firmendaten | Modell „kennt“ die Firma | Daten stecken dauerhaft im Modell, nicht löschbar (DSGVO); teuer; Zahlen trotzdem nicht garantiert korrekt |
| Reines RAG, Modell schreibt auch die Zahlen | Einfach umzusetzen | Modell kann Zahlen verdrehen oder erfinden, Q1 nicht erreichbar |

## Konsequenzen

- **Positiv:** Q1 wird erreichbar, weil Zahlen nicht vom Modell stammen. Q2, weil keine Firmendaten im Modell landen.
  Das Risiko Halluzination (#4) beschränkt sich auf Formulierungen im Fließtext und wird dort automatisch geprüft.
- **Negativ:** Das Einlesen wechselnder Excel-Strukturen (#5) liegt vollständig beim System und braucht Rückfragen (US 2.2).
- **Folgearbeit:** Prüfregel für Zahlen im Fließtext festlegen (z. B. Rundung, Prozentangaben).
