extends Control

@onready var visual_perk:Array[VisualPerk]
@export var visual_perk_slot_collection:Node
@export var weapon_menu_collection:WeaponMenuCollection
@export var amount_of_perks_pickable:int = 1

@onready var perk_applier 
var amount_of_perks_picked := 0
var is_weapon_mode:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%TouchManager.perk_chosen.connect(picked_perk)
	%TouchManager.weapon_chosen.connect(picked_weapon)
	
func weapon_mode():
	is_weapon_mode = true	
	%WeaponMenu.visible = true
	%MenuWiggle.visible = false
func perk_mode():
	is_weapon_mode = false
	%WeaponMenu.visible = false
	%MenuWiggle.visible = true


func picked_weapon(weapon_def:WeaponDefinition):
	References.player_node.weapon_switcher.switch(weapon_def)
	
	levelup_hide()
func picked_perk(perk:VisualPerk,vp_slot:VisualPerkSlot):
	
	%TouchManager.current_perk_selection_state = %TouchManager.PerkSelectionState.BUSY
	print("unindent")
	vp_slot.apply_uninsert_animation()
	await vp_slot.perk_uninsert_animation_done
	References.player_node.perk_manager_component.add_perk_to_character(perk)
	var perk_manager_component:PerkManagerComponent
	print("ded " + perk.perk_name)
	%TouchManager.current_perk_selection_state = %TouchManager.PerkSelectionState.FREE
	
	
	amount_of_perks_picked +=1
	if amount_of_perks_picked >= amount_of_perks_pickable:
		levelup_hide()
	
	
	
func levelup_show():
	if is_weapon_mode:
		weapon_menu_collection.insert_all()
	else:
		visual_perk_slot_collection.insert_all()
	visible = true
	$LvlUpAnimationPlayer.play("up")
	await $LvlUpAnimationPlayer.animation_finished
	%TouchManager.is_enabled = true
func levelup_hide():
	$LvlUpAnimationPlayer.play("down")
	%TouchManager.is_enabled = false
	await $LvlUpAnimationPlayer.animation_finished
	%Pauser.resume_everything()
	visible = false
	perk_mode()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
