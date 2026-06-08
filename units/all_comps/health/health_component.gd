extends Node
class_name HealthComponent
@export var stat_component:StatComponent
@export var health_bar:TextureProgressBar
@export var death_flag_component:DeathFlagComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maximize_health()
func maximize_health():
	stat_component.current_health = stat_component.max_health
	update_max_health()
	update_current_heath()
func update_max_health():
	if health_bar:
		health_bar.max_value = stat_component.max_health
func update_current_heath():
	if health_bar:
		health_bar.value = stat_component.current_health
func deplete_health(value:float):

	if value <0:
		heal(value)
		return
	var damage_processed = stat_component.current_health
	stat_component.current_health = max(stat_component.current_health - value,0.0)
	update_current_heath()
	if stat_component.current_health == 0.0:
		death_flag_component.die()
		return ["killed", damage_processed-stat_component.current_health]
	else:
		return ["alive", damage_processed-stat_component.current_health]
func heal(value:float):
	stat_component.current_health = min(stat_component.current_health + value,stat_component.max_health )
	update_current_heath()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
