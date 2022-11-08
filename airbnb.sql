-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 01 août 2022 à 13:12
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `airbnb`
--

-- --------------------------------------------------------

--
-- Structure de la table `logement`
--

DROP TABLE IF EXISTS `logement`;
CREATE TABLE IF NOT EXISTS `logement` (
  `id_logement` int(11) NOT NULL AUTO_INCREMENT,
  `logement_note` float NOT NULL,
  `logement_nombre_note` int(11) NOT NULL,
  `logement_titre` varchar(100) NOT NULL,
  `logement_photo` varchar(150) NOT NULL,
  `logement_superhote` tinyint(1) NOT NULL,
  `id_ville` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_logement`),
  KEY `logement_ville_FK` (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `logement`
--

INSERT INTO `logement` (`id_logement`, `logement_note`, `logement_nombre_note`, `logement_titre`, `logement_photo`, `logement_superhote`, `id_ville`) VALUES
(1, 4.56, 60, 'Villa Kévin', 'villa_kevin.jpg', 0, 1),
(2, 4.58, 12, 'Villa Albufeira - vieille ville et plage', 'villa_vieille_ville.jpg', 0, 1),
(3, 4.72, 18, 'Concierge Albufeira', 'villa_concierge.jpg', 0, 1),
(4, 5, 3, 'Villa Medronho à Coelha Beach', 'villa_medronho.jpg', 1, 1),
(5, 5, 9, 'Villa Cristina 17', 'villa_cristina_17.jpg', 1, 1),
(6, 4.91, 69, 'Aldela Cristina Villa 14', 'villa_cristina_14.jpg', 1, 1),
(7, 4.86, 22, 'Gîte près de la plage (5min en voiture)', 'gite.jpg', 1, 1),
(8, 4.87, 64, 'Villa Solar das Palmeiras', 'villa_solar.jpg', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id_ville` int(11) NOT NULL AUTO_INCREMENT,
  `ville_nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id_ville`, `ville_nom`) VALUES
(1, 'Albufeira'),
(2, 'Paris'),
(3, 'Londres'),
(4, 'Ibiza'),
(5, 'St-Tropez');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `logement`
--
ALTER TABLE `logement`
  ADD CONSTRAINT `logement_ville_FK` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
