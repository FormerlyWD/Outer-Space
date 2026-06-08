extends Node2D
class_name StatComponent
@export var projectile_speed:float = 25
@export var projectile_damage:float = 10 
@export var bullet_accuracy:float
@export var pierce_value:float = 0
@export var max_bullet_spread:float

@export var custom_bullet_behavior:String
@export var custom_bullet_properties:Dictionary = {
	"wave_amplitude":0.0,
	"wave_frequency":1.2
}
@export var movement_speed:float = 25
@export var max_health:float = 25
var current_health:float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
