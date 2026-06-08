extends Node
class_name FireControllerComponent
enum FireComponentState {DISABLED, ENABLED, BRICKDISABLED}
@onready var current_fire_state:FireComponentState = FireComponentState.DISABLED
@export var bgc_slot:BulletGeneratorContainerSlot
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
