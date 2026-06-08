extends Node2D
class_name Bullet


@export var behavior_slot:BulletBehavior
var root_unit
@export var wave_amplitude :float= 40.0
@export var wave_frequency :float= 40.0
var time := 0.0
@export var projectile_speed:float
@export var damage:= 1.0
@export var pierce_value:float
@export var projectile_acc_speed:float
var acc_damage:float
var active:bool = false
var velocity :Vector2= Vector2.ZERO
var is_moving:bool = false
# Called when the node enters the scene tree for the first time.

func switch_to_enemy():
	$Sprite2D.texture = load("res://art (outer space)/bullet/enemy.png")
func switch_to_player():
	$Sprite2D.texture = load("res://art (outer space)/bullet/player.png")
func _ready() -> void:
	pass # Replace with function body.
func disable_and_retreat():
	disable()
	root_unit = null
	behavior_slot = null
	BulletPool.retreat_bullet(self)

func disable_actives():
	if active:
		visible = false
		is_moving = false
		set_process(false)
func disable():
	active = false
	visible = false
	is_moving = false 
	
	set_process(false)
func enable():
	active = true
	visible = true
	is_moving = true
	set_process(true)
func enable_actives():
	if active:
		visible = true
		is_moving = true
		set_process(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not projectile_acc_speed == 0.0:
		projectile_speed += projectile_acc_speed
		acc_damage = damage + (projectile_speed/10)

	if is_moving:
		
		if behavior_slot:
			behavior_slot.apply_movement(self,delta)
			
		if not behavior_slot:
			velocity = transform.x * projectile_speed
		
		
		position +=velocity * delta
