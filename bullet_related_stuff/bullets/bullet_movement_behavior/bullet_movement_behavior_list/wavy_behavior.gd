extends BulletBehavior
class_name WavyBulletBehavior

@export var wave_amplitude :float= 40.0
@export var wave_frequency :float= 40.0
var time := 0.0


func _init(values:Dictionary) -> void:
	wave_amplitude = values.get("wave_amplitude",wave_amplitude)
	wave_frequency = values.get("wave_frequency",wave_frequency)
	
	
# Called when the node enters the scene tree for the first time.


func apply_movement(bullet:Bullet, delta:float = 0.1):
	time += delta
	var default_forward = bullet.transform.x * bullet.projectile_speed * delta
	var side_movement = bullet.transform.y * sin(time * wave_frequency) * wave_amplitude  
		
	bullet.position += default_forward + side_movement

# Called every frame. 'delta' is the elapsed time since the previous frame.
func modify_direction(direction:Vector2, bullet:Bullet, delta:float = 0.1):
	time += delta
	var side_movement = bullet.transform.y * sin(time * wave_frequency) * wave_amplitude  
	
	return side_movement 
