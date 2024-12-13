MÅL

Implementera databasmodellen från uppgift 1 i en databashanterare (DBMS), och konstruera utifrån kraven databastransaktioner (SQL-satser) som också implementeras.

GENOMFÖRANDE

Utgå från företagsbeskrivningen och modellen som ni designat i uppgift 1. Identifiera vilka typer av aktörer/användare som kommer nyttja systemet samt de viktigaste databastransaktionerna för respektive aktör (vissa aktörer kan använda samma transaktioner), totalt minst 12 unika transaktioner.
Installera en databashanterare (DBMS) om ni inte redan gjort det och implementera sedan den logiska databasmodellen ni designat i uppgift 1, i din DBMS. Lägg in testdata (det kan behövas några rader för att ni ska kunna se om en SQL-sats ger rätt svar) och implementerade (minst) 12 viktigaste SQL-satserna som identifierats ovan.

Följande gäller:
• SELECT, UPDATE och INSERT ska vara representerade
• Minst 3 av SQL-satserna ska göra en sökning i flera tabeller (visa både JOIN & Nestad)
• Använd minst en funktion, t.ex. Count() (och Group by om möjligt).

REDOVISNING
Rapporten ska innehålla en beskrivning av de krav som ställs på systemet, dess användningsområden samt en lista över de aktörer som kommer att använda systemet och de transaktioner de ska kunna utföra. Observera att rapporten endast ska innehålla den logiska datamodellen. Detta inkluderar en logisk databasdesign med tillhörande modell samt beskrivningar av relationer, entiteter och attribut. Använd materialet från "Examinationsuppgift 1 – Datamodellering", men uppdatera modellen och vidareutveckla där det behövs. Till exempel kan ni behöva justera relationerna mellan entiteter i er databasmodell för att underlätta formuleringen av SQL-satser.

Redovisa de implementerade transaktionerna i rapporten med hjälp av skärmdumpar som på samma bild visar SQL-sats inklusive testdata som bekräftelsen på att koden körts utan problem.

I er rapport ska ni även reflektera över ert arbete och de förändringar som behövde genomföras för att SQL-transaktionerna skulle kunna köras korrekt. Diskutera eventuella justeringar av er datamodell eller SQL-kod som var nödvändiga för att uppnå önskade resultat. Reflektera även över de utmaningar ni stötte på under implementeringen och hur dessa löstes. Vad har ni lärt er av dessa erfarenheter och hur påverkade det slutresultatet?
