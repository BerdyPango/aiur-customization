SET
@Locale         := "zhCN",
@Alchemy        := 900065,
@Blacksmithing  := 900066,
@Enchanting     := 900067,
@Engineering    := 900068,
@Inscription    := 900069,
@Jewelcrafting  := 900070,
@Leatherworking := 900071,
@Tailoring      := 900074,
@Cooking        := 900085;

select 
vendor.entry as Vendor_ID,
vendor.slot as Slot,
vendor.item as Item_ID,
vendor.maxcount as Max_Count,
vendor.incrtime as Refresh_Time_Seconds,
vendor.ExtendedCost,
item.Name as Name,
item.Description as Description
from npc_vendor as vendor 
left join item_template_locale as item on vendor.item=item.id
where item.locale = @Locale and
entry=@Cooking;