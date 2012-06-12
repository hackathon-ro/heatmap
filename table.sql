
-- This table will contain the data for every click



CREATE TABLE `heatmap` (
  `id`            INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `url`           VARCHAR(1000) NOT NULL UNIQUE,
  `time`          DATETIME,
  `x`             INTEGER,
  `y`             INTEGER,
  `button`        INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




---- DROP TABLE IF EXISTS `last`;
--CREATE TABLE `last` (
  --`user` text NOT NULL,
  --`realm` tinytext NOT NULL,
  --`last` int(11) default NULL,
  --`text` tinytext,
  --`xml` text NOT NULL,
  --UNIQUE KEY `jid` (`realm`(16),`user`(16))
--) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--REATE TABLE `zizelo_indexes`(
  --`id` INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  --`name` VARCHAR(100) NOT NULL UNIQUE
--) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--CREATE TABLE `zizelo_documents`(
  --`id` INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  --`index_id` INTEGER UNSIGNED NOT NULL,
  --`object_id` INTEGER UNSIGNED NOT NULL,
  --FOREIGN KEY(`index_id`) REFERENCES `zizelo_indexes`(`id`) ON DELETE CASCADE,
  --UNIQUE(`index_id`, `object_id`)
--) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--CREATE TABLE `zizelo_words`(
  --`id` INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  --`text` VARCHAR(100) BINARY NOT NULL,
  --`hash` VARCHAR(100) BINARY NOT NULL,
  --UNIQUE(`text`),
  --INDEX(`hash`)
--) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--CREATE TABLE `zizelo_words_appearance`(
  --`document_id` INTEGER UNSIGNED NOT NULL,
  --`word_id` INTEGER UNSIGNED NOT NULL,
  --PRIMARY KEY(`document_id`, `word_id`),
  --FOREIGN KEY(`document_id`) REFERENCES `zizelo_documents`(`id`) ON DELETE CASCADE,
  --FOREIGN KEY(`word_id`) REFERENCES `zizelo_words`(`id`) ON DELETE CASCADE
--) ENGINE=InnoDB DEFAULT CHARSET=utf8;



