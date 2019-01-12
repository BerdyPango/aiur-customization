SET
@VENDOR_TEMPLATE_ENTRY  := 300400,
@VENDOR_ENTRY           := 15120745;

REPLACE INTO `creature_template` (`entry`,`modelid1`,`name`,`subname`,`minlevel`,`maxlevel`,`faction`,`npcflag`,`scale`,`unit_flags`,`dynamicflags`,`trainer_type`,`type`,`type_flags`) VALUES
 (@VENDOR_TEMPLATE_ENTRY, ' 23404', '虚空之触', '艾尔接待员', '88', '88', '35', '4225', '0.3', '258', '0', '8', '7', '4');

REPLACE INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`extendedcost`)
SElECT DISTINCT @VENDOR_TEMPLATE_ENTRY, 0, item.entry, 0, 0, 0 FROM(
SElECT entry FROM item_template WHERE ItemLevel = 187) AS item;

# add 寒冰纹章
REPLACE INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`extendedcost`) VALUES
 (@VENDOR_TEMPLATE_ENTRY, '0', '49426', '0', '0', '2723');

REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUE
 (@VENDOR_ENTRY, @VENDOR_TEMPLATE_ENTRY, '571', '1', '1', '0', '0', '5810.606445', '634.922424', '647.505371', '5.598309', '300', '0', '0', '100000000', '0', '0', '0', '0', '0');