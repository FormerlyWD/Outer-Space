extends Control
@onready var starting_pos:float = 3.75
@onready var ending_pos:float = -83
@export var anim_duration:float
@export var transition:Tween.TransitionType
var show_tween:Tween
var hide_tween:Tween
func description_show():
	if hide_tween:
		hide_tween.kill()
		hide_tween = null
	var new_tween:Tween = create_tween()
	show_tween = new_tween
	new_tween.tween_property(self,
	"position:x",
	ending_pos,
	anim_duration).set_trans(transition)
	
	
func description_hide():
	if show_tween:
		show_tween.kill()
		show_tween = null
	var new_tween:Tween = create_tween()
	hide_tween = new_tween
	new_tween.tween_property(self,
	"position:x",
	starting_pos,
	anim_duration).set_trans(transition)
