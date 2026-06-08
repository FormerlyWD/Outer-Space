extends Node
class_name PerkManagerComponent
enum PerkManagerState { FULL, FREE}
@onready var current_perk_manager_state:PerkManagerState = PerkManagerState.FREE
@export var stat_component:StatComponent
@export var stat_modification_component:StatModificationComponent
@export var maximum_slots:int = 3

@export var visual_perk_slot_preview:VisualPerkSlotsPreviews
@onready var all_perks:Dictionary
@onready var indexed_all_perks:Array[VisualPerk]
@onready var all_perk_tags:Array[String]
var current_perk_amount:= 0
func add_perk_to_character(visual_perk:VisualPerk):

		
	
		
		
	
	
	if all_perks.has(visual_perk.perk_name):
		all_perks[visual_perk.perk_name].upgrade_perk_effect()
		
		visual_perk_slot_preview.upgrade_perk(indexed_all_perks.find(visual_perk), all_perks[visual_perk.perk_name].perk_level)
		
		return
		
	if current_perk_manager_state == PerkManagerState.FULL:
		return PerkManagerState.FULL
	current_perk_amount +=1
	var new_functional_perk:FunctionalPerk = FunctionalPerk.new()
	new_functional_perk.set_script(visual_perk.functional_perk_reference)
	new_functional_perk.name = visual_perk.perk_name
	if not visual_perk.perk_tag == "":
		all_perk_tags.append(visual_perk.perk_tag)
	new_functional_perk.current_perk_manager = self
	
	new_functional_perk.apply_perk_effect()
	add_child(new_functional_perk)
	indexed_all_perks.append(visual_perk)
	all_perks[visual_perk.perk_name] = new_functional_perk
	
	if current_perk_amount >= maximum_slots:
		current_perk_manager_state = PerkManagerState.FULL
		
	visual_perk_slot_preview.insert_perk(current_perk_amount-1,visual_perk)
