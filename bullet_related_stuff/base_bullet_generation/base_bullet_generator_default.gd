extends Node2D
class_name BulletGenerator

@export var stat_component:StatComponent
@export var root_unit:CharacterBody2D
@export var bullet_mark:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn_bullet():
	var new_bullet = BulletPool.get_bullet()

	if new_bullet == null:
		return
		
	
	var b:Bullet = new_bullet
	
	if bullet_mark == "enemy_bullet":
		b.switch_to_enemy()
	else:
		b.switch_to_player()
		
	b.projectile_speed = stat_component.projectile_speed
	b.pierce_value = stat_component.pierce_value
	if "projectile_acc_speed" in stat_component:
		b.projectile_acc_speed =stat_component.projectile_acc_speed
	else:
		b.projectile_acc_speed = 0
	b.damage = stat_component.projectile_damage
	if not stat_component.custom_bullet_behavior == "":
		b.behavior_slot = BulletPool.behaviors_to_class[stat_component.custom_bullet_behavior].new(stat_component.custom_bullet_properties)
		
	if root_unit:
		b.root_unit = root_unit
	
	var spread = stat_component.max_bullet_spread * (1.0 - stat_component.bullet_accuracy / 100.0)
	var random_offset:float = randf_range(-spread, spread)
	b.global_rotation = global_rotation + random_offset
	
	BulletPool.confidently_set_group_mark(b,bullet_mark)
	b.global_position = global_position
	BulletPool.start_bullet(b)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

			
