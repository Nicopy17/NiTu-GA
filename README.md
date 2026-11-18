# NiTu-GA – KI-Berichtsgenerator für Finanz-Monatsberichte

Projekt im Rahmen von Technische Informatik 2 (Lab Prof. Baumgartl, HS Esslingen).

## Projektidee

Geschäftsführer im Mittelstand bauen ihre monatlichen Finanzberichte jedes Mal per Copy-Paste neu,
obwohl sich meist nur ein paar Zahlen ändern. NiTu-GA soll aus einer vorhandenen Vorlage und den
aktuellen Daten (z. B. aus Excel oder ERP) per Chat-Auftrag einen aktualisierten Bericht erzeugen.
Das Layout bleibt erhalten, jede Zahl ist mit ihrer Quelle nachvollziehbar und die Firmendaten
bleiben im Unternehmen.

Kernablauf:

1. Vorlage auswählen und speichern
2. Datenquelle anfügen
3. Auftrag per Chat geben („Baue mir einen Finanzbericht“)
4. Zahlen und Diagramme werden aktualisiert, das Layout bleibt gleich
5. Export als bearbeitbares HTML

## Team

- Nico
- Turahan

## Struktur

| Ordner | Inhalt |
|---|---|
| `docs/analysis/` | Ergebnisse der Analyse: Persona Canvas, Architecture Inception Canvas (AIC), Fotos |

## Arbeitsweise

Jede Aufgabe wird als GitHub Issue erfasst, in einem eigenen Branch bearbeitet und per Pull Request
(`closes #<nr>`) nach `main` gemergt.
