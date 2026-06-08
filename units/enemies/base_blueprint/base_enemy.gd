extends CharacterBody2D

@export var value:float = 27.0
@export var movement_component:EnemyAiMovementComponent
@export var stat_component:StatComponent
@export var death_flag:EnemyDeathFlagComponent
@export var all_pausable_nodes:Array[Node]
func _process(delta: float) -> void:
	
	
	var direction:Vector2 = movement_component.get_direction(delta)
	velocity = direction * stat_component.movement_speed
	
	move_and_slide()
