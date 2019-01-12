SET
@VENDOR_TEMPLATE_ENTRY  := 300401,
@VENDOR_ENTRY           := 15120746;

DELETE FROM creature WHERE guid = @VENDOR_ENTRY;
DELETE FROM npc_vendor WHERE entry = @VENDOR_TEMPLATE_ENTRY;
DELETE FROM creature_template WHERE entry = @VENDOR_TEMPLATE_ENTRY;

REPLACE INTO `creature_template` (`entry`,`modelid1`,`name`,`subname`,`minlevel`,`maxlevel`,`faction`,`npcflag`,`scale`,`unit_flags`,`dynamicflags`,`trainer_type`,`type`,`type_flags`) VALUES
 (@VENDOR_TEMPLATE_ENTRY, '30863', '吉安娜·普罗德莫尔', '声望势力军需官', '88', '88', '35', '128', '1', '258', '0', '8', '7', '4');

REPLACE INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`extendedcost`)
SElECT DISTINCT @VENDOR_TEMPLATE_ENTRY, vendor.slot, vendor.item, vendor.maxcount, vendor.incrtime, vendor.extendedcost FROM(
SElECT * FROM npc_vendor WHERE entry IN (31916, 37687, 32287, 34881, 32540, 32538, 32533)) AS vendor;

REPLACE INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUE
 (@VENDOR_ENTRY, @VENDOR_TEMPLATE_ENTRY, '571', '1', '1', '0', '0', '5811.600586', '637.655945', '647.514343', '5.979067', '300', '0', '0', '100000000', '0', '0', '0', '0', '0');