SET
@Locale                             :="zhCN",
@FactionId_KaluaK                   := 1073, # 卡鲁亚克
@FactionId_AshenVerdict             := 1156, # 灰烬审判军
@FactionId_KirinTor                 := 1090, # 肯瑞托
@FactionId_SilverCovenant           := 1094, # 银色北伐军
@FactionId_SonsOfHodir              := 1119, # 霍迪尔之子
@FactionId_KnightsOfTheEbonBlade    := 1098, # 黑锋骑士团
@FactionId_WyrmrestAccord           := 1091  # 龙眠联军
;

SELECT 
vendor.entry AS Vendor_ID,
vendor.slot AS Slot,
vendor.item AS Item_ID,
vendor.maxcount AS Max_Count,
vendor.incrtime AS Refresh_Time_Seconds,
vendor.ExtendedCost,
item.RequiredReputationFaction,
item.RequiredReputationRank,
item_locale.Name AS Name,
item_locale.Description AS Description
FROM npc_vendor AS vendor
LEFT JOIN item_template AS item on vendor.item = item.entry
LEFT JOIN item_template_locale AS item_locale ON vendor.item = item_locale.id
LEFT JOIN creature_template_locale AS creatureLocale ON vendor.entry = creatureLocale.entry
WHERE item_locale.locale = @Locale 
AND creatureLocale.locale = @Locale
AND item.RequiredReputationFaction = @FactionId_AshenVerdict