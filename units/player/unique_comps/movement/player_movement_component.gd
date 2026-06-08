extends Node2D

enum UnitMovementState {
	STATIC,
	MOVING
}

@export var strength_buildup_speed:float =60
@export var max_strength:float = 1
var strength:float
@onready var current_unit_movement_state:UnitMovementState = UnitMovementState.STATIC
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_direction(delta:float) -> Vector2:
	var input_axis:Vector2 = Input.get_vector("left","right","up","down")

	if input_axis == Vector2.ZERO:
		current_unit_movement_state = UnitMovementState.STATIC
		strength = move_toward(strength,0.0,strength_buildup_speed*delta)
	else:
		strength = move_toward(strength,max_strength,strength_buildup_speed*delta)
		current_unit_movement_state = UnitMovementState.MOVING
	
	return input_axis*strength
# Called every frame. 'delta' is the elapsed time since the previous frame.

	
