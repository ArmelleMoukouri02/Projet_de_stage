-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 01 avr. 2021 à 02:55
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
-- 
drop database if exists ancocokids;
CREATE database ancocokids;
use ancocokids;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Commande;

drop table if exists Donnation;

drop table if exists Fournisseur;

drop table if exists Ligne_Commande;

drop table if exists Livraison;

drop table if exists Livraison_Effectuee;

drop table if exists ModeLivraison;

drop table if exists Ville;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ancocokids`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--
-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `ArtId` int(11) NOT NULL,
  `FourId` int(11) NOT NULL,
  `CatId` int(11) NOT NULL,
  `ArtNom` varchar(254) DEFAULT NULL,
  `PrixArt` int(11) DEFAULT NULL,
  `QteArt` int(11) DEFAULT NULL,
  `Tauxremise` int(11) DEFAULT NULL,
  `ArtDescription` varchar(254) DEFAULT NULL,
  `TVA` int(11) DEFAULT NULL,
  ArtImage VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `CatId` int(11) NOT NULL,
  `CatNom` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`CatId`, `CatNom`) VALUES
(1, 'Produit laitier');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ClientId` int(11) NOT NULL,
  `ClientNom` varchar(254) NOT NULL,
  `ClientPrenom` varchar(254) DEFAULT NULL,
  `ClientSexe` char(1) NOT NULL,
  `ClientAdresse` varchar(254) DEFAULT NULL,
  `ClientTelephone` int(11) DEFAULT NULL,
  `ClientMotdePasse` varchar(254) NOT NULL,
  `ClientLogin` varchar(254) NOT NULL,
  `ClientVille` varchar(254) NOT NULL,
  IS_ADMIN Boolean DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `CmdId` int(11) NOT NULL,
  `CmdDate` datetime DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `CmdDescription` varchar(254) DEFAULT NULL,
  `ClientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `donnation`
--

CREATE TABLE `donnation` (
  `DonId` int(11) NOT NULL,
  `DonNom` varchar(254) DEFAULT NULL,
  `QteDon` int(11) DEFAULT NULL,
  `NatureDon` varchar(254) DEFAULT NULL,
  `ClientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `FourId` int(11) NOT NULL,
  `FourNom` varchar(254) DEFAULT NULL,
  `FourPrenom` varchar(254) DEFAULT NULL,
  `FourAdresse` varchar(254) DEFAULT NULL,
  `FourTelephone` int(11) DEFAULT NULL,
  `Fouremail` varchar(254) DEFAULT NULL,
  `FourEntreprise` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`FourId`, `FourNom`, `FourPrenom`, `FourAdresse`, `FourTelephone`, `Fouremail`, `FourEntreprise`) VALUES
(1, 'TIAKO', 'CEDRIC', 'rue barnabe', 698756145, 'tiako1998@gmail.com', 'JUMIA');
-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `LigCmd_Id` int(11) NOT NULL,
  `ArtId` int(11) NOT NULL,
  `CmdId` int(11) NOT NULL,
  `QteCmd` int(11) DEFAULT NULL,
  `DateLigCmd` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `LivId` int(11) NOT NULL,
  `ModeLiv_Id` int(11) NOT NULL,
  `LivDate` datetime DEFAULT NULL,
  `LivDescription` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livraison_effectuee`
--

CREATE TABLE `livraison_effectuee` (
  `LivEff_Id` int(11) NOT NULL,
  `CmdId` int(11) NOT NULL,
  `LivId` int(11) NOT NULL,
  `DateLivEff` datetime DEFAULT NULL,
  `NbreLivEff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `modelivraison`
--

CREATE TABLE `modelivraison` (
  `ModeLiv_Id` int(11) NOT NULL,
  `ModeLivNom` varchar(254) DEFAULT NULL,
  `ModeLiv_Description` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ------------------------------------------------------

--
-- Index pour les tables déchargées
--



--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`ArtId`),
  ADD KEY `FK_Association_3` (`FourId`),
  ADD KEY `FK_Association_4` (`CatId`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`CatId`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientId`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`CmdId`),
  ADD KEY `FK_Association_10` (`ClientId`);

--
-- Index pour la table `donnation`
--
ALTER TABLE `donnation`
  ADD PRIMARY KEY (`DonId`),
  ADD KEY `FK_Association_1` (`ClientId`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`FourId`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`LigCmd_Id`),
  ADD KEY `FK_Association_6` (`ArtId`),
  ADD KEY `FK_Association_7` (`CmdId`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`LivId`),
  ADD KEY `FK_Association_5` (`ModeLiv_Id`);

--
-- Index pour la table `livraison_effectuee`
--
ALTER TABLE `livraison_effectuee`
  ADD PRIMARY KEY (`LivEff_Id`),
  ADD KEY `FK_Association_8` (`CmdId`),
  ADD KEY `FK_Association_9` (`LivId`);

--
-- Index pour la table `modelivraison`
--
ALTER TABLE `modelivraison`
  ADD PRIMARY KEY (`ModeLiv_Id`);

--
-- Index pour la table `ville`
--
--
-- AUTO_INCREMENT pour les tables déchargées

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `ArtId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `CatId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `ClientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `CmdId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `donnation`
--
ALTER TABLE `donnation`
  MODIFY `DonId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `FourId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `LigCmd_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `LivId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livraison_effectuee`
--
ALTER TABLE `livraison_effectuee`
  MODIFY `LivEff_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `modelivraison`
--
ALTER TABLE `modelivraison`
  MODIFY `ModeLiv_Id` int(11) NOT NULL AUTO_INCREMENT;



--
-- Contraintes pour les tables déchargées
--


-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_Association_3` FOREIGN KEY (`FourId`) REFERENCES `fournisseur` (`FourId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Association_4` FOREIGN KEY (`CatId`) REFERENCES `categorie` (`CatId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `client`

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_Association_10` FOREIGN KEY (`ClientId`) REFERENCES `client` (`ClientId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `donnation`
--
ALTER TABLE `donnation`
  ADD CONSTRAINT `FK_Association_1` FOREIGN KEY (`ClientId`) REFERENCES `client` (`ClientId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `FK_Association_6` FOREIGN KEY (`ArtId`) REFERENCES `article` (`ArtId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Association_7` FOREIGN KEY (`CmdId`) REFERENCES `commande` (`CmdId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `FK_Association_5` FOREIGN KEY (`ModeLiv_Id`) REFERENCES `modelivraison` (`ModeLiv_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livraison_effectuee`
--
ALTER TABLE `livraison_effectuee`
  ADD CONSTRAINT `FK_Association_8` FOREIGN KEY (`CmdId`) REFERENCES `commande` (`CmdId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Association_9` FOREIGN KEY (`LivId`) REFERENCES `livraison` (`LivId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
