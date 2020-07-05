CREATE TABLE `exercise`.`minsert` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `week` INT NULL,
  `workout` INT NULL,
  `round` INT NULL,
  `reps` INT NULL,
  `weight` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));