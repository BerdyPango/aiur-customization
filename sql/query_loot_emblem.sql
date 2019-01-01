select 
creature.entry as CreatureEntry, 
creature.`name` as CreatureOriginalName, 
locale.`Name` as CreatureLocaleName,
creature.minlevel, 
creature.maxlevel,
loot.*
from creature_template creature 
LEFT JOIN creature_template_locale locale on locale.entry = creature.entry
LEFT JOIN 
(select 
a.Entry as Entry, 
a.item as ItemEntry,
a.GroupId as GroupId,
b.`name` as OriginalItemName,
c.`name` as LocaleItemName,
a.Chance as DropChance,
a.MinCount as MinCount,
a.MaxCount as MaxCount
from creature_loot_template a 
LEFT JOIN item_template b on a.Item = b.entry 
LEFT JOIN item_template_locale c on c.ID = b.entry where c.locale = 'zhCN') as loot on loot.Entry = creature.entry
where locale.locale = 'zhCN' and creature.minlevel >= 80 and loot.ItemEntry is not null
and loot.LocaleItemName in ('勇气纹章','凯旋纹章','征服纹章','寒冰纹章')