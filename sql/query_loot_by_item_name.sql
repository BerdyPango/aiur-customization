SET 
@Locale         := "zhCN",
@ItemName       :="纹章";

SELECT 
creature.entry AS CreatureEntry, 
creature.`name` AS CreatureOriginalName, 
locale.`Name` AS CreatureLocaleName,
creature.minlevel AS MinLevel, 
creature.maxlevel AS MaxLevel,
loot.ItemEntry AS ItemId,
loot.GroupId,
loot.OriginalItemName,
loot.LocaleItemName,
loot.DropChance,
loot.MinCount,
loot.MaxCount
FROM creature_template creature 
LEFT JOIN creature_template_locale locale ON locale.entry = creature.entry
LEFT JOIN 
(SELECT 
a.Entry AS Entry, 
a.item AS ItemEntry,
a.GroupId AS GroupId,
b.`name` AS OriginalItemName,
c.`name` AS LocaleItemName,
a.Chance AS DropChance,
a.MinCount AS MinCount,
a.MaxCount AS MaxCount
FROM creature_loot_template a
LEFT JOIN item_template b ON a.Item = b.entry 
LEFT JOIN item_template_locale c ON c.ID = b.entry WHERE c.locale = 'zhCN') AS loot ON loot.Entry = creature.entry
WHERE locale.locale = @Locale 
AND creature.minlevel >= 80 
AND loot.ItemEntry IS NOT NULL 
AND loot.LocaleItemName LIKE CONCAT("%", @ItemName,"%")