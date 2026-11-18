# ADR-003: Betrieb im Unternehmen, alternativ EU-Hosting

- **Status:** vorgeschlagen
- **Datum:** 18.11.2026
- **Bezug:** AIC Feld 5 (DSGVO, begrenztes Budget), Feld 7 (EU-Hosting), Quality Goal Q2, US 4.3 (#28)

## Kontext

Finanz- und Personaldaten dürfen das Unternehmen nicht unkontrolliert verlassen (Q2: 0 Übertragungen
außerhalb der freigegebenen Umgebung). Ein Mittelständler hat ein begrenztes Budget und meist keine eigene KI-Infrastruktur.
Das Sprachmodell ist im Business Context ein Nachbarsystem und soll austauschbar bleiben.

## Entscheidung

- **Standard:** Das gesamte System einschließlich Sprachmodell läuft **im Unternehmen** auf einem eigenen Rechner
  (z. B. ein kleiner Server oder ein Edge-Gerät wie im Lab), als Container-Installation. Es gehen keine Daten nach außen.
- **Alternative für Kunden ohne eigene Hardware:** Betrieb bei einem Anbieter mit Rechenzentrum in der EU,
  mit Vertrag zur Auftragsverarbeitung (AVV nach Art. 28 DSGVO). Der Anbieter darf keine Daten zum Training verwenden.
- Das Sprachmodell wird über eine Schnittstelle angebunden, sodass ein lokales Modell oder ein EU-Dienst
  ohne Änderung am restlichen System genutzt werden kann.
- Dienste außerhalb der EU sind ausgeschlossen.

## Betrachtete Alternativen

| Alternative | Vorteile | Nachteile |
|---|---|---|
| **Lokal im Unternehmen (gewählt, Standard)** | Daten verlassen das Haus nicht; erfüllt Franz' Bedürfnis direkt | Lokale Modelle sind kleiner und langsamer (Risiko „lange Laufzeit“); Hardware nötig |
| EU-Hosting mit AVV (gewählt, Alternative) | Keine eigene Hardware; stärkere Modelle | Daten verlassen das Haus, wenn auch vertraglich geschützt; laufende Kosten |
| Beliebiger Cloud-KI-Dienst (z. B. USA) | Stärkste Modelle, einfach | Datenübermittlung in Drittländer; widerspricht Q2 und Franz' Misstrauen |

## Konsequenzen

- **Positiv:** Q2 ist im Standardbetrieb durch die Bauweise erfüllt und per Netzwerk-Log prüfbar.
- **Negativ:** Die Antwortzeit hängt von der lokalen Hardware ab. Das Ziel „Entwurf in ≤ 2 Minuten“ (US 3.1) muss auf der Zielhardware gemessen werden.
- **Folgearbeit:** Mindestanforderungen an die Hardware bestimmen; Kriterien für die Auswahl eines EU-Anbieters festhalten.
