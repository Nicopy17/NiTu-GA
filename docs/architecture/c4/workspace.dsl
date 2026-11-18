workspace "NiTu-GA" "KI-Berichtsgenerator für Finanz-Monatsberichte" {

    model {
        franz = person "Franz Weber" "Geschäftsführer, erstellt den monatlichen Finanzbericht."
        pruefer = person "Prüfer/in" "Buchhaltung oder Steuerberatung, prüft und gibt Berichte frei."

        nitu = softwareSystem "NiTu-GA" "Erstellt aus Vorlage und aktuellen Daten per Chat-Auftrag einen Bericht, jede Zahl mit Quellenangabe." {
            web = container "Web-Anwendung" "Chat-Oberfläche, Vorlagenverwaltung, Einlesen der Daten, Befüllen der Vorlage, Prüfung der Zahlen, Freigabe und Export." "Python, Streamlit, LangChain"
            db = container "Datenbank" "Vorlagen-Metadaten, gemerkte Zuordnungen, Freigaben." "SQLite" "Datenbank"
            vec = container "Wissensspeicher" "Abschnitte aus Vorlage und Daten als Kontext für das Sprachmodell." "ChromaDB" "Datenbank"
            files = container "Dateiablage" "Vorlagen als HTML, hochgeladene Rohdaten (max. 24 h), Exporte." "Docker-Volume" "Datenbank"
        }

        erp = softwareSystem "ERP-System" "Liefert Finanzdaten als Export." "Extern"
        llm = softwareSystem "Sprachmodell" "Formuliert Textabschnitte, lokal (z. B. Ollama) oder EU-gehostet." "Extern"

        franz -> web "Lädt Vorlage und Daten hoch, gibt Auftrag, exportiert" "Browser, HTTPS"
        pruefer -> web "Prüft Entwurf mit Quellen, gibt frei oder weist zurück" "Browser, HTTPS"
        web -> db "Liest und schreibt Vorlagen, Zuordnungen, Freigaben" "SQL"
        web -> vec "Speichert und sucht Kontext-Abschnitte" "Python-Client"
        web -> files "Speichert Uploads und Exporte, löscht Rohdaten nach 24 h" "Dateisystem"
        web -> erp "Liest Finanzdaten-Export" "CSV/XLSX"
        web -> llm "Sendet Kontext mit berechneten Zahlen, erhält Textvorschläge" "HTTP/JSON"
    }

    views {
        systemContext nitu "SystemContext" "Ebene 1: System Context von NiTu-GA" {
            include *
            autolayout tb
        }

        container nitu "Container" "Ebene 2: Container von NiTu-GA" {
            include *
            autolayout tb
        }

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Datenbank" {
                shape Cylinder
            }
            element "Extern" {
                background #999999
                color #ffffff
            }
        }
    }
}
