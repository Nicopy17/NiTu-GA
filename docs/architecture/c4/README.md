# C4-Diagramme

Nach dem C4-Modell von Simon Brown: System Context → Container → Component → Code.
Hier sind die ersten beiden Ebenen ausgearbeitet. Component und Code folgen, sobald implementiert wird.

- [`system-context.md`](system-context.md) – Ebene 1: NiTu-GA, seine Nutzer und Nachbarsysteme
- [`container.md`](container.md) – Ebene 2: die lauffähigen Bausteine von NiTu-GA
- [`workspace.dsl`](workspace.dsl) – beide Ebenen als Structurizr-DSL (Quelle, z. B. mit Structurizr Lite darstellbar)

Regeln, an die sich die Diagramme halten:

- Jedes Diagramm hat Titel, Ebene und Legende.
- Jedes Element hat Typ, Name, bei Containern die Technologie und eine kurze Beschreibung seiner Aufgabe.
- Jede Beziehung ist beschriftet: was passiert und, wo sinnvoll, womit (z. B. HTTP, SQL).
- Externe Systeme werden als Blackbox gezeigt, ihre inneren Container nicht.
- Entscheidungen hinter den Diagrammen stehen in den [ADRs](../adr/), nicht im Diagramm.
