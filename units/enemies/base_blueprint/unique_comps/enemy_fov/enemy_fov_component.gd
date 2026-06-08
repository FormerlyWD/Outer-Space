extends Node
class_name EnemyFovComponent
signal current_fov_flag_changed
enum FovFlag {ACTIVE,NONACTIVE}
@onready var current_fov_flag:FovFlag = FovFlag.NONACTIVE
@export var enemy_fire_controller:FireControllerComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		current_fov_flag = FovFlag.ACTIVE
		enemy_fire_controller.current_fire_state = FireControllerComponent.FireComponentState.ENABLED
		
