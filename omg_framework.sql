CREATE DATABASE `OMG`;
USE `OMG`;

-- --------------------------------------------------------

CREATE TABLE `player_account` (
  `id` int(11) NOT NULL,
  `player_first_spawn` varchar(255) NOT NULL DEFAULT 'first_spawn',
  `player_identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `player_health` varchar(255) NOT NULL DEFAULT '200', /* WIP*/
  `player_position` text NOT NULL,
  `player_group` varchar(50) NOT NULL DEFAULT '0', /* WIP*/
  `player_permission_level` int(11) NOT NULL DEFAULT '0', /* WIP */
  `player_money` double NOT NULL DEFAULT '0',
  `player_bank_balance` int(32) DEFAULT '0',
  `player_dirty_money` double NOT NULL DEFAULT '0',
  `player_job` varchar(50) NOT NULL DEFAULT 'police' /* WIP*/
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- --------------------------------------------------------

ALTER TABLE `player_account`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `player_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;