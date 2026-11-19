# ADR-002: RAG statt Training

- **Entscheidung:** Das Sprachmodell wird nicht trainiert. Zahlen liest der Code aus Excel, das Modell schreibt nur Text.
- **Grund:** Keine erfundenen Zahlen, keine Firmendaten im Modell.
- **Nachteil:** Mehr eigener Code zum Einlesen.
