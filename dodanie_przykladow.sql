
-- dodajmy po prostu cały, nowy wpis do bazy danych po tym jak Jan Kowalski
-- złożył swoje podanie do nokii

EXECUTE dodanie_kandydata_cv_podania    @KandydatID = 'jankow1', 
                                        @Imie = 'Jan',
                                        @Nazwisko = 'Kowalski',
                                        @Plec = 'M',
                                        @RokUrodzenia = 2000,
                                        @TrybStudiow = 'N',
                                        -- tabela CV
                                        @Doswiadczenie = 'brak',
                                        @Edukacja = 'tech_inn',
                                        -- tabela CV_JezykiObce
                                        @Polski = 'na',
                                        @Angielski = 'B1',
                                        @Niemiecki = 'A2',
                                        @Inny = 'Czeski - B1',
                                        -- tabela CV_Umiejetnosci
                                        @Git = 5,
                                        @Cpp = 3,
                                        @SQL_ = 2,
                                        @HTML = 5,
                                        -- tabela Podania
                                        @FirmaID = 'nokia',
                                        @Stan = 'zlozono';


-- dodajmy cały nowy wpis dla Mai Szturmaj, która złożyła podanie do nokii, ale
-- zdążyła się już dowiedzieć, że została odrzucona

EXECUTE dodanie_kandydata_cv_podania    @KandydatID = 'majszt1', 
                                        @Imie = 'Maja',
                                        @Nazwisko = 'Szturmaj',
                                        @Plec = 'K',
                                        @RokUrodzenia = 2002,
                                        @TrybStudiow = 'S',
                                        -- tabela CV
                                        @Doswiadczenie = 'brak',
                                        @Edukacja = 'lic_inn',
                                        -- tabela CV_JezykiObce
                                        @Polski = 'na',
                                        @Angielski = 'B1',
                                        -- tabela CV_Umiejetnosci
                                        @Git = 2,
                                        @Linux = 2,
                                        @MachineLearning = 3,
                                        @Bash = 2,
                                        @Python = 2,
                                        @Java = 1,
                                        @C# = 2,
                                        @SQL_ = 2,
                                        -- tabela Podania
                                        @FirmaID = 'Nokia', -- ups, ktoś tym razem nokia została
                                                            -- napisana z dużej litery. Problem?
                                        @Stan = 'odrzucono';


-- dodajmy Piotra Nowaka, który dowiedział się o bazie danych ze statystykami, ma już gotowe CV,
-- ale jescze go nigdzie nie wysłał

EXECUTE dodanie_kandydata   @KandydatID = 'pionow1',
                            @Imie = 'Piotr',
                            @Nazwisko = 'Nowak',
                            @Plec = 'M',
                            @RokUrodzenia = 2001,
                            @TrybStudiow = 'N';

-- Piotr Nowak utworzył już swoje CV i chce czym prędzej podzielić się nim z bazą danych

EXECUTE dodanie_cv  @KandydatID = 'pionow1',
                    -- Do CV --
                    @Doswiadczenie = 'brak',
                    @Edukacja = 'tech_tel',
                    -- Do CV_JezykiObce --
                    @Polski = 'na',
                    @Angielski = 'B1',
                    -- Do CV_Umiejetnosci --
                    @Java = 5,
                    @C# = 3,
                    @C = 2,
                    @CSS = 1;

-- Sandra Dałowska też jeszcze nie złożyła podania, ale już chce się wpisać do kandydatów

EXECUTE dodanie_kandydata   @KandydatID = 'sandal1',
                            @Imie = 'Sandra',
                            @Nazwisko = 'Dałowska',
                            @Plec = 'K',
                            @RokUrodzenia = 2002,
                            @TrybStudiow = 'S';

-- Chwilę później zrobiła już CV i wysłała do jednej z firm
-- Użyjemy w tym celu dwóch procedur, jednej po drugiej

EXECUTE dodanie_cv  @KandydatID = 'sandal1',
                    -- Do CV --
                    @Doswiadczenie = 'brak',
                    @Edukacja = 'tech_inf',
                    -- Do CV_JezykiObce --
                    @Polski = 'na',
                    @Angielski = 'C1',
                    -- Do CV_Umiejetnosci --
                    @Git = 5,
                    @Bash = 3,
                    @JavaScript = 3,
                    @HTML = 4,
                    @CSS = 1;

DECLARE @CV_ID smallint
SELECT @CV_ID = CV_ID FROM CV WHERE KandydatID = 'sandal1'
EXECUTE dodanie_podania @CV_ID = @CV_ID,
                        @FirmaID = 'accenture',
                        @NOWY_STAN = 'zlozono';

-- Jan Kowalski, którego dodaliśy na początku został zaproszony na rozmowę,
-- Ale po rozmowie nikt się do niego nie odezwał, chociaż minął dłuższy czas.
-- Zaktualizujmy jego status podania i co za tym idzie - statystyki.

DECLARE @PodanieID smallint
SELECT @PodanieID = PodanieID FROM Podania WHERE KandydatID = 'jankow1'
EXECUTE akt_statusu_podania @NOWY_STAN = 'rozmowa_neg',
                            @PodanieID = @PodanieID;

-- Jan Kowalski pomyślał, że jego niepowodzenie to wina CV, więc utworzył drugie:

EXECUTE dodanie_cv  @KandydatID = 'jankow1',
                    -- Do CV --
                    @Doswiadczenie = 'brak',
                    @Edukacja = 'tech_inn',
                    -- Do CV_JezykiObce --
                    @Polski = 'na',
                    @Angielski = 'B2',
                    @Niemiecki = 'B1',
                    -- Do CV_Umiejetnosci --
                    @Git = 5,
                    @Cpp = 4,
                    @SQL_ = 3,
                    @HTML = 5,
                    @CSS = 3;

-- ... po czym złożył je do następnej firmy

DECLARE @OstatnieCV_ID smallint;
SELECT @OstatnieCV_ID = MAX(CV_ID) FROM CV WHERE KandydatID = 'jankow1';
EXECUTE dodanie_podania @CV_ID = @OstatnieCV_ID,
                        @FirmaID = 'accenture',
                        @NOWY_STAN = 'zlozono';
				
-- Szczęśliwa jedyna osoba, która została przyjęta (po rozmowie)
EXECUTE dodanie_kandydata_cv_podania    @KandydatID = 'annmaz1', 
                                        @Imie = 'Anna',
                                        @Nazwisko = 'Mazur',
                                        @Plec = 'K',
                                        @RokUrodzenia = 2002,
                                        @TrybStudiow = 'S',
                                        -- tabela CV
                                        @Doswiadczenie = 'brak',
                                        @Edukacja = 'lic_mat',
                                        -- tabela CV_JezykiObce
                                        @Polski = 'na',
                                        @Angielski = 'B2',
                                        -- tabela CV_Umiejetnosci
                                        @Git = 1,
                                        @Cpp = 2,
                                        @SQL_ = 5,
                                        @HTML = 1,
                                        -- tabela Podania
                                        @FirmaID = 'techbud',
                                        @Stan = 'rozmowa_poz';