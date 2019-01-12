SET
@Locale     :="zhCN",
@NpcName    :="萨尤斯";

SELECT DISTINCT
creature_template.entry AS Entry,
creature_template.name AS Name,
creatureLocale.Name AS LocaleName,
creature_template.subname AS SubName,
creature_template.IconName,
creature_template.gossip_menu_id AS GossipMenuId,
gossip_menu_option.OptionId,
gossip_menu_option.OptionIcon,
gossip_menu_option.OptionText,
gossip_menu_option.OptionBroadcastTextID,
gossip_menu_option.OptionType,
gossip_menu_option.OptionNpcFlag,
creature_template.npcflag AS NpcFlag,
gossip_menu_option.ActionMenuID,
gossip_menu_option.ActionPoiID,
gossip_menu_option.BoxCoded,
gossip_menu_option.BoxMoney,
gossip_menu_option.BoxBroadcastTextID,
gossip_menu_option.VerifiedBuild,
creature_template.rank AS Rank,
creature_template.family AS Family,
creature_template.trainer_type AS TrainerType,
creature_template.trainer_spell AS TrainerSpell,
creature_template.trainer_class AS TrainerClass,
creature_template.trainer_race AS TrainerRace,
creature_template.MovementType
FROM gossip_menu_option
LEFT JOIN creature_template ON gossip_menu_option.MenuId = creature_template.gossip_menu_id
LEFT JOIN creature_template_locale AS creatureLocale ON creature_template.entry = creatureLocale.entry
LEFT JOIN gossip_menu ON gossip_menu.MenuId = gossip_menu_option.MenuId
WHERE creatureLocale.locale = @Locale
AND creatureLocale.Name LIKE CONCAT("%",@NpcName,"%");