-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema creche
--

CREATE DATABASE IF NOT EXISTS creche;
USE creche;

--
-- Definition of table `assigncaretaker`
--

DROP TABLE IF EXISTS `assigncaretaker`;
CREATE TABLE `assigncaretaker` (
  `userid` int(10) unsigned NOT NULL auto_increment,
  `caretakerid` varchar(12) NOT NULL,
  PRIMARY KEY  (`userid`),
  KEY `FK_assigncaretaker_2` (`caretakerid`),
  CONSTRAINT `FK_assigncaretaker_1` FOREIGN KEY (`userid`) REFERENCES `registration` (`userid`),
  CONSTRAINT `FK_assigncaretaker_2` FOREIGN KEY (`caretakerid`) REFERENCES `caretaker` (`caretakerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigncaretaker`
--

/*!40000 ALTER TABLE `assigncaretaker` DISABLE KEYS */;
INSERT INTO `assigncaretaker` (`userid`,`caretakerid`) VALUES 
 (2401,'1201'),
 (2405,'1203');
/*!40000 ALTER TABLE `assigncaretaker` ENABLE KEYS */;


--
-- Definition of table `caretaker`
--

DROP TABLE IF EXISTS `caretaker`;
CREATE TABLE `caretaker` (
  `caretakerid` varchar(12) NOT NULL,
  `caretakername` varchar(45) NOT NULL,
  PRIMARY KEY  (`caretakerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caretaker`
--

/*!40000 ALTER TABLE `caretaker` DISABLE KEYS */;
INSERT INTO `caretaker` (`caretakerid`,`caretakername`) VALUES 
 ('1200','neha'),
 ('1201','sanju'),
 ('1202','naina'),
 ('1203','priya');
/*!40000 ALTER TABLE `caretaker` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `userid` int(10) unsigned NOT NULL auto_increment,
  `userpass` varchar(45) NOT NULL,
  `usertype` varchar(45) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`userid`,`userpass`,`usertype`) VALUES 
 (1200,'neha','caretaker'),
 (1201,'sanju','caretaker'),
 (1202,'naina','caretaker'),
 (1203,'priya','caretaker'),
 (2400,'naina','admin'),
 (2401,'neha','parent'),
 (2402,'sanju','parent'),
 (2405,'sagar','parent');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Definition of table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `msgid` varchar(10) NOT NULL,
  `subject` varchar(85) NOT NULL,
  `message` varchar(245) NOT NULL,
  `senderid` varchar(45) NOT NULL,
  `receiverid` varchar(45) NOT NULL,
  `rstatus` tinyint(1) NOT NULL,
  `sstatus` tinyint(1) NOT NULL,
  `msgdate` date default NULL,
  PRIMARY KEY  (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`msgid`,`subject`,`message`,`senderid`,`receiverid`,`rstatus`,`sstatus`,`msgdate`) VALUES 
 ('1','college','reopen','2401','2400',0,0,NULL),
 ('2','college','reopen on 21','2400','2405',0,0,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


--
-- Definition of table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsid` varchar(10) NOT NULL,
  `topic` varchar(45) NOT NULL,
  `content` varchar(100) NOT NULL,
  `date` date default NULL,
  PRIMARY KEY  (`newsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`newsid`,`topic`,`content`,`date`) VALUES 
 ('123','college','reopen on 21',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


--
-- Definition of table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `userid` int(10) unsigned NOT NULL auto_increment,
  `pname` varchar(45) NOT NULL,
  `phoneno` int(12) unsigned NOT NULL,
  `email` varchar(45) default NULL,
  `kname` varchar(45) NOT NULL,
  `age` varchar(45) default NULL,
  `gender` varchar(45) default NULL,
  `program` varchar(45) NOT NULL,
  `draftno` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  USING BTREE (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`userid`,`pname`,`phoneno`,`email`,`kname`,`age`,`gender`,`program`,`draftno`,`status`) VALUES 
 (2200,'tubbi',33354465,'tubbi@','shubhi','1','girl','wobblers','4465654',0),
 (2401,'sanju',867565646,'sanju@','munnu','5','boy','toddlers','76769',1),
 (2405,'sanju',651287,'sagar@@','sagar','6','girl','babies','26526t',1),
 (2406,'neha',912898,'neha@','jaiswal','2','boy','toddler','is2728',1);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
