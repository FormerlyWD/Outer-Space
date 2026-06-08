extends Node
class_name XpCalculationComponent

@export var player_stat_component:PlayerStatComponent
@export var kill_flag_component:PlayerKillingFlagComponent
@export var health_component:HealthComponent
@export var xp_bar_component:TextureProgressBar
@export var is_stackable:bool = false	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	kill_flag_component.gained_kill.connect(calculate_xp_from_kill)
	
	xp_bar_component.max_value = player_stat_component.max_xp
	xp_bar_component.value = player_stat_component.current_xp
	
func calculate_xp_from_kill(bullet_killer:Bullet, died_unit:CharacterBody2D):
	var normal:bool = true
	if died_unit:
		if "value" in died_unit:
			xp_gain(player_stat_component.xp_gain*died_unit.value)
			pass
			normal= false
	
	if normal:
		xp_gain(player_stat_component.xp_gain)
	
	if player_stat_component.current_xp >= player_stat_component.max_xp:
		if is_stackable:
			var level_up_instances:int = floori(player_stat_component.current_xp/ player_stat_component.max_xp)
			player_stat_component.current_xp -= player_stat_component.max_xp*level_up_instances
			player_stat_component.max_xp += player_stat_component.max_xp_scaling *level_up_instances
			
			player_stat_component.current_xp = max(player_stat_component.current_xp,0.0)
			player_stat_component.current_level += level_up_instances
			health_component.maximize_health()
			References.level_up_preview_node.level_up(player_stat_component.current_level,level_up_instances)
		else:
			health_component.maximize_health()
			player_stat_component.current_xp = 0.0
			player_stat_component.current_level += 1
			player_stat_component.max_xp += player_stat_component.max_xp_scaling
			References.level_up_preview_node.level_up(player_stat_component.current_level,1)
			
		xp_bar_component.value = player_stat_component.current_xp
		xp_bar_component.max_value = player_stat_component.max_xp
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func xp_gain(value:float):
	
	player_stat_component.current_xp +=  value
	xp_bar_component.value = player_stat_component.current_xp
