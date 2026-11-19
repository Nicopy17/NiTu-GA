# ADR-002: RAG statt Training, Zahlen nie vom Sprachmodell

**Status:** vorgeschlagen

**Kontext:** Zahlen müssen 100 % stimmen und Firmendaten dürfen nicht im Modell landen.

**Entscheidung:** Das Modell wird nicht trainiert, es bekommt Daten nur zur Laufzeit (RAG). Zahlen werden per Code aus der Excel-Datei gelesen, das Modell schreibt nur Text.

**Alternativen:** Modell mit Firmendaten trainieren (DSGVO-Problem, teuer) · Modell schreibt auch die Zahlen (kann sie erfinden).

**Konsequenzen:** Korrekte Zahlen und Datenschutz. Dafür mehr eigener Code zum Einlesen der Excel-Dateien.
