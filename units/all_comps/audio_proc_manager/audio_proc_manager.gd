extends Node2D
class_name AudioProcManager
var all_shooting_streams:Array[AudioStreamPlayer2D]
var all_hit_streams:Array[AudioStreamPlayer2D]
@export var default_db:= 0.0
func _ready() -> void:
	for child in $all_shoot.get_children():
		all_shooting_streams.append(child)
		child.volume_db = default_db
	for child in $all_hit.get_children():
		all_hit_streams.append(child)
		child.volume_db = default_db
func shoot():
	all_shooting_streams.pick_random().play()
	
func get_hit():
	all_hit_streams.pick_random().play()
