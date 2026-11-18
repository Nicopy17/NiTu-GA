# Architektur

Aufbauend auf der Analyse (`docs/analysis/`) und den Anforderungen (`docs/requirements/`).

## Architecture Decision Records (ADR)

Die Hypothesen aus Feld 7 des [Architecture Inception Canvas](../analysis/aic.md#7-architectural-hypotheses)
werden als Entscheidungen festgehalten. Format nach Michael Nygard: Kontext, Entscheidung, Alternativen, Konsequenzen.

| Nr. | Entscheidung | Status |
|---|---|---|
| [ADR-001](adr/ADR-001-template-basierte-berichtserstellung.md) | Template-basierte Berichtserstellung | vorgeschlagen |
| [ADR-002](adr/ADR-002-rag-statt-training.md) | RAG statt Training, Zahlen deterministisch aus der Quelle | vorgeschlagen |
| [ADR-003](adr/ADR-003-betrieb-im-unternehmen-oder-eu-hosting.md) | Betrieb im Unternehmen, alternativ EU-Hosting | vorgeschlagen |
| [ADR-004](adr/ADR-004-technologie-stack-aus-den-labs.md) | Technologie-Stack aus den Labs übernehmen | vorgeschlagen |

„Vorgeschlagen“ heißt: im Team noch zu bestätigen. Nach der Bestätigung wird der Status auf „akzeptiert“ gesetzt.
Eine spätere Änderung ersetzt ein ADR durch ein neues („ersetzt durch ADR-00x“), alte ADRs werden nicht gelöscht.

## C4-Diagramme

Siehe [`c4/`](c4/): System Context (Ebene 1) und Container (Ebene 2).
