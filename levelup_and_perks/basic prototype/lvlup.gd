extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	References.level_up_preview_node = self
	
	%Pauser.pause_everything()
	$"../LevelUp".weapon_mode()
	$"../LevelUp".levelup_show()


func die():
	%Pauser.pause_everything()
	
	
func level_up(cur_lvl:int, level_up_instances:int):
	%Pauser.pause_everything()
	text = "lvl" + str(cur_lvl)
	
	$"../LevelUp".levelup_show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
