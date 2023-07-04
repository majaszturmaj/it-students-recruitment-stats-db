
---------------------------------------------------------------------------
-- Wyświetlanie pełnych informacji o kandydacie na podstawie tabeli Kandydaci oraz CV kandydata
EXEC szukaj_kandydatow @KandydatIDs = 'majszt1,kacwoj1'; -- podajemy dowolną ilość ID kandydatów po przecinku



----------Wyświetlanie Imienia i Nazwiska Kandydata wraz ze wszystkimi jego Podaniami

EXEC pokaz_podania_kandydata 'jankow1';


--- lista kandydatów, którzy zostali zaakceptowani przez daną firmę, wraz z ich CV

EXEC przyjmowane_cv_przez_firmy @Firma = 'nokia'; 







---------------------------------------------------------------------------------------------------------------------------------------------------

