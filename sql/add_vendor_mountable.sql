SET
@VENDOR_TEMPLATE_ENTRY  := 300402,
@VENDOR_ENTRY           := 15120747,
@row_number             := 0;

DELETE FROM creature WHERE guid = @VENDOR_ENTRY;
DELETE FROM npc_vendor WHERE entry = @VENDOR_TEMPLATE_ENTRY;
DELETE FROM creature_template WHERE entry = @VENDOR_TEMPLATE_ENTRY;

REPLACE INTO `creature_template` (`entry`,`modelid1`,`name`,`subname`,`minlevel`,`maxlevel`,`faction`,`npcflag`,`scale`,`unit_flags`,`dynamicflags`,`trainer_type`,`type`,`type_flags`) VALUES
 (@VENDOR_TEMPLATE_ENTRY, '30821', '乌瑟尔·光明使者', '坐骑商人', '88', '88', '35', '128', '1', '2', '0', '8', '7', '4');

REPLACE INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`extendedcost`)
SElECT @VENDOR_TEMPLATE_ENTRY, (@row_number:=@row_number+1), item.entry, 0, 0, 
CASE
    WHEN item.RequiredSkillRank < 300 THEN 2723
    WHEN item.RequiredSkillRank = 300 THEN 2723
END
FROM(
SElECT entry, RequiredSkillRank FROM item_template
WHERE class=15 AND subclass=5 AND name NOT IN ('Swift Mooncloth Carpet', 'Swift Spellfire Carpet', 'Swift Ebonweave Carpet')
) AS item;

REPLACE INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUE
 (@VENDOR_ENTRY, @VENDOR_TEMPLATE_ENTRY, '571', '1', '1', '0', '0', '5811.113770', '641.426758', '647.536133', '0.248283', '300', '0', '0', '100000000', '0', '0', '0', '0', '0');