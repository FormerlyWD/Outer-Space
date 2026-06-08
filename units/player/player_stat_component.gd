extends StatComponent
class_name PlayerStatComponent

@export var firing_rate:= 15.0
@export var xp_gain := 100.0
@export var max_xp_scaling := 200
@export var max_xp := 400
@export var projectile_acc_speed:= 0.0
var current_xp := 0.0
var current_level :int= 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
