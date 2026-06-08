extends Node
var currently_focused_vp:VisualPerk
var currently_focused_vp_slot:VisualPerkSlot

var currently_focused_weapon:WeaponDefinition
var currently_focused_weapon_slot:MenuWeapon
enum PerkSelectionState { BUSY,FREE}
@onready var current_perk_selection_state: = PerkSelectionState.FREE
@onready var is_enabled:bool = false
signal perk_chosen(visual_perk:VisualPerk, vp_slot:VisualPerkSlot)
signal weapon_chosen(weapon_Definition:WeaponDefinition)
func _input(event: InputEvent) -> void:
	if not is_enabled or current_perk_selection_state == PerkSelectionState.BUSY:
		return
	if Input.is_action_just_pressed("select"):
		
		if currently_focused_vp:
			
			perk_chosen.emit(currently_focused_vp,currently_focused_vp_slot)
			
		if currently_focused_weapon:
			print("ho2")
			weapon_chosen.emit(currently_focused_weapon)
			
			
			
			
func on_entered(vp_slot:VisualPerkSlot):
	currently_focused_weapon = null
	if References.player_node.perk_manager_component.all_perks.has(vp_slot.inserted_vp.perk_name):
		%description.text = References.player_node.perk_manager_component.all_perks[vp_slot.inserted_vp.perk_name].get_upgrade_preface_description()
		%InnermostDescriptionMenu.description_show()
	elif vp_slot.inserted_vp.functional_perk_reference:
		var script:Script = vp_slot.inserted_vp.functional_perk_reference
	
		%description.text = script.new().get_base_description()
		%InnermostDescriptionMenu.description_show()
	else:
		
		%description.text = "heres nothing here.. cheers"
		%InnermostDescriptionMenu.description_show()
	currently_focused_vp = vp_slot.inserted_vp
	currently_focused_vp_slot = vp_slot


func on_weapon_entered(weapon_menu:MenuWeapon):
	
	currently_focused_vp = null
	currently_focused_weapon = weapon_menu.current_weapon
	currently_focused_weapon_slot  = weapon_menu
	
	%description.text = weapon_menu.current_weapon.description
	%InnermostDescriptionMenu.description_show()
func on_exited():
	%InnermostDescriptionMenu.description_hide()
	%TouchManager.currently_focused_vp = null
	currently_focused_weapon = null
	currently_focused_weapon_slot = null
	%TouchManager.currently_focused_vp_slot = null
func get_two_line(text: String) -> String:
	var parts = text.split("/n")
	if parts.size() >= 2:
		return parts[0] + "\n" + parts[1] 
	return text
