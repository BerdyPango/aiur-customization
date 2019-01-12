SET 
@LocaleName         := "zhCN";

SELECT 
item.entry,
item.class,
item.subclass,
item.name,
item.displayid,
item.Quality,
item.InventoryType,
item.ItemLevel,
item.RequiredLevel,
item_locale.Name AS LocaleName,
item_locale.Description
FROM item_template item
LEFT JOIN item_template_locale AS item_locale ON item.entry = item_locale.ID 
WHERE item_locale.locale = @LocaleName
AND item.entry = 47241