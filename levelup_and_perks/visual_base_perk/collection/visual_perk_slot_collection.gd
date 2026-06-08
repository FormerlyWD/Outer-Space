extends Node
@export var visual_perk_slots:Array[VisualPerkSlot]
@onready var visual_perk:Array[VisualPerk]
@onready var functional_perks:Array[FunctionalPerk]
@onready var chosen_visual_perks:Array[VisualPerk]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visual_perk = load_visual_perks()
	
func insert_all():
	var count := 0
	visual_perk.shuffle()
	print("------------")
	if References.player_node.perk_manager_component.current_perk_manager_state == PerkManagerComponent.PerkManagerState.FULL:
		visual_perk.assign(References.player_node.perk_manager_component.indexed_all_perks) 
	for vp:VisualPerkSlot in visual_perk_slots:
		
		print("CONTENDER:" + visual_perk[count].perk_name)
		vp.switch_to_unbordered()
		if References.player_node.perk_manager_component.all_perks.has(visual_perk[count].perk_name):
			vp.switch_border_to_upgrade()
			
		elif References.player_node.perk_manager_component.all_perk_tags.has(visual_perk[count].perk_tag):
			while References.player_node.perk_manager_component.all_perk_tags.has(visual_perk[count].perk_tag) and not References.player_node.perk_manager_component.all_perks.has(visual_perk[count].perk_name):
				print("CONTENDERLOSS:" + visual_perk[count].perk_name )
				count +=1
				print("CONTENDER:" + visual_perk[count].perk_name)
		if References.player_node.perk_manager_component.all_perks.has(visual_perk[count].perk_name):
			vp.switch_border_to_upgrade()
		vp.insert(visual_perk[count])
		print("Inserted:", visual_perk[count].perk_name, " | Slot now has:", vp.inserted_vp.perk_name)
		count +=1
	
	
	animate_all_perks_independently()
		
func animate_all_perks_independently():
	for vp:VisualPerkSlot in visual_perk_slots:
		vp.apply_insert_animation()
		await vp.perk_insert_animation_done
		
func load_visual_perks() -> Array[VisualPerk]:
	var path:="res://levelup_and_perks/all_perks/visual_perks_resources/"
	var perks: Array[VisualPerk] = []
	var dir := DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and file_name.ends_with(".tres"):
				var res = load(path + "/" + file_name)
				if res is VisualPerk:
					if res.perk_name == "":
						res.perk_name = file_name.get_basename()
					perks.append(res)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		push_error("Cannot open folder: %s" % path)
	return perks
