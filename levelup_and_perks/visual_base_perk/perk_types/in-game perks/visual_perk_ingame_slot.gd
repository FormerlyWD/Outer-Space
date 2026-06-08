extends Node2D


signal perk_insert_animation_done()
signal perk_uninsert_animation_done()
@onready var inserted_vp:VisualPerk 
@export var default_y_offset:= 1.0
@export var starting_anim_y_offset := 100.0
@export var animation_duration := 1.0
@export var animation_type := Tween.TransitionType.TRANS_BACK
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var newvisual := VisualPerk.new()
	newvisual.image = load("res://art (outer space)/perks/testt.png")
	insert(newvisual)
func insert(perk:VisualPerk):
	$mouse_detect/text_area/name.text = %TouchManager.get_two_line(perk.trunciated_perk_name)
	
	inserted_vp = perk
	$perk.texture = perk.image
	#animated
	$perk.visible = false


func apply_uninsert_animation():
	$perk.position.y=  default_y_offset
	$perk.visible = true
	
	var slide_tween:= create_tween()
	slide_tween.tween_property(
		$perk,
		"position:y",
		1000.0,
		animation_duration).set_trans(animation_type)
	
	await slide_tween.finished
	$perk.visible = false
	perk_uninsert_animation_done.emit()
func apply_insert_animation():
	$perk.position.y=  starting_anim_y_offset
	$perk.visible = true
	
	var slide_tween:= create_tween()
	slide_tween.tween_property(
		$perk,
		"position:y",
		default_y_offset,
		animation_duration).set_trans(animation_type)
	
	await slide_tween.finished
	perk_insert_animation_done.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_detect_mouse_entered() -> void:
	
	%TouchManager.on_entered(self)

func _on_mouse_detect_mouse_exited() -> void:

	%TouchManager.on_exited()
