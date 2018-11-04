SET
@ENTRY400 := 300400;

REPLACE INTO `creature_template` (`entry`,`modelid1`,`name`,`subname`,`minlevel`,`maxlevel`,`faction`,`npcflag`,`scale`,`unit_flags`,`dynamicflags`,`trainer_type`,`type`,`type_flags`) VALUES
 (@ENTRY400, ' 23404', '虚空之触', '艾尔接待员', '88', '88', '35', '4225', '0.3', '258', '0', '8', '7', '4');

REPLACE INTO npc_vendor (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`extendedcost`)
SElECT DISTINCT @ENTRY400, 0, a.entry, 0, 0, 0 from(
Select a.entry as entry from item_template a LEFT JOIN item_template_locale b on a.entry = b.ID 
where b.locale = 'zhCN' and a.ItemLevel = 187) as a;

REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUE
 ('15120745', @ENTRY400, '571', '1', '1', '0', '0', '5810.606445', '634.922424', '647.505371', '5.598309', '300', '0', '0', '1', '0', '0', '0', '0', '0');