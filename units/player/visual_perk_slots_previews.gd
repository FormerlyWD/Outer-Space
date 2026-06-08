extends Node2D
class_name VisualPerkSlotsPreviews
@onready var all_vp_slots:Array[VisualPerkSlot]


func _ready() -> void:
	for child in get_children():
		all_vp_slots.append(child)


func insert_perk(index:int, visual_perk:VisualPerk):
	all_vp_slots[index].insert(visual_perk)
	all_vp_slots[index].apply_insert_animation()
	all_vp_slots[index].change_num_val(1)
func upgrade_perk(index:int, upgrade_lvl:int):
	all_vp_slots[index].change_num_val(upgrade_lvl)
