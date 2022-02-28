-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 28 fév. 2022 à 09:51
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `commerce`
--
CREATE DATABASE IF NOT EXISTS `commerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `commerce`;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Id_client` char(4) NOT NULL,
  `Nom` varchar(40) NOT NULL,
  `Prenom` varchar(40) NOT NULL,
  `Adresse` varchar(60) NOT NULL,
  `Numéro_de_téléphone` varchar(10) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Mot_de_passe` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Id_client`, `Nom`, `Prenom`, `Adresse`, `Numéro_de_téléphone`, `Email`, `Mot_de_passe`) VALUES
('1', 'Alami', 'Ahmad', 'adresse1', '0615384603', 'ahmad@gmail.com', 'ahmad123'),
('2', 'Bakkali', 'Rajae', 'adreese2', '0693610347', 'rajae@gmail.com', 'rajae123'),
('3', 'Ouahabi', 'Jamila', 'adresse3', '0617244537', 'jamila@gmail.com', 'jamila123'),
('4', 'Alilou', 'Said', 'adresse4', '0616273843', 'said@gmail.com', 'said123'),
('5', 'Kadiri', 'Lamyae', 'adresse5', '0683645291', 'lamyae@gmail.com', 'lamyae123');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `Id_commande` char(4) NOT NULL,
  `date` date NOT NULL,
  `adresse` varchar(60) NOT NULL,
  `Id_client` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Id_commande`, `date`, `adresse`, `Id_client`) VALUES
('A1', '2022-01-03', 'adresse1', '1'),
('A2', '2022-01-03', 'adresse2', '1'),
('A3', '2022-01-04', 'adresse3', '3'),
('A4', '2022-02-07', 'adresse4', '4'),
('A5', '2022-01-03', 'adresse5', '1');

-- --------------------------------------------------------

--
-- Structure de la table `détails_commande`
--

CREATE TABLE `détails_commande` (
  `Id_commande` char(4) NOT NULL,
  `Quantité` int(11) NOT NULL,
  `Id_produit` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `détails_commande`
--

INSERT INTO `détails_commande` (`Id_commande`, `Quantité`, `Id_produit`) VALUES
('A1', 3, 'P4'),
('A2', 1, 'P1'),
('A3', 1, 'P2'),
('A4', 5, 'P6'),
('A5', 2, 'P3');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `Id_produit` char(4) NOT NULL,
  `Libellé` varchar(60) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Prix_unitaire` float NOT NULL,
  `Quantité_en_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Id_produit`, `Libellé`, `Description`, `Prix_unitaire`, `Quantité_en_stock`) VALUES
('P1', 'Hand Mask', 'été imaginé pour adoucir et apaiser les mains sèches et rugueuses', 120, 94),
('P2', 'Micellar Water', 'tonifie et élimine le maquillage et les impuretés en une seule étape', 150, 83),
('P3', 'Volume Mascara', 'Un mascara incroyable pour un regard résolument envoutant', 90, 65),
('P4', 'Fortune Balms', 'Sa formule naturelle et très nourrissante est enrichie en beurre de karité et en aloe vera', 50, 58),
('p5', 'Eye Make-up Remover', 'Ce démaquillant naturel doux élimine les traces de maquillage les plus tenaces', 139, 105),
('P6', 'Miracle Wipes', 'la solution idéale pour éliminer complètement le maquillage,Il se glissera facilement dans votre sac', 49, 90);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`Id_commande`),
  ADD KEY `Id_client` (`Id_client`);

--
-- Index pour la table `détails_commande`
--
ALTER TABLE `détails_commande`
  ADD PRIMARY KEY (`Id_commande`,`Id_produit`),
  ADD KEY `Id_produit` (`Id_produit`),
  ADD KEY `Id_commande` (`Id_commande`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`Id_produit`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`);

--
-- Contraintes pour la table `détails_commande`
--
ALTER TABLE `détails_commande`
  ADD CONSTRAINT `détails_commande_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`),
  ADD CONSTRAINT `détails_commande_ibfk_2` FOREIGN KEY (`Id_produit`) REFERENCES `produit` (`Id_produit`),
  ADD CONSTRAINT `détails_commande_ibfk_3` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
