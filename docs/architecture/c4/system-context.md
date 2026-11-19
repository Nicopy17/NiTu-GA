# Ebene 1: System Context – NiTu-GA

**Frage, die das Diagramm beantwortet:** Wer nutzt NiTu-GA und mit welchen anderen Systemen tauscht es Daten aus?

```mermaid
flowchart TB
    franz["<b>Franz Weber</b><br/>[Person]<br/>Geschäftsführer, erstellt den<br/>monatlichen Finanzbericht"]
    pruefer["<b>Prüfer/in</b><br/>[Person]<br/>Buchhaltung oder Steuerberatung,<br/>prüft und gibt Berichte frei"]

    nitu["<b>NiTu-GA</b><br/>[Software-System]<br/>Erstellt aus Vorlage und aktuellen<br/>Daten per Chat-Auftrag einen Bericht,<br/>jede Zahl mit Quellenangabe"]

    erp["<b>ERP-System</b><br/>[Software-System, extern]<br/>Liefert Finanzdaten als Export"]
    llm["<b>Sprachmodell</b><br/>[Software-System, extern]<br/>Formuliert Textabschnitte,<br/>lokal oder EU-gehostet"]

    franz -- "Lädt Vorlage und Excel-Datei hoch,<br/>gibt Auftrag per Chat,<br/>exportiert HTML<br/>[Browser, HTTPS]" --> nitu
    pruefer -- "Prüft Entwurf mit Quellen,<br/>gibt frei oder weist zurück<br/>[Browser, HTTPS]" --> nitu
    nitu -- "Liest Finanzdaten-Export<br/>[CSV/XLSX-Datei]" --> erp
    nitu -- "Sendet Kontext mit berechneten Zahlen,<br/>erhält Textvorschläge<br/>[HTTP/JSON]" --> llm

    classDef person fill:#08427b,stroke:#052e56,color:#fff
    classDef system fill:#1168bd,stroke:#0b4884,color:#fff
    classDef external fill:#999999,stroke:#6b6b6b,color:#fff
    class franz,pruefer person
    class nitu system
    class erp,llm external
```

**Legende:** dunkelblau = Person · blau = das betrachtete System · grau = externes System · Pfeil = Beziehung (Absicht [Technologie])

## Elemente

| Element | Typ | Aufgabe |
|---|---|---|
| Franz Weber | Person | Geschäftsführer, Hauptnutzer (siehe [Persona](../../analysis/persona.md)) |
| Prüfer/in | Person | Vier-Augen-Prinzip vor dem Versand (Org. Constraint, US 4.1) |
| NiTu-GA | Software-System | KI-Berichtsgenerator für Finanz-Monatsberichte |
| ERP-System | Externes System | Quelle der Finanzdaten, exportiert CSV oder XLSX |
| Sprachmodell | Externes System | Formuliert Fließtext, schreibt aber keine Zahlen ([ADR-002](../adr/ADR-002-rag-statt-training.md)) |

## Abweichungen zum Business Context im AIC

- **Excel-Dateien** sind kein eigenes System, sondern Dateien, die Franz hochlädt. Sie stecken in der Beziehung Franz → NiTu-GA.
- **Bisherige Berichte** werden als Vorlage von Franz hochgeladen und sind deshalb ebenfalls kein Nachbarsystem.
- **MS-Office-Umgebung / Browser** tauscht keine Daten mit NiTu-GA aus. Franz öffnet das exportierte HTML dort selbst.
- Das **Sprachmodell** bleibt ein Nachbarsystem, auch wenn es im Standardbetrieb im selben Netz läuft ([ADR-003](../adr/ADR-003-betrieb-im-unternehmen-oder-eu-hosting.md)). Es ist austauschbar und wird nicht vom Team entwickelt.
