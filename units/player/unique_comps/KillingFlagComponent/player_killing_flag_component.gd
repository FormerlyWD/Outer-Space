extends Node
class_name PlayerKillingFlagComponent
signal gained_kill(bullet_killer:Bullet,died_unit:CharacterBody2D)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func register_kill(bullet_killer:Bullet, died_unit:CharacterBody2D):
	print("person killed")
	if died_unit:
		if "value" in died_unit:
			print(died_unit.value)
	gained_kill.emit(bullet_killer,died_unit)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
