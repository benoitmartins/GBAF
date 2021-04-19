-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 19 avr. 2021 à 09:43
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gbaf`
--
CREATE DATABASE IF NOT EXISTS `gbaf` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gbaf`;

-- --------------------------------------------------------

--
-- Structure de la table `gbaf_actor`
--

DROP TABLE IF EXISTS `gbaf_actor`;
CREATE TABLE IF NOT EXISTS `gbaf_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `logo_file` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gbaf_actor`
--

INSERT INTO `gbaf_actor` (`id`, `name`, `description`, `logo_file`) VALUES
(5, 'Formation&co', 'Formation&co est une association française présente sur tout le territoire.\r\nNous proposons à des personnes issues de tout milieu de devenir entrepreneur grâce à un crédit et un accompagnement professionnel et personnalisé.\r\nNotre proposition : \r\n●	un financement jusqu’à 30 000€ ;\r\n●	un suivi personnalisé et gratuit ;\r\n●	une lutte acharnée contre les freins sociétaux et les stéréotypes.\r\n\r\nLe financement est possible, peu importe le métier : coiffeur, banquier, éleveur de chèvres… . Nous collaborons avec des personnes talentueuses et motivées.\r\nVous n’avez pas de diplômes ? Ce n’est pas un problème pour nous ! Nos financements s’adressent à tous.\r\n\r\n', 'public/img/actor_formation_co.png'),
(6, 'Protectpeople', 'Protectpeople finance la solidarité nationale.\r\nNous appliquons le principe édifié par la Sécurité sociale française en 1945 : permettre à chacun de bénéficier d’une protection sociale.\r\n\r\nChez Protectpeople, chacun cotise selon ses moyens et reçoit selon ses besoins.\r\nProectecpeople est ouvert à tous, sans considération d’âge ou d’état de santé.\r\nNous garantissons un accès aux soins et une retraite.\r\nChaque année, nous collectons et répartissons 300 milliards d’euros.\r\nNotre mission est double :\r\n●	sociale : nous garantissons la fiabilité des données sociales ;\r\n●	économique : nous apportons une contribution aux activités économiques.\r\n\r\n', 'public/img/actor_protectpeople.png'),
(7, 'Dsa France ', 'Dsa France accélère la croissance du territoire et s’engage avec les collectivités territoriales.\r\nNous accompagnons les entreprises dans les étapes clés de leur évolution.\r\nNotre philosophie : s’adapter à chaque entreprise.\r\nNous les accompagnons pour voir plus grand et plus loin et proposons des solutions de financement adaptées à chaque étape de la vie des entreprises\r\n\r\n', 'public/img/actor_Dsa_france.png'),
(8, 'CDE', 'La CDE (Chambre Des Entrepreneurs) accompagne les entreprises dans leurs démarches de formation. \r\nSon président est élu pour 3 ans par ses pairs, chefs d’entreprises et présidents des CDE.\r\n\r\n\r\n', 'public/img/actor_CDE.png');

-- --------------------------------------------------------

--
-- Structure de la table `gbaf_comment`
--

DROP TABLE IF EXISTS `gbaf_comment`;
CREATE TABLE IF NOT EXISTS `gbaf_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `date_add` datetime NOT NULL,
  `actor_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`actor_id`,`member_id`),
  KEY `fk_gbaf_comment_gbaf_actor1_idx` (`actor_id`),
  KEY `fk_gbaf_comment_gbaf_member1_idx` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gbaf_comment`
--

INSERT INTO `gbaf_comment` (`id`, `comment`, `date_add`, `actor_id`, `member_id`) VALUES
(47, 'Bonjour', '2021-04-12 04:04:02', 5, 17),
(48, 'Bonjour !', '2021-04-18 19:27:29', 6, 17);

-- --------------------------------------------------------

--
-- Structure de la table `gbaf_image`
--

DROP TABLE IF EXISTS `gbaf_image`;
CREATE TABLE IF NOT EXISTS `gbaf_image` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `bin` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gbaf_member`
--

DROP TABLE IF EXISTS `gbaf_member`;
CREATE TABLE IF NOT EXISTS `gbaf_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(70) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gbaf_member`
--

INSERT INTO `gbaf_member` (`id`, `lastname`, `firstname`, `username`, `password`, `question`, `answer`) VALUES
(17, 'Martins', 'Benoit', 'Benoit', '$2y$10$e7FTruOOGjX1EGEPq5vM0OYxXfaEI/mD28swUutOt66GpnZpj5ZsG', '', '08/08/2000'),
(18, 'Dubois', 'Michel', 'Michel', '$2y$10$EaJ.KxJN3RXfcRmG53xuqO6mQDxV..PS38DSjTEiIzDMrndoZeRoW', '', '12/12/2000'),
(19, 'Valet', 'Julie', 'Julie', '$2y$10$MaoaZdO6yNsWcfm3zxjrn.Vp0O3z8CmJpM3PD/Lzq5JzZvOjEjl0.', '', '12/12/2000');

-- --------------------------------------------------------

--
-- Structure de la table `gbaf_question`
--

DROP TABLE IF EXISTS `gbaf_question`;
CREATE TABLE IF NOT EXISTS `gbaf_question` (
  `id_question` int(60) NOT NULL AUTO_INCREMENT,
  `nom_question` varchar(60) NOT NULL,
  PRIMARY KEY (`id_question`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gbaf_question`
--

INSERT INTO `gbaf_question` (`id_question`, `nom_question`) VALUES
(3, 'Quelle est votre date de naissance ?'),
(4, 'Quel est le nom de votre école primaire ?'),
(5, 'Quel est le prenom et nom de votre père ?'),
(6, 'Quel était le nom de votre premier animal ?');

-- --------------------------------------------------------

--
-- Structure de la table `gbaf_vote`
--

DROP TABLE IF EXISTS `gbaf_vote`;
CREATE TABLE IF NOT EXISTS `gbaf_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote` tinyint(1) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`actor_id`,`member_id`),
  KEY `fk_gbaf_vote_gbaf_actor1_idx` (`actor_id`),
  KEY `fk_gbaf_vote_gbaf_member1_idx` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gbaf_vote`
--

INSERT INTO `gbaf_vote` (`id`, `vote`, `actor_id`, `member_id`) VALUES
(21, 0, 5, 17),
(22, 1, 6, 17),
(23, 1, 7, 17),
(24, 1, 8, 17),
(25, 1, 5, 18),
(26, 0, 6, 18),
(27, 0, 7, 18),
(28, 0, 8, 18),
(29, 1, 5, 19),
(30, 1, 6, 19),
(31, 1, 6, 19),
(32, 0, 7, 19),
(33, 0, 7, 17);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gbaf_comment`
--
ALTER TABLE `gbaf_comment`
  ADD CONSTRAINT `fk_gbaf_comment_gbaf_actor1` FOREIGN KEY (`actor_id`) REFERENCES `gbaf_actor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gbaf_comment_gbaf_member1` FOREIGN KEY (`member_id`) REFERENCES `gbaf_member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `gbaf_vote`
--
ALTER TABLE `gbaf_vote`
  ADD CONSTRAINT `fk_gbaf_vote_gbaf_actor1` FOREIGN KEY (`actor_id`) REFERENCES `gbaf_actor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gbaf_vote_gbaf_member1` FOREIGN KEY (`member_id`) REFERENCES `gbaf_member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
