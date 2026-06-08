extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_sides_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if not area:
		return
	var bullet = area.get_parent()
	
	if area.get_parent().is_in_group("bullets"):
		bullet.disable_and_retreat()
	else:
		print("bullet123")


func _on_top_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if not area:
		return
	var bullet = area.get_parent()
	if area.get_parent().is_in_group("bullets"):
		bullet.disable_and_retreat()
	else:
		if area.get_parent().is_in_group("enemy"):
			if "death_flag" in area.get_parent():
				var enemy = area.get_parent()
				if enemy.death_flag:
					enemy.death_flag.die(true)

func _on_bottom_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if not area:
		return
	var bullet = area.get_parent()
	if area.get_parent().is_in_group("bullets"):
		bullet.disable_and_retreat()
	else:
		print("bullet123")
