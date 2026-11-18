# Ebene 2: Container – NiTu-GA

**Frage, die das Diagramm beantwortet:** Aus welchen lauffähigen Bausteinen besteht NiTu-GA, und wie arbeiten sie zusammen?
Technologien nach [ADR-004](../adr/ADR-004-technologie-stack-aus-den-labs.md), Betrieb nach [ADR-003](../adr/ADR-003-betrieb-im-unternehmen-oder-eu-hosting.md).

```mermaid
flowchart TB
    franz["<b>Franz Weber</b><br/>[Person]<br/>Geschäftsführer"]
    pruefer["<b>Prüfer/in</b><br/>[Person]<br/>Buchhaltung / Steuerberatung"]

    subgraph nitu["NiTu-GA [Software-System]"]
        web["<b>Web-Anwendung</b><br/>[Container: Python, Streamlit, LangChain]<br/>Chat-Oberfläche, Vorlagenverwaltung,<br/>Einlesen der Daten, Befüllen der Vorlage,<br/>Prüfung der Zahlen, Freigabe und Export"]
        db[("<b>Datenbank</b><br/>[Container: SQLite]<br/>Vorlagen-Metadaten, gemerkte<br/>Zuordnungen, Freigaben")]
        vec[("<b>Wissensspeicher</b><br/>[Container: ChromaDB]<br/>Abschnitte aus Vorlage und Daten<br/>als Kontext für das Sprachmodell")]
        files[("<b>Dateiablage</b><br/>[Container: Docker-Volume]<br/>Vorlagen als HTML, hochgeladene<br/>Rohdaten (max. 24 h), Exporte")]
    end

    erp["<b>ERP-System</b><br/>[Software-System, extern]"]
    llm["<b>Sprachmodell</b><br/>[Software-System, extern]<br/>z. B. Ollama lokal oder EU-Dienst"]

    franz -- "Lädt Vorlage und Daten hoch,<br/>gibt Auftrag, exportiert<br/>[Browser, HTTPS]" --> web
    pruefer -- "Prüft und gibt frei<br/>[Browser, HTTPS]" --> web
    web -- "Liest und schreibt Vorlagen,<br/>Zuordnungen, Freigaben<br/>[SQL]" --> db
    web -- "Speichert und sucht Kontext-Abschnitte<br/>[Python-Client]" --> vec
    web -- "Speichert Uploads und Exporte,<br/>löscht Rohdaten nach 24 h<br/>[Dateisystem]" --> files
    web -- "Liest Finanzdaten-Export<br/>[CSV/XLSX]" --> erp
    web -- "Sendet Kontext mit Zahlen,<br/>erhält Textvorschläge<br/>[HTTP/JSON]" --> llm

    classDef person fill:#08427b,stroke:#052e56,color:#fff
    classDef container fill:#438dd5,stroke:#2e6295,color:#fff
    classDef external fill:#999999,stroke:#6b6b6b,color:#fff
    class franz,pruefer person
    class web,db,vec,files container
    class erp,llm external
    style nitu fill:none,stroke:#0b4884,stroke-dasharray:5 5
```

**Legende:** dunkelblau = Person · hellblau = Container von NiTu-GA · Zylinder = Datenspeicher · grau = externes System · gestrichelter Rahmen = Systemgrenze · Pfeil = Beziehung (Absicht [Technologie])

## Container

| Container | Technologie | Aufgabe | Bezug |
|---|---|---|---|
| Web-Anwendung | Python, Streamlit, LangChain, pandas, Jinja2, plotly | Oberfläche und gesamte Logik: Vorlagen verwalten, Excel/CSV einlesen, Werte deterministisch zuordnen und berechnen, Sprachmodell für Text anfragen, Zahlen im Text prüfen, HTML erzeugen | E1–E4, ADR-001, ADR-002 |
| Datenbank | SQLite | Dauerhafte, kleine Daten: welche Vorlagen es gibt, gemerkte Spaltenzuordnungen, Freigabe-Protokoll | US 1.2, US 2.2, US 4.1 |
| Wissensspeicher | ChromaDB | Durchsuchbare Abschnitte als Kontext für Formulierungen (RAG), keine Rohdaten über das Auftragsende hinaus | ADR-002, US 4.3 |
| Dateiablage | Docker-Volume | Vorlagen-HTML dauerhaft; Rohdaten nur bis 24 h nach Auftragsende; exportierte Berichte | US 1.1, US 4.2, US 4.3 |

## Hinweise

- Oberfläche und Logik liegen bewusst in **einem** Container, weil Streamlit beides in einem Prozess ausführt (ADR-004).
  Wird die Logik später größer, kann sie als eigener API-Container ausgelagert werden. Das wäre dann ein neues ADR.
- Das Sprachmodell wird nicht als Container von NiTu-GA gezeigt, weil es ein austauschbares externes System ist.
  Wo es im Standardbetrieb läuft (im selben Netz), gehört in ein späteres Deployment-Diagramm.
- Das ERP-System wird im ersten Schritt nicht per Schnittstelle angebunden. Der Pfeil steht für den Export, den Franz oder die Buchhaltung bereitstellt.
