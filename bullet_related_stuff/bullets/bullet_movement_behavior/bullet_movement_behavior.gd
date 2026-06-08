extends Node
class_name BulletBehavior


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _init(values:Dictionary) -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func apply_movement(bullet:Bullet, delta:float = 0.1):
	pass
func modify_direction(direction:Vector2, bullet:Bullet, delta:float = 0.1) ->Vector2 :
	return direction
