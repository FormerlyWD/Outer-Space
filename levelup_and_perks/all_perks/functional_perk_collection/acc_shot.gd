extends FunctionalPerk
var stat_component:StatComponent
var stat_modification_component:StatModificationComponent

var x_scale:float = 0.1



func apply_perk_effect():
	if perk_level == 0:
		perk_level =1
	current_perk_manager.stat_component.projectile_acc_speed += x_scale
func upgrade_perk_effect():
	perk_level +=1
	current_perk_manager.stat_component.projectile_acc_speed += x_scale
func get_base_description()-> String:
	return "shot's speed and damage becomes accelerative"
func get_upgrade_preface_description()-> String:
	
	return "Increase acceleration by " + str(x_scale) 
