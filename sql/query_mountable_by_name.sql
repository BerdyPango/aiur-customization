SET 
@Locale                     := "zhCN",
@Class_Junk                 := 15,
@SubClass_Mount             := 5, # 坐骑
@ItemName                   := ""; 

SELECT 
item.entry,
item.class,
item.subclass,
item.name,
item.ItemLevel,
item.RequiredLevel,
item.RequiredSkill,
item.RequiredSkillRank,
item_locale.Name AS LocaleName,
item_locale.Description
FROM 
item_template AS item
LEFT JOIN item_template_locale AS item_locale ON item.entry = item_locale.ID 
WHERE item_locale.locale = @Locale 
AND item.class = @Class_Junk 
AND item.subclass = @SubClass_Mount
AND item_locale.Name like CONCAT("%",@ItemName,"%")
ORDER BY item.RequiredSkillRank