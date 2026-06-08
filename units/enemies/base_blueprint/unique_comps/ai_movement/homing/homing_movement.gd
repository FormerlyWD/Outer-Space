extends Node

@export var base_movement:EnemyAiMovementComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func get_direction():
	pass
	#base_movement.base_parent.position += direction_vector * base_movement.stat_component.movement_speed * get_process_delta_time()
		
