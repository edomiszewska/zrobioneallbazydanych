-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Lut 2024, 13:32
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ciucholand`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `klienci_id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `miasto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`klienci_id`, `imie`, `nazwisko`, `miasto`) VALUES
(1, 'Anna', 'Kowalska', 'Warszawa'),
(2, 'Jan', 'Nowak', 'Kraków'),
(3, 'Magdalena', 'Wiśniewska', 'Gdańsk'),
(4, 'Piotr', 'Jankowski', 'Wrocław'),
(5, 'Karolina', 'Kaczmarek', 'Poznań');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurierzy`
--

CREATE TABLE `kurierzy` (
  `kurier_id` int(11) NOT NULL,
  `firma_kurierska` enum('DHL','INPOST','ORLEN') DEFAULT NULL,
  `data` date DEFAULT NULL,
  `klienci_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kurierzy`
--

INSERT INTO `kurierzy` (`kurier_id`, `firma_kurierska`, `data`, `klienci_id`) VALUES
(1, 'DHL', '2024-02-10', 1),
(2, 'INPOST', '2024-02-11', 2),
(3, 'ORLEN', '2024-02-12', 3),
(4, 'DHL', '2024-02-13', 4),
(5, 'INPOST', '2024-02-14', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personel`
--

CREATE TABLE `personel` (
  `personel_id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `pozycja` enum('menadzer','sprzedawca','kasjer','magazynier') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `personel`
--

INSERT INTO `personel` (`personel_id`, `imie`, `nazwisko`, `pozycja`) VALUES
(1, 'Adam', 'Nowak', 'menadzer'),
(2, 'Ewa', 'Kowalska', 'sprzedawca'),
(3, 'Michał', 'Wiśniewski', 'kasjer'),
(4, 'Karolina', 'Jankowska', 'magazynier'),
(5, 'Paweł', 'Kaczmarek', 'sprzedawca');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `placówki`
--

CREATE TABLE `placówki` (
  `placowki_id` int(11) NOT NULL,
  `miasto` varchar(50) NOT NULL,
  `wojewodztwo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `placówki`
--

INSERT INTO `placówki` (`placowki_id`, `miasto`, `wojewodztwo`) VALUES
(1, 'Warszawa', 'Mazowieckie'),
(2, 'Kraków', 'Małopolskie'),
(3, 'Gdańsk', 'Pomorskie'),
(4, 'Wrocław', 'Dolnośląskie'),
(5, 'Poznań', 'Wielkopolskie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ubrania`
--

CREATE TABLE `ubrania` (
  `ubranie_id` int(11) NOT NULL,
  `typ ubrania` varchar(50) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `płeć` enum('kobieta','mezczyzna') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `ubrania`
--

INSERT INTO `ubrania` (`ubranie_id`, `typ ubrania`, `nazwa`, `płeć`) VALUES
(1, 'Koszula', 'Koszula męska biała', 'mezczyzna'),
(2, 'Koszula', 'Koszula damska różowa', 'kobieta'),
(3, 'Spodnie', 'Jeansy męskie niebieskie', 'mezczyzna'),
(4, 'Spodnie', 'Spódnica damska czarna', 'kobieta'),
(5, 'Kurtka', 'Kurtka przeciwdeszczowa unisex czarna', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `zamowienie_id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `klienci_id` int(11) DEFAULT NULL,
  `kurier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`zamowienie_id`, `data`, `klienci_id`, `kurier_id`) VALUES
(1, '2024-02-10', 1, 1),
(2, '2024-02-11', 2, 2),
(3, '2024-02-12', 3, 3),
(4, '2024-02-13', 4, 4),
(5, '2024-02-14', 5, 5);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`klienci_id`);

--
-- Indeksy dla tabeli `kurierzy`
--
ALTER TABLE `kurierzy`
  ADD PRIMARY KEY (`kurier_id`),
  ADD KEY `klienci_id` (`klienci_id`);

--
-- Indeksy dla tabeli `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`personel_id`);

--
-- Indeksy dla tabeli `placówki`
--
ALTER TABLE `placówki`
  ADD PRIMARY KEY (`placowki_id`);

--
-- Indeksy dla tabeli `ubrania`
--
ALTER TABLE `ubrania`
  ADD PRIMARY KEY (`ubranie_id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`zamowienie_id`),
  ADD KEY `klienci_id` (`klienci_id`),
  ADD KEY `kurier_id` (`kurier_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `klienci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `kurierzy`
--
ALTER TABLE `kurierzy`
  MODIFY `kurier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `personel`
--
ALTER TABLE `personel`
  MODIFY `personel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `placówki`
--
ALTER TABLE `placówki`
  MODIFY `placowki_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `ubrania`
--
ALTER TABLE `ubrania`
  MODIFY `ubranie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `zamowienie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `kurierzy`
--
ALTER TABLE `kurierzy`
  ADD CONSTRAINT `kurierzy_ibfk_1` FOREIGN KEY (`klienci_id`) REFERENCES `klienci` (`klienci_id`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klienci_id`) REFERENCES `klienci` (`klienci_id`),
  ADD CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`kurier_id`) REFERENCES `kurierzy` (`kurier_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
