extends LookAtComponent
class_name EnemyLookAtComponent
enum LookType {RANDOM, PLAYER, ROTARY}
@export var current_look_type:LookType = LookType.RANDOM
@export var root_parent:CharacterBody2D
@export var look_radius := 15.0
@export var turn_speed := 5000
@export var timer_count:= 1.0
var timer := 0.0
var current_angle := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = timer_count


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match current_look_type:
		LookType.RANDOM:
			process_random_look(delta)
		LookType.PLAYER:
			root_parent.look_at(References.player_node.global_position)
			root_parent.rotate(3.14159)
		LookType.ROTARY:
			root_parent.rotation +=delta

func process_random_look(delta:float) -> void:
	timer -= delta
	
	if timer <= 0:
		timer = timer_count
		var deg_to_rad_look_radius = deg_to_rad(look_radius)
		var offset := randf_range(-deg_to_rad_look_radius,deg_to_rad_look_radius)
		current_angle = rotation + offset
	
	root_parent.rotation = lerp_angle(rotation, current_angle, turn_speed* delta)
		
