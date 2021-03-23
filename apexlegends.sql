-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Mar 2021, 16:45
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `apexlegends`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `legends`
--

CREATE TABLE `legends` (
  `id` int(11) NOT NULL,
  `nickname` varchar(150) NOT NULL DEFAULT '',
  `name` varchar(200) DEFAULT '',
  `gender` varchar(50) DEFAULT '',
  `age` varchar(100) DEFAULT '',
  `weight` varchar(100) DEFAULT '',
  `height` varchar(100) DEFAULT '',
  `type` varchar(200) DEFAULT '',
  `home_world` varchar(200) DEFAULT '',
  `image_src` text DEFAULT NULL,
  `time_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `legends`
--

INSERT INTO `legends` (`id`, `nickname`, `name`, `gender`, `age`, `weight`, `height`, `type`, `home_world`, `image_src`, `time_created`) VALUES
(113, 'Bangalore', 'Anita Williams', '38', 'Female ', '180 lbs (82 kg)', ' 6\'0\" (183 cm)', 'Offensive', 'Gridiron', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/f/f7/Bangalore.jpg/revision/latest/scale-to-width-down/300?cb=20200916154012', '2021-03-23 15:57:32'),
(114, 'Pathfinder', 'MRVN', '75', 'Male ', '937 lbs (425 kg)', ' 6\'2\" (188 cm)', 'Recon', 'Unknown', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/5/53/Pathfinder.jpg/revision/latest/scale-to-width-down/300?cb=20200916155242', '2021-03-23 15:57:35'),
(115, 'Revenant', 'Kaleb Cross[2]', '44 (as a human)[2] 313 (as a simulacrum)', 'Male ', 'null', ' 6\'8\" (203 cm)[3]', 'Offensive', 'Solace', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/5/59/Revenant.jpg/revision/latest/scale-to-width-down/300?cb=20200916155949', '2021-03-23 15:57:36'),
(116, 'Caustic', 'Dr. Alexander Maxwell Nox', '48', 'Male ', 'null', ' null', 'Defensive', 'Gaea', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/e/e7/Caustic.jpg/revision/latest/scale-to-width-down/300?cb=20200916154650', '2021-03-23 15:57:33'),
(117, 'Octane', 'Octavio Silva', '24', 'Male ', 'null', ' null', 'Offensive', 'Psamathe', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/d/d6/Octane.jpg/revision/latest/scale-to-width-down/300?cb=20200916155547', '2021-03-23 15:57:35'),
(118, 'Wattson', 'Natalie Paquette', '22', 'Female ', 'null', ' 5\'4\" (163 cm) [1]', 'Defensive', 'Solace', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/8/82/Wattson.jpg/revision/latest/scale-to-width-down/300?cb=20200916155642', '2021-03-23 15:57:36'),
(119, 'Lifeline', 'Ajay Che', '24', 'Female ', 'null', ' null', 'Support', 'Psamathe', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/4/4f/Lifeline.jpg/revision/latest/scale-to-width-down/300?cb=20200916154942', '2021-03-23 15:57:34'),
(120, 'Bloodhound', 'Unknown', 'Unknown', 'Non-binary ', 'null', ' null', 'Recon', 'Talos', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/0/05/Bloodhound.jpg/revision/latest/scale-to-width-down/300?cb=20200916154419', '2021-03-23 15:57:33'),
(121, 'Crypto', 'Tae Joon Park (박태준)', '31', 'Male ', '130 lbs (59 kg)', ' 5\'9\" (175 cm)', 'Recon', 'Gaea', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/1/1f/Crypto.jpg/revision/latest/scale-to-width-down/300?cb=20200916155756', '2021-03-23 15:57:33'),
(122, 'Gibraltar', 'Makoa Gibraltar', '30', 'Male ', '292 lbs (132 kg)', ' 6\'5\" (196 cm)', 'Defensive', 'Solace', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/8/8b/Gibraltar.jpg/revision/latest/scale-to-width-down/300?cb=20200916154804', '2021-03-23 15:57:34'),
(123, 'Loba', 'Loba Andrade', '34', 'Female ', 'null', ' null', 'Support', 'None', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/7/7d/Loba.jpg/revision/latest/scale-to-width-down/300?cb=20200511203238', '2021-03-23 15:57:35'),
(124, 'Fuse', 'Walter Fitzroy', '54', 'Male ', 'null', ' null', 'Offensive', 'Salvo', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/2/25/Fuse.jpg/revision/latest/scale-to-width-down/300?cb=20210129173412', '2021-03-23 15:57:33'),
(125, 'Horizon', 'Dr. Mary Somers', '37', 'Female ', 'null', ' null', 'Offensive', 'Psamathe', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/7/7d/Horizon.jpg/revision/latest/scale-to-width-down/300?cb=20201102162249', '2021-03-23 15:57:34'),
(126, 'Rampart', 'Ramya Parekh', '21', 'Female ', 'null', ' null', 'Defensive', 'Gaea', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/5/51/Rampart.jpg/revision/latest/scale-to-width-down/300?cb=20200816182752', '2021-03-23 15:57:36'),
(127, 'Wraith', 'Renee Hope Blasey[1]', '32', 'Female ', 'null', ' 5’4\" (163 cm)', 'Offensive', 'Typhon[2]', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/a/a4/Wraith.jpg/revision/latest/scale-to-width-down/300?cb=20200916155413', '2021-03-23 15:57:37'),
(128, 'Mirage', 'Elliott R. Witt', '30', 'Male ', 'null', ' 5\'11\"', 'Offensive', 'Solace', 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/a/a6/Mirage.jpg/revision/latest/scale-to-width-down/300?cb=20200527001856', '2021-03-23 15:57:35');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `login`, `password`) VALUES
(1, 'legenda', 'apexpredator');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `legends`
--
ALTER TABLE `legends`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `legends`
--
ALTER TABLE `legends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
