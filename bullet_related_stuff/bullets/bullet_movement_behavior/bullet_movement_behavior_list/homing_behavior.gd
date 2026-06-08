extends BulletBehavior
class_name HomingBulletBehavior
@export var homing_strength := 15.0
var homing_target
var is_homing_target_player:bool = false
@export var direction_scale := 1
@export var random_angle := 1
@export var random_accel := 1
func _init(values:Dictionary) -> void:
	homing_strength = values.get("homing_strength",homing_strength)
	direction_scale = values.get("direction_scale", direction_scale)
	random_angle = values.get("random_angle", random_angle)
	random_accel = values.get("random_accel", random_accel)
	homing_target = values.get("homing_target",homing_target)
	is_homing_target_player = values.get("is_homing_target_player",is_homing_target_player)
func apply_movement(bullet:Bullet, delta:float = 0.1):
	var homing_pos 
	if is_homing_target_player:
		homing_pos = References.player_node.global_position
	elif homing_target:
		homing_pos = homing_target.global_position
	else:
		homing_pos = Vector2(-900,-900)
	var desired_direction_vector:Vector2 =(homing_pos - bullet.global_position).normalized()
	
	var jitter_angle = randf_range(-random_angle,random_angle)
	desired_direction_vector = desired_direction_vector.rotated(jitter_angle)
	
	var current = bullet.velocity.normalized()
	var blended_direction_vector:Vector2 = current.lerp(desired_direction_vector,homing_strength * delta).normalized()
	
	
	
	var accel_randomness = Vector2(
		randf_range(-random_accel,random_accel),
		randf_range(-random_accel,random_accel)
	)
	
	bullet.velocity = (blended_direction_vector * bullet.projectile_speed * direction_scale) + accel_randomness
	
	#bullet.rotation = bullet.velocity.angle()
