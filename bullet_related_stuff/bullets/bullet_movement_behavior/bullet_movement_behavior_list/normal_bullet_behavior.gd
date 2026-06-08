extends BulletBehavior
class_name NormalBulletBehavior

func apply_movement(bullet:Bullet, delta:float = 0.1):
	bullet.velocity =  bullet.transform.x * bullet.projectile_speed
func modify_direction(direction:Vector2, bullet:Bullet, delta:float = 0.1) ->Vector2:
	return bullet.transform.x
