



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'lists'
--
-- ---

DROP TABLE IF EXISTS `lists`;

CREATE TABLE lists (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(64) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

-- ---
-- Table 'tasks'
--
-- ---

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  description VARCHAR(256) NOT NULL,
  list_id INTEGER NOT NULL,
  created_at DATETIME NOT NULL,
  completed_at DATETIME NULL DEFAULT NULL,
  FOREIGN KEY(list_id) REFERENCES lists(id)

);

-- ---
-- Table 'tags'
--
-- ---

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR (128) NOT NULL
);

-- ---
-- Table 'tasks_tags'
--
-- ---

DROP TABLE IF EXISTS `tasks_tags`;

CREATE TABLE `tasks_tags` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `task_id` INTEGER NOT NULL,
  `tag_id` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `tasks` ADD FOREIGN KEY (list_id) REFERENCES `lists` (`id`);
ALTER TABLE `tasks_tags` ADD FOREIGN KEY (task_id) REFERENCES `tasks` (`id`);
ALTER TABLE `tasks_tags` ADD FOREIGN KEY (tag_id) REFERENCES `tags` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `lists` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tasks` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tasks_tags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `lists` (`id`,`title`,`created_at`,`updated_at`) VALUES
-- ('','','','');
-- INSERT INTO `tasks` (`id`,`description`,`list_id`,`created_at`,`completed_at`) VALUES
-- ('','','','','');
-- INSERT INTO `tags` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `tasks_tags` (`id`,`task_id`,`tag_id`) VALUES
-- ('','','');

