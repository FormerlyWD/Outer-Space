extends MovementComponent
class_name EnemyAiMovementComponent

enum EnemyMovementType {RANDOM, HOMING}
@export var current_enemy_movement_types:Array[EnemyMovementType] = [EnemyMovementType.RANDOM]
@export var base_parent:CharacterBody2D
@export var stat_component:StatComponent

@export_category("GENERAL")

@export_category("RANDOM")
@export var randf_x:Vector2 = Vector2(0.1,0.1)
@export var randf_y:Vector2 = Vector2(0.3,0.3)
@export var x_timer:float = 2.0
@export var y_timer:float = 2.0


@export_category("HOMING")
@export var homing_max_timer: = 15.0
var h_timer:float
@export var homing_strength := 1.0




@onready var x_timer_ref =  $RngMovementTimers/x
@onready var y_timer_ref = $RngMovementTimers/y
var random_num_y := randf_range(randf_x.x,randf_x.y)
var random_num_x  := randf_range(randf_y.x,randf_y.y)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	h_timer = homing_max_timer
	x_timer_ref.wait_time = x_timer
	x_timer_ref.start()
	y_timer_ref.wait_time = y_timer
	y_timer_ref.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func get_direction(delta:float):
	var last_direction_vector:Vector2 = Vector2.ZERO
	for enemy_movement_type in current_enemy_movement_types:
		match enemy_movement_type:
			EnemyMovementType.HOMING:
				h_timer -= delta
				if h_timer <= 0:
					h_timer = homing_max_timer
					var desired_direction_vector:Vector2 =(References.player_node.global_position - base_parent.global_position).normalized()
				
					var current = base_parent.velocity.normalized()
					var blended_direction_vector:Vector2 = current.lerp(desired_direction_vector,homing_strength * delta).normalized()
					last_direction_vector += desired_direction_vector
				else:
					pass
			
			EnemyMovementType.RANDOM:
				last_direction_vector += Vector2(random_num_x,random_num_y)
	
	return last_direction_vector
		




func _on_x_timeout() -> void:
	random_num_x = randf_range(randf_x.x,randf_x.y)



func _on_y_timeout() -> void:
	random_num_y = randf_range(randf_y.x,randf_y.y)
