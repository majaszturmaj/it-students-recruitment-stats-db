-- Wyświetlanie wszystkich kandydatów w kolejności od najwyższego poziomu podanej umiejętności
-- Kandydaci, który w ogóle danej umiejętności nie posiadają są pominięci.
/*
SELECT k.KandydatID, k.Imie, k.Nazwisko, k.Plec, k.RokUrodzenia, k.TrybStudiow,
       c.Edukacja, c.Doswiadczenie, j.Polski, j.Angielski, j.Niemiecki, j.Inny,
       u.Git, u.Linux, u.MachineLearning, u.Bash, u.JavaScript, u.Python, u.Java,
       u.Kotlin, u.PHP, u.C#, u.R, u.Ruby, u.C, u.Cpp, u.Matlab, u.SQL_, u.HTML,
       u.CSS, u.Rust, u.Perl
FROM Kandydaci k
JOIN CV c ON k.KandydatID = c.KandydatID
JOIN dict.Szkoly s ON c.Edukacja = s.SzkolaID
JOIN dict.DoswiadczeniaZawodowe d ON c.Doswiadczenie = d.DoswiadczenieID
JOIN CV_JezykiObce j ON c.CV_ID = j.CV_ID
JOIN CV_Umiejetnosci u ON c.CV_ID = u.CV_ID
WHERE u.C# IS NOT NULL
ORDER BY u.C# DESC;
*/

/*
--------- Wyświetlanie kandydatów w kolejności najczęściej akceptowanych CV

SELECT Kandydaci.KandydatID, Kandydaci.Imie, Kandydaci.Nazwisko, COUNT(StatystykiCV.CV_ID) AS LiczbaPrzyjec
FROM Kandydaci
JOIN CV ON Kandydaci.KandydatID = CV.KandydatID
LEFT JOIN StatystykiCV ON CV.CV_ID = StatystykiCV.CV_ID AND StatystykiCV.Przyjecia > 0
GROUP BY Kandydaci.KandydatID, Kandydaci.Imie, Kandydaci.Nazwisko
HAVING COUNT(StatystykiCV.CV_ID) > 0
ORDER BY LiczbaPrzyjec DESC;

*/


-- Wyświetlanie statystyki firm sortując ilością odrzuceń ----

SELECT F.Nazwa, SF.Odrzucenia 
FROM dict.Firmy F
JOIN StatystykiFirmy SF ON F.FirmaID = SF.FirmaID
ORDER BY SF.Odrzucenia DESC; 