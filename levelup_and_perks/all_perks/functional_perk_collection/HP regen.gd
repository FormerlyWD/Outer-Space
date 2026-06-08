extends FunctionalPerk
var stat_component:StatComponent
var stat_modification_component:StatModificationComponent

@onready var x_scale:float = 2
@export var x:float = 1
var timer:= 0.0

func _process(delta: float) -> void:
	timer += delta
	if timer >= 1:
		regen_hp()
		timer = 0.0
func apply_perk_effect():
	if perk_level == 0:
		perk_level =1
	
func regen_hp():
	References.player_node.health_component.heal(x)
	
func upgrade_perk_effect():
	perk_level +=1
	x += x_scale
	
func get_base_description()-> String:
	return "Gain +" + str(x) + " HP regen." 
func get_upgrade_preface_description()-> String:
	return "Gain +" + str(x+x_scale) + " HP regen." 
