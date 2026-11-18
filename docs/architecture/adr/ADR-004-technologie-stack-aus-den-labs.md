# ADR-004: Technologie-Stack aus den Labs übernehmen

- **Status:** vorgeschlagen
- **Datum:** 18.11.2026
- **Bezug:** AIC Feld 5 (begrenztes Budget, 2er-Team), Feld 6, ADR-002, ADR-003

## Kontext

Das Team (Nico, Turahan) hat in den Lab-Sessions 1–5 einen RAG-Chatbot mit Docker, Streamlit, LangChain,
Ollama und ChromaDB gebaut. Die Zeit bis Session 12 ist begrenzt. Für den Betrieb im Unternehmen (ADR-003)
werden lokal lauffähige, kostenlose Komponenten gebraucht.

## Entscheidung

| Baustein | Technologie |
|---|---|
| Web-Oberfläche mit Chat | Streamlit (Python) |
| Anwendungslogik, Ablauf, Prompting | Python mit LangChain |
| Einlesen von Excel und CSV | pandas, openpyxl |
| Vorlagen und HTML-Ausgabe | Jinja2-Vorlagen, HTML |
| Diagramme | plotly (als HTML einbettbar) |
| Wissensspeicher für RAG | ChromaDB |
| Vorlagen, Zuordnungen, Freigaben | SQLite |
| Sprachmodell (lokal) | Ollama mit einem offenen Modell |
| Auslieferung | Docker Compose |

## Betrachtete Alternativen

| Alternative | Vorteile | Nachteile |
|---|---|---|
| **Stack aus den Labs (gewählt)** | Bekannt, lokal lauffähig, kostenlos, schnell umsetzbar | Streamlit ist für komplexe Oberflächen begrenzt |
| Eigene Web-App (z. B. React + FastAPI) | Flexiblere Oberfläche | Deutlich mehr Aufwand, neues Wissen nötig |
| Fertige KI-Plattform eines Anbieters | Wenig Eigenentwicklung | Kosten, Abhängigkeit, Datenschutz (ADR-003) |

## Konsequenzen

- **Positiv:** Das Team kann auf vorhandenem Code und Wissen aufbauen. Alles läuft lokal per `docker compose up`.
- **Negativ:** Die Bearbeitbarkeit im Browser ist mit Streamlit eingeschränkt, das HTML wird deshalb exportiert und extern bearbeitet (US 4.2).
- **Folgearbeit:** Modell für Ollama auswählen und auf Deutsch sowie Antwortzeit testen.
