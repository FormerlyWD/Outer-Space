extends Node
class_name HitAnimComponent
@export var root_parent:CharacterBody2D
enum AnimState {BUSY, FREE}
var current_animation_state:AnimState = AnimState.FREE
signal phase_done
var timer := 0.0
@export var phase_timer:float = 0.5
func _process(delta: float) -> void:
	if current_animation_state == AnimState.BUSY:
		timer += delta
		if timer >= phase_timer:
			timer = 0.0
			phase_done.emit()
func do_animation():
	if current_animation_state == AnimState.BUSY:
		return
	current_animation_state = AnimState.BUSY
	root_parent.modulate.b = 0
	await phase_done
	root_parent.modulate.b = 1
	await phase_done
	root_parent.modulate.b = 0
	await phase_done
	root_parent.modulate.b = 1
	current_animation_state = AnimState.FREE
