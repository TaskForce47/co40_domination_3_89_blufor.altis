-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.1.18-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für domination
CREATE DATABASE IF NOT EXISTS `domination` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `domination`;

-- Exportiere Struktur von Tabelle domination.dom_params
CREATE TABLE IF NOT EXISTS `dom_params` (
  `use_sql_settings` varchar(5) COLLATE utf8mb4_bin NOT NULL DEFAULT 'yes',
  `d_MainTargets_num` smallint(6) NOT NULL DEFAULT '8',
  `d_TimeOfDay` smallint(6) NOT NULL DEFAULT '5',
  `d_MissionType` smallint(6) NOT NULL DEFAULT '0',
  `d_with_ranked` smallint(6) NOT NULL DEFAULT '1',
  `d_bonus_vec_type` smallint(6) NOT NULL DEFAULT '0',
  `d_ao_check_for_ai` smallint(6) NOT NULL DEFAULT '1',
  `d_mt_respawngroups` smallint(6) NOT NULL DEFAULT '0',
  `d_weather` smallint(6) NOT NULL DEFAULT '0',
  `d_enable_fog` smallint(6) NOT NULL DEFAULT '0',
  `d_WithWinterWeather` smallint(6) NOT NULL DEFAULT '1',
  `d_withsandstorm` smallint(6) NOT NULL DEFAULT '0',
  `d_MaxNumAmmoboxes` smallint(6) NOT NULL DEFAULT '10',
  `d_max_truck_cargo` smallint(6) NOT NULL DEFAULT '6',
  `d_no_faks` smallint(6) NOT NULL DEFAULT '1',
  `d_timemultiplier` smallint(6) NOT NULL DEFAULT '1',
  `d_with_dynsim` smallint(6) NOT NULL DEFAULT '0',
  `d_with_bis_dynamicgroups` smallint(6) NOT NULL DEFAULT '0',
  `d_InitialViewDistance` mediumint(9) NOT NULL DEFAULT '1500',
  `d_MaxViewDistance` mediumint(9) NOT NULL DEFAULT '5000',
  `d_ViewdistanceChange` smallint(6) NOT NULL DEFAULT '0',
  `d_GrasAtStart` smallint(6) NOT NULL DEFAULT '0',
  `d_Terraindetail` smallint(6) NOT NULL DEFAULT '0',
  `d_WithRevive` smallint(6) NOT NULL DEFAULT '0',
  `d_WithReviveSpectating` smallint(6) NOT NULL DEFAULT '0',
  `d_only_medics_canrevive` smallint(6) NOT NULL DEFAULT '1',
  `xr_max_lives` smallint(6) NOT NULL DEFAULT '30',
  `xr_lifetime` smallint(6) NOT NULL DEFAULT '300',
  `xr_respawn_available_after` smallint(6) NOT NULL DEFAULT '5',
  `d_show_playernames` smallint(6) NOT NULL DEFAULT '0',
  `d_playernames_state` smallint(6) NOT NULL DEFAULT '1',
  `d_no_3rd_person` smallint(6) NOT NULL DEFAULT '1',
  `d_show_player_marker` smallint(6) NOT NULL DEFAULT '1',
  `d_AutoKickTime` mediumint(9) NOT NULL DEFAULT '1800',
  `d_without_nvg` smallint(6) NOT NULL DEFAULT '1',
  `d_without_vec_ti` smallint(6) NOT NULL DEFAULT '1',
  `d_without_vec_nvg` smallint(6) NOT NULL DEFAULT '1',
  `d_engineerfull` smallint(6) NOT NULL DEFAULT '1',
  `d_enablefatigue` smallint(6) NOT NULL DEFAULT '1',
  `d_enablesway` smallint(6) NOT NULL DEFAULT '1',
  `d_mhqvec_create_cooldown` smallint(6) NOT NULL DEFAULT '1',
  `d_with_ai` smallint(6) NOT NULL DEFAULT '1',
  `d_with_ai_features` smallint(6) NOT NULL DEFAULT '1',
  `d_max_ai` smallint(6) NOT NULL DEFAULT '8',
  `d_ai_alone_in_vehicle` smallint(6) NOT NULL DEFAULT '0',
  `d_WithMHQTeleport` smallint(6) NOT NULL DEFAULT '0',
  `d_MHQDisableNearMT` mediumint(9) NOT NULL DEFAULT '500',
  `d_NoMHQTeleEnemyNear` mediumint(9) NOT NULL DEFAULT '50',
  `d_with_mhq_camo` smallint(6) NOT NULL DEFAULT '0',
  `d_WithTeleToBase` smallint(6) NOT NULL DEFAULT '0',
  `d_respawnatsql` smallint(6) NOT NULL DEFAULT '0',
  `d_MTTowerSatchelsOnly` smallint(6) NOT NULL DEFAULT '0',
  `d_WithRecapture` smallint(6) NOT NULL DEFAULT '0',
  `d_sub_kill_points` smallint(6) NOT NULL DEFAULT '0',
  `d_pilots_only` smallint(6) NOT NULL DEFAULT '1',
  `d_WithLessArmor` smallint(6) NOT NULL DEFAULT '0',
  `d_WithLessArmor_side` smallint(6) NOT NULL DEFAULT '0',
  `d_EnemySkill` smallint(6) NOT NULL DEFAULT '2',
  `d_WithIsleDefense` smallint(6) NOT NULL DEFAULT '0',
  `d_ParaAtBase` smallint(6) NOT NULL DEFAULT '0',
  `d_HALOWaitTime` mediumint(9) NOT NULL DEFAULT '0',
  `d_WithJumpFlags` smallint(6) NOT NULL DEFAULT '1',
  `d_HALOJumpHeight` mediumint(9) NOT NULL DEFAULT '2000',
  `d_LockArmored` smallint(6) NOT NULL DEFAULT '1',
  `d_LockCars` smallint(6) NOT NULL DEFAULT '1',
  `d_LockAir` smallint(6) NOT NULL DEFAULT '1',
  `d_maxnum_tks_forkick` smallint(6) NOT NULL DEFAULT '10',
  `d_player_kick_shootingbase` smallint(6) NOT NULL DEFAULT '10',
  `d_no_teamkill` smallint(6) NOT NULL DEFAULT '0',
  `d_sub_tk_points` mediumint(9) NOT NULL DEFAULT '10',
  `d_WreckDeleteTime` mediumint(9) NOT NULL DEFAULT '3600',
  `d_WreckMaxRepair` int(11) NOT NULL DEFAULT '3',
  `d_drop_radius` mediumint(9) NOT NULL DEFAULT '0',
  `d_drop_max_dist` int(11) NOT NULL DEFAULT '500',
  `params_name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'dom_standard_params'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle domination.missionsave
CREATE TABLE IF NOT EXISTS `missionsave` (
  `name` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `d_maintargets` int(11) NOT NULL,
  `d_maintargets_list` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_current_target_index` int(11) NOT NULL,
  `d_cur_sm_idx` int(11) NOT NULL,
  `d_resolved_targets` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_recapture_indices` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `d_side_missions_random` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_current_mission_counter` int(11) NOT NULL,
  `d_searchintel` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_bonus_vecs_db` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `d_worldname` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_combiname` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  `missionname` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle domination.missionsavett
CREATE TABLE IF NOT EXISTS `missionsavett` (
  `name` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `d_maintargets` int(11) NOT NULL,
  `d_maintargets_list` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_current_target_index` int(11) NOT NULL,
  `d_cur_sm_idx` int(11) NOT NULL,
  `d_resolved_targets` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_recapture_indices` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `d_side_missions_random` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_current_mission_counter` int(11) NOT NULL,
  `d_searchintel` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_bonus_vecs_db_w` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `d_bonus_vecs_db_e` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `d_worldname` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_points_blufor` int(11) NOT NULL,
  `d_points_opfor` int(11) NOT NULL,
  `d_kill_points_blufor` int(11) NOT NULL,
  `d_kill_points_opfor` int(11) NOT NULL,
  `d_points_array` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_combiname` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  `missionname` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle domination.players
CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `playerid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `playtime` int(11) NOT NULL DEFAULT '0',
  `infkills` int(11) NOT NULL DEFAULT '0',
  `softveckills` int(11) NOT NULL DEFAULT '0',
  `armorkills` int(11) NOT NULL DEFAULT '0',
  `airkills` int(11) NOT NULL DEFAULT '0',
  `deaths` int(11) NOT NULL DEFAULT '0',
  `totalscore` int(11) NOT NULL DEFAULT '0',
  `radiotowerkills` int(11) NOT NULL DEFAULT '0',
  `numplayedonserver` int(11) NOT NULL DEFAULT '1',
  `campscaptured` int(11) NOT NULL DEFAULT '0',
  `mtsmkills` int(11) NOT NULL DEFAULT '0',
  `teamkills` int(11) NOT NULL DEFAULT '0',
  `revives` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
