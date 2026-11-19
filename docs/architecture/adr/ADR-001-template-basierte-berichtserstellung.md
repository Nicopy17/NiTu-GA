# ADR-001: Template-basierte Berichtserstellung

- **Status:** vorgeschlagen
- **Datum:** 18.11.2026
- **Bezug:** AIC Feld 7, Functional Overview 1 und 4, Epic E1 (#13), US 1.1 (#17), US 3.1 (#22)

## Kontext

Franz will, dass sein bisheriges Layout erhalten bleibt und sich nur die Zahlen ändern
(Business Case, Persona-Bedürfnis „übernimmt vorhandene Layouts aus Vorlage“). Ein frei generierter
Bericht sieht jeden Monat anders aus und macht Vergleiche schwer. Gleichzeitig ist „komplexe Layouts
erhalten und bearbeitbar machen“ ein bekanntes Risiko (AIC Feld 8).

## Entscheidung

Der Bericht wird aus einer **Vorlage** erzeugt, die aus einem bestehenden Bericht abgeleitet wird.
In der Vorlage werden Platzhalter für Zahlen, Tabellen, Diagramme und Textabschnitte markiert.
Das System füllt nur diese Platzhalter, Layout und feste Inhalte bleiben unverändert.
Ausgabeformat ist HTML (Tech. Constraint), die Vorlage wird dafür intern als HTML gespeichert.

## Betrachtete Alternativen

| Alternative | Vorteile | Nachteile |
|---|---|---|
| **Vorlage mit Platzhaltern (gewählt)** | Layout bleibt exakt; Änderungen nachvollziehbar; das Sprachmodell kann das Layout nicht beschädigen | Vorlage muss einmal vorbereitet werden; neue Berichtstypen brauchen eine neue Vorlage |
| Bericht komplett vom Sprachmodell erzeugen | Kein Vorbereitungsaufwand, flexibel | Layout ändert sich jedes Mal; hohes Halluzinationsrisiko; widerspricht dem Business Case |
| Direkt die .pptx bearbeiten | Franz bleibt in PowerPoint | Komplexes Dateiformat, schwer zuverlässig zu verändern; Output soll laut Constraint HTML sein |

## Konsequenzen

- **Positiv:** Quality Goal Q1 wird unterstützt, weil feststeht, welche Stelle welchen Wert bekommt.
  Q3 Bedienbarkeit, weil Franz sein gewohntes Layout wiedererkennt.
- **Negativ:** Beim ersten Hochladen müssen Platzhalter erkannt oder bestätigt werden (US 1.1).
  Das Umwandeln von .pptx in HTML kann Layout-Details verlieren und muss getestet werden.
- **Folgearbeit:** Format der Platzhalter festlegen; Prototyp der .pptx-zu-HTML-Umwandlung mit einem echten Bericht.
