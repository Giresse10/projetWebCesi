-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 06 juin 2022 à 21:01
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetweb`
--

-- --------------------------------------------------------

--
-- Structure de la table `avisentreprises`
--

DROP TABLE IF EXISTS `avisentreprises`;
CREATE TABLE IF NOT EXISTS `avisentreprises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsers` int(11) NOT NULL,
  `idEntreprises` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `commentaire` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `candidatures`
--

DROP TABLE IF EXISTS `candidatures`;
CREATE TABLE IF NOT EXISTS `candidatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `centre`
--

DROP TABLE IF EXISTS `centre`;
CREATE TABLE IF NOT EXISTS `centre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `centre`
--

INSERT INTO `centre` (`id`, `nom`) VALUES
(1, 'Arras'),
(2, 'Caen'),
(3, 'Lille'),
(4, 'Rouen'),
(5, 'Saint Nazaire'),
(6, 'Angouleme'),
(7, 'Brest'),
(8, 'La Rochelle'),
(9, 'Le Mans'),
(10, 'Nantes'),
(11, 'paris'),
(12, 'orleans'),
(13, 'dijon'),
(14, 'nancy'),
(15, 'reims'),
(16, 'strasbourg'),
(17, 'bordeaux'),
(18, 'montpellier'),
(19, 'pau'),
(20, 'toulouse'),
(21, 'Aix_en_Provence'),
(22, 'grenoble'),
(23, 'lyon'),
(24, 'nice');

-- --------------------------------------------------------

--
-- Structure de la table `competences`
--

DROP TABLE IF EXISTS `competences`;
CREATE TABLE IF NOT EXISTS `competences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

DROP TABLE IF EXISTS `entreprises`;
CREATE TABLE IF NOT EXISTS `entreprises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `idSecteur` int(11) NOT NULL,
  `nbStagiaires` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`id`, `nom`, `idSecteur`, `nbStagiaires`, `createdAt`) VALUES
(1, 'Microsoft', 3, 5, '2022-06-04 01:01:11'),
(2, 'Google', 3, 4, '2022-06-04 01:01:11'),
(3, 'Amazon', 2, 0, '2022-06-05 22:50:25'),
(4, 'Qug', 1, 0, '2022-06-05 22:53:13'),
(5, 'RaRible', 3, 0, '2022-06-06 00:06:53');

-- --------------------------------------------------------

--
-- Structure de la table `entreprisesxlocalites`
--

DROP TABLE IF EXISTS `entreprisesxlocalites`;
CREATE TABLE IF NOT EXISTS `entreprisesxlocalites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEntreprises` int(11) NOT NULL,
  `idLocalites` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entreprisesxlocalites`
--

INSERT INTO `entreprisesxlocalites` (`id`, `idEntreprises`, `idLocalites`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 1),
(7, 3, 2),
(8, 4, 2),
(9, 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

DROP TABLE IF EXISTS `filiere`;
CREATE TABLE IF NOT EXISTS `filiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`id`, `nom`) VALUES
(1, 'informatique'),
(2, 'BTP'),
(3, 'Generaliste'),
(4, 'QSE');

-- --------------------------------------------------------

--
-- Structure de la table `localites`
--

DROP TABLE IF EXISTS `localites`;
CREATE TABLE IF NOT EXISTS `localites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `cp` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `localites`
--

INSERT INTO `localites` (`id`, `nom`, `cp`) VALUES
(1, 'Angouleme', 16000),
(4, 'La Rochelle', 17000),
(2, 'lyon', 69000),
(5, 'Bordeaux', 33000);

-- --------------------------------------------------------

--
-- Structure de la table `offresdestage`
--

DROP TABLE IF EXISTS `offresdestage`;
CREATE TABLE IF NOT EXISTS `offresdestage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `idLocalite` int(11) NOT NULL,
  `idEntreprise` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  `baseDeRemuneration` int(11) NOT NULL,
  `date` date NOT NULL,
  `nbPlaces` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `offresdestage`
--

INSERT INTO `offresdestage` (`id`, `titre`, `description`, `idLocalite`, `idEntreprise`, `duree`, `baseDeRemuneration`, `date`, `nbPlaces`, `createdAt`) VALUES
(1, 'developpeur web', 'developpeur pour une Api Rest', 0, 1, 1, 100, '2022-06-01', 5, '2022-06-04 17:40:09'),
(2, 'titre', 'hhhh', 1, 1, 1, 11, '2022-06-01', 11, '2022-06-05 16:36:48'),
(3, 'ok', 'bbbbb', 4, 1, 1, 10, '2022-06-08', 10, '2022-06-06 01:37:04'),
(4, 'Administrateur reseau', 'Voici une offre pour les adeptes du reseau', 1, 1, 3, 3, '2022-06-12', 5, '2022-06-06 13:50:18'),
(5, 'Projet Web', 'Pour un projet', 4, 1, 1, 5, '2022-06-05', 2, '2022-06-06 22:04:09'),
(6, 'titre', 'fff', 2, 3, 1, 3, '2022-06-11', 2, '2022-06-06 22:19:36');

-- --------------------------------------------------------

--
-- Structure de la table `offresxcompetences`
--

DROP TABLE IF EXISTS `offresxcompetences`;
CREATE TABLE IF NOT EXISTS `offresxcompetences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOffresDeStage` int(11) NOT NULL,
  `idCompetences` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `secteurs`
--

DROP TABLE IF EXISTS `secteurs`;
CREATE TABLE IF NOT EXISTS `secteurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `secteurs`
--

INSERT INTO `secteurs` (`id`, `nom`) VALUES
(1, 'Agriculture'),
(2, 'Education'),
(3, 'Batiment');

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id`, `nom`) VALUES
(1, 'admin'),
(2, 'pilote'),
(3, 'delegue'),
(4, 'etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `emailPerso` varchar(200) NOT NULL,
  `pseudo` varchar(100) DEFAULT NULL,
  `niveau` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `idFiliere` int(11) NOT NULL,
  `idCentre` int(11) NOT NULL,
  `password` varchar(300) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `emailPerso`, `pseudo`, `niveau`, `idStatus`, `idFiliere`, `idCentre`, `password`, `createdAt`) VALUES
(1, 'admin', 'admin', 'admin@cesi.fr', 'admin@cesi.fr', 'admin', 1, 1, 1, 1, '$argon2i$v=19$m=65536,t=4,p=1$V0puVEdqTEwzeWdjLk82UQ$nvtDYCcTMyP33AL0ckGmP3Q0pUoYhEkrP6EnRGLJJ2E', '2022-06-03 14:43:44');

-- --------------------------------------------------------

--
-- Structure de la table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsers` int(11) NOT NULL,
  `idOffresDeStage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
