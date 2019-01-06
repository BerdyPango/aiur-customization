SET 
@Locale                     := "zhCN",
@Class_Recipe               := 9,
@SubClass_Book              := 0, # 法术书
@SubClass_Leatherworking    := 1, # 制皮
@SubClass_Tailoring         := 2, # 裁缝
@SubClass_Engineering       := 3, # 工程学
@SubClass_Blacksmithing     := 4, # 锻造
@SubClass_Cooking           := 5, # 烹饪
@SubClass_Alchemy           := 6, # 炼金
@SubClass_FirstAid          := 7, # 急救
@SubClass_Enchanting        := 8, # 附魔
@SubClass_Fishing           := 9, # 钓鱼
@SubClass_Jewelcrafting     := 10; # 珠宝加工

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
AND item.class = @Class_Recipe 
AND item.subclass = @SubClass_Book
ORDER BY item.RequiredSkillRank