extends FunctionalPerk
var stat_component:StatComponent
var stat_modification_component:StatModificationComponent

@onready var x_scale:float = 10
@export var x:float = 50


func apply_perk_effect():
	if perk_level == 0:
		perk_level =1
	var percentage:float =( x+100)/100
	current_perk_manager.stat_modification_component.change_stat_by_modifier(
		"xp_gain",percentage)

	
func upgrade_perk_effect():
	perk_level +=1
	x += x_scale
	apply_perk_effect()
func get_base_description()-> String:
	return "Increease XP Gain by +" + str((x+100)) + "%" 
func get_upgrade_preface_description()-> String:
	var percentage:float =( x+(x_scale)+100)
	return "Increease XP Gain by +" + str(percentage) + "%" 
