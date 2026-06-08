extends FunctionalPerk
var stat_component:StatComponent
var stat_modification_component:StatModificationComponent

var x_scale:float = 5
var x:float = 5


func apply_perk_effect():
	if perk_level == 0:
		perk_level =1
	current_perk_manager.stat_component.custom_bullet_behavior = "wavy"
	current_perk_manager.stat_component.custom_bullet_properties["wave_amplitude"] = 0.2
	current_perk_manager.stat_component.custom_bullet_properties["wave_frequency"] = 5.0
	current_perk_manager.stat_component.projectile_damage += x
func upgrade_perk_effect():
	perk_level +=1
	current_perk_manager.stat_component.projectile_damage += x_scale
	current_perk_manager.stat_component.custom_bullet_properties["wave_amplitude"] += 0.1
	current_perk_manager.stat_component.custom_bullet_properties["wave_frequency"] += 0.1
func get_base_description()-> String:
	return "Bullets move in a wave. +" + str(x) + " base dmg"
func get_upgrade_preface_description()-> String:
	
	return  "Bullets move in a wave. +" + str(x+x_scale) + " base dmg"
