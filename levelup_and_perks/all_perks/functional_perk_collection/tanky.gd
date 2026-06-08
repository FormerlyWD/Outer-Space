extends FunctionalPerk
var stat_component:StatComponent
var stat_modification_component:StatModificationComponent

@onready var x_scale:float = 20
var x:= 60


func apply_perk_effect():
	if perk_level == 0:
		perk_level =1
	var percentage := (x+100)/100
	current_perk_manager.stat_modification_component.change_stat_by_modifier(
		"max_health",percentage)
	current_perk_manager.stat_component.current_health = max(current_perk_manager.stat_component.max_health/2,current_perk_manager.stat_component.current_health)
	

	
func upgrade_perk_effect():
	perk_level +=1
	x += x_scale
	apply_perk_effect()
func get_base_description()-> String:
	return "Increase max HP by +" + str((x+100)) + "%"
func get_upgrade_preface_description()-> String:
	var percentage := (x+100+x_scale)/100
	return "Increase max HP by " + str(percentage) + "%."
