CREATE TABLE `airpollution` (
  `date` int DEFAULT NULL,
  `district` text,
  `o2` double DEFAULT NULL,
  `ozon` double DEFAULT NULL,
  `carbon` double DEFAULT NULL,
  `sulfur` double DEFAULT NULL,
  `fineDust` text,
  `UltrafineDust` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `commerceinfo` (
  `no` int NOT NULL AUTO_INCREMENT,
  `shopname` varchar(30) DEFAULT NULL,
  `localname` varchar(40) DEFAULT NULL,
  `code1` varchar(20) DEFAULT NULL,
  `codename1` varchar(50) DEFAULT NULL,
  `code2` varchar(20) DEFAULT NULL,
  `codename2` varchar(50) DEFAULT NULL,
  `code3` varchar(20) DEFAULT NULL,
  `codename3` varchar(50) DEFAULT NULL,
  `code4` varchar(20) DEFAULT NULL,
  `codename4` varchar(50) DEFAULT NULL,
  `citycode` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `gucode` varchar(20) DEFAULT NULL,
  `gu` varchar(20) DEFAULT NULL,
  `dongcode` varchar(20) DEFAULT NULL,
  `dong` varchar(30) DEFAULT NULL,
  `jibuaddress` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `oldspotcode` varchar(20) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `lng` varchar(100) DEFAULT NULL,
  `lat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=25603425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guguncode` (
  `gugun_code` varchar(10) NOT NULL,
  `gugun_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`gugun_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `housedeal` (
  `no` int NOT NULL AUTO_INCREMENT,
  `dong` varchar(30) NOT NULL,
  `AptName` varchar(50) NOT NULL,
  `code` varchar(30) NOT NULL,
  `dealAmount` varchar(50) NOT NULL,
  `buildYear` varchar(30) DEFAULT NULL,
  `dealYear` varchar(30) DEFAULT NULL,
  `dealMonth` varchar(30) DEFAULT NULL,
  `dealDay` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `floor` varchar(30) DEFAULT NULL,
  `jibun` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `rentMoney` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=262420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `housedealforaptdeal` (
  `no` int NOT NULL AUTO_INCREMENT,
  `dong` varchar(30) NOT NULL,
  `AptName` varchar(50) NOT NULL,
  `code` varchar(30) NOT NULL,
  `dealAmount` varchar(50) NOT NULL,
  `buildYear` varchar(30) DEFAULT NULL,
  `dealYear` varchar(30) DEFAULT NULL,
  `dealMonth` varchar(30) DEFAULT NULL,
  `dealDay` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `floor` varchar(30) DEFAULT NULL,
  `jibun` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `rentMoney` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=68865 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `housedealforaptrent` (
  `buildYear` int DEFAULT NULL,
  `dealYear` int DEFAULT NULL,
  `dong` text,
  `dealAmount` int DEFAULT NULL,
  `AptName` text,
  `dealMonth` int DEFAULT NULL,
  `rentMoney` int DEFAULT NULL,
  `dealDay` int DEFAULT NULL,
  `area` double DEFAULT NULL,
  `jibun` int DEFAULT NULL,
  `code` int DEFAULT NULL,
  `floor` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `housedealforhousedeal` (
  `dealAmount` int DEFAULT NULL,
  `buildYear` int DEFAULT NULL,
  `dealYear` int DEFAULT NULL,
  `dong` text,
  `AptName` text,
  `dealMonth` int DEFAULT NULL,
  `dealDay` int DEFAULT NULL,
  `area` double DEFAULT NULL,
  `jibun` text,
  `code` int DEFAULT NULL,
  `floor` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `housedealforhouserent` (
  `buildYear` int DEFAULT NULL,
  `dealYear` int DEFAULT NULL,
  `dong` text,
  `dealAmount` int DEFAULT NULL,
  `AptName` text,
  `dealMonth` int DEFAULT NULL,
  `rentMoney` int DEFAULT NULL,
  `dealDay` int DEFAULT NULL,
  `area` double DEFAULT NULL,
  `jibun` text,
  `code` int DEFAULT NULL,
  `floor` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `houseinfo` (
  `no` int DEFAULT NULL,
  `dong` text,
  `AptName` text,
  `code` int DEFAULT NULL,
  `buildYear` int DEFAULT NULL,
  `jibun` text,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `img` text,
  `count` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `notice` (
  `noticeno` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `regtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`noticeno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `qna_board` (
  `qna_no` int NOT NULL AUTO_INCREMENT COMMENT '질문번호',
  `qna_title` varchar(300) NOT NULL COMMENT '질문제목',
  `qna_content` varchar(4000) NOT NULL COMMENT '질문내용',
  `qna_userid` varchar(20) NOT NULL COMMENT '질문자아이디',
  `qna_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '질문일시',
  `reply_content` varchar(4000) DEFAULT NULL COMMENT '답변내용',
  `reply_datetime` timestamp NULL DEFAULT NULL COMMENT '답변일시',
  `reply_userid` varchar(20) DEFAULT NULL COMMENT '답변자아이디',
  PRIMARY KEY (`qna_no`),
  KEY `qna_to_user_fk4_idx` (`qna_userid`),
  CONSTRAINT `qna_to_user_fk3` FOREIGN KEY (`qna_userid`) REFERENCES `userinfo` (`id`),
  CONSTRAINT `qna_to_user_fk4` FOREIGN KEY (`qna_userid`) REFERENCES `userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='질문게시판';

CREATE TABLE `sidocode` (
  `sido_code` varchar(10) NOT NULL,
  `sido_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sido_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `userinfo` (
  `id` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
