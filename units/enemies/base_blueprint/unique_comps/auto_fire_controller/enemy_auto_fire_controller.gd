extends FireControllerComponent

@export var audio_proc:AudioProcManager
@export var firing_speed := 1.0
var firing_speed_left := 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	firing_speed_left = firing_speed
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	firing_speed_left -= delta
	if firing_speed_left <= 0:
		firing_speed_left = firing_speed
		_on_enemy_firing_speed_timeout()


func _on_enemy_firing_speed_timeout() -> void:
	if current_fire_state == FireComponentState.DISABLED:
		return
	audio_proc.shoot()
	bgc_slot.bullet_generator_container.fire_all()
