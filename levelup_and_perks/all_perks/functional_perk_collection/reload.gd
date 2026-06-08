extends FunctionalPerk
var stat_component:StatComponent
var stat_modification_component:StatModificationComponent




func apply_perk_effect():
	if perk_level == 0:
		perk_level =1
	var percentage:float =(100 - get_percentage(perk_level,50))/100
	current_perk_manager.stat_modification_component.change_stat_by_modifier(
		"firing_rate",percentage)
	
func get_percentage(level_up: float, reduction: float) -> float:
	level_up *= 3
	print("perentage" + str( (level_up / (level_up + reduction)) * 100.0))
	return ceil(((level_up / (level_up + reduction)) * 100.0)*1000)/1000
	
func upgrade_perk_effect():
	perk_level +=1
	print("imhere")
	apply_perk_effect()
func get_base_description()-> String:
	var percentage:float =get_percentage(1,50)
	
	return "Decrease Fire Rate  by -" + str((100-percentage)) + "%" 
func get_upgrade_preface_description()-> String:
	var percentage:float =get_percentage(perk_level+1,50)
	return  "Decrease Fire Rate  by -" + str((100-percentage)) + "%" 
