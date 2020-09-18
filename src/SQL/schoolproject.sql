-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 18 sep. 2020 à 15:11
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `schoolproject`
--

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`ref`, `title`, `author`) VALUES
(1, 'kldlkd', 'lksdkds'),
(2, 'sdjdslkkds', 'klclkklds');

-- --------------------------------------------------------

--
-- Structure de la table `borrowing`
--

DROP TABLE IF EXISTS `borrowing`;
CREATE TABLE IF NOT EXISTS `borrowing` (
  `idTeacher` int(11) NOT NULL,
  `idMaterial` int(11) NOT NULL,
  `idBook` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(200) NOT NULL,
  KEY `idTeacher` (`idTeacher`),
  KEY `idMaterial` (`idMaterial`),
  KEY `idBook` (`idBook`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
CREATE TABLE IF NOT EXISTS `classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classroom`
--

INSERT INTO `classroom` (`id`, `name`) VALUES
(1, 'CP'),
(2, 'CE1'),
(3, 'CE2'),
(4, 'CM1'),
(5, 'CM2');

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_dateTime` datetime NOT NULL,
  `finish_dateTime` datetime NOT NULL,
  `idClass` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idClass` (`idClass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `mark` varchar(255) NOT NULL,
  `idStudent` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `dateTime_evaluation` datetime NOT NULL,
  KEY `idStudent` (`idStudent`),
  KEY `idCourse` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `material`
--

INSERT INTO `material` (`id`, `title`) VALUES
(1, 'dslkklsd'),
(2, 'sdmlsdmlsd');

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`id`, `firstname`, `lastname`, `birthdate`) VALUES
(1, 'Tarik', 'YILDIZ', '1997-08-26'),
(5, 'YILDIZ', 'TARIK', '1997-11-18'),
(6, 'efjz', 'zeiodjzo', '1998-11-18'),
(7, 'voiture', 'blabl', '1997-11-18'),
(8, 'dk,e', 'zpifjied', '1997-11-19'),
(9, 'yildiz', 'tarik', '1997-11-18'),
(10, 'yildiz', 'tarik', '1997-11-18'),
(11, 'yildiz', 'tarik', '1997-11-18'),
(12, 'aa', 'zz', '1997-11-18'),
(13, 'qq', 'qq', '2007-11-18'),
(14, 'zz', 'ee', '1997-11-18'),
(16, 'tarik', 'yildiz', '1998-11-18'),
(17, 'mballi', 'guillaume', '1998-04-28'),
(19, 'mbali', 'guillaume', '1998-04-28'),
(20, 'tarik', 'yildiz', '1997-11-18'),
(21, 'mbali', 'guillaume', '1997-11-19'),
(22, 'laurent', 'pierre', '1996-09-05');

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentNumber` int(11) NOT NULL AUTO_INCREMENT,
  `idPerson` int(11) NOT NULL,
  PRIMARY KEY (`studentNumber`),
  KEY `idPerson` (`idPerson`)
) ENGINE=InnoDB AUTO_INCREMENT=123456790 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `student`
--

INSERT INTO `student` (`studentNumber`, `idPerson`) VALUES
(1, 1),
(12585, 5),
(258963, 5),
(2258741, 5),
(123456789, 5),
(14785, 6),
(134, 7),
(156, 8),
(257481, 12),
(985632, 14),
(21, 16),
(23, 17),
(25, 19),
(85, 21);

-- --------------------------------------------------------

--
-- Structure de la table `student_classroom`
--

DROP TABLE IF EXISTS `student_classroom`;
CREATE TABLE IF NOT EXISTS `student_classroom` (
  `idStudent` int(11) DEFAULT NULL,
  `idClassroom` int(11) DEFAULT NULL,
  KEY `idStudent` (`idStudent`),
  KEY `idClassroom` (`idClassroom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `student_classroom`
--

INSERT INTO `student_classroom` (`idStudent`, `idClassroom`) VALUES
(1, 3),
(2, 3),
(15, 3),
(16, 2),
(17, 2),
(18, 1),
(19, 1),
(21, 3);

-- --------------------------------------------------------

--
-- Structure de la table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `idPerson` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPerson` (`idPerson`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `teacher`
--

INSERT INTO `teacher` (`id`, `email`, `idPerson`) VALUES
(3, 'null', 1),
(4, 'null', 22);

-- --------------------------------------------------------

--
-- Structure de la table `teaching`
--

DROP TABLE IF EXISTS `teaching`;
CREATE TABLE IF NOT EXISTS `teaching` (
  `idClassroom` int(11) NOT NULL,
  `idTeacher` int(11) NOT NULL,
  KEY `idClassroom` (`idClassroom`),
  KEY `idTeacher` (`idTeacher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `teaching`
--

INSERT INTO `teaching` (`idClassroom`, `idTeacher`) VALUES
(3, 3),
(1, 4),
(2, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `borrowing`
--
ALTER TABLE `borrowing`
  ADD CONSTRAINT `Borrowing_ibfk_1` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Borrowing_ibfk_2` FOREIGN KEY (`idBook`) REFERENCES `book` (`ref`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Borrowing_ibfk_3` FOREIGN KEY (`idTeacher`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`idClass`) REFERENCES `classroom` (`id`);

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`idStudent`) REFERENCES `student` (`idPerson`),
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `course` (`id`);

--
-- Contraintes pour la table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`idPerson`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`idPerson`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `teaching`
--
ALTER TABLE `teaching`
  ADD CONSTRAINT `Teaching_ibfk_1` FOREIGN KEY (`idClassroom`) REFERENCES `classroom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
