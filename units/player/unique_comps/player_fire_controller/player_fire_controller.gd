extends FireControllerComponent
class_name PlayerFireControllerComponent
@export var player_stat_component:PlayerStatComponent
@export var player_stat_modification_component:StatModificationComponent
@export var audio_proc_manager:AudioProcManager
var base_timer := 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_fire_state = FireComponentState.ENABLED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	base_timer += delta
	
	if base_timer >= player_stat_component.firing_rate:
		current_fire_state = FireComponentState.ENABLED
		base_timer = 0.0
	if Input.is_action_just_pressed("test_spawn_bullet"):
		print("c" + str(player_stat_component.firing_rate))
		if not current_fire_state == FireComponentState.ENABLED:
			return
		
		current_fire_state = FireComponentState.DISABLED
		audio_proc_manager.shoot()
		bgc_slot.bullet_generator_container.fire_all()
