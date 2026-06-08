extends FunctionalPerk
var stat_component:StatComponent
var stat_modification_component:StatModificationComponent

@onready var x_scale:float = 250
var x:= 250


func apply_perk_effect():
	if perk_level == 0:
		perk_level =1
	current_perk_manager.stat_component.pierce_value +=  x

	
func upgrade_perk_effect():
	perk_level +=1
	current_perk_manager.stat_component.pierce_value += x_scale
func get_base_description()-> String:
	return "shot's pierce up to " + str(x) + " HP."
func get_upgrade_preface_description()-> String:
	
	return "shot's pierce up to " + str(x+x_scale) + " HP."
