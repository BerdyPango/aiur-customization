SET
@Locale              :="zhCN",
@CreatureName        := "法兰西斯";

SELECT 
vendor.entry AS Vendor_ID,
vendor.slot AS Slot,
vendor.item AS Item_ID,
vendor.maxcount AS Max_Count,
vendor.incrtime AS Refresh_Time_Seconds,
vendor.ExtendedCost,
item_locale.Name AS Name,
item_locale.Description AS Description
FROM npc_vendor AS vendor
LEFT JOIN item_template_locale AS item_locale ON vendor.item = item_locale.id
LEFT JOIN creature_template_locale AS creatureLocale ON vendor.entry = creatureLocale.entry
WHERE item_locale.locale = @Locale 
AND creatureLocale.locale = @Locale
AND creatureLocale.Name LIKE CONCAT("%",@CreatureName,"%");