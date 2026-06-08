extends Node
class_name StatModificationComponent
@export var stat_component:StatComponent
@export var health_component:HealthComponent
var original_value_variable:Dictionary
var modified_value_variable:Dictionary
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func change_stat_by_modifier(stat_name:String, stat_value_modifier:float):
	
	
	if not original_value_variable.has(stat_name):
		if stat_component.get(stat_name) == null:
			return
		original_value_variable[stat_name] = stat_component.get(stat_name)
		
	
	modified_value_variable[stat_name] = original_value_variable[stat_name] *stat_value_modifier
	stat_component.set(stat_name,modified_value_variable[stat_name])
	print(stat_component.get(stat_name))
	if stat_name == "max_health" :
		if health_component:
			health_component.update_max_health()
# Called every frame. 'delta' is the e = lapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
