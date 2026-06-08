extends DeathFlagComponent
class_name EnemyDeathFlagComponent
@export var killed_bullet_type:String = "enemy_bullet"
var is_enemy_dead:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func die(non_bullet:bool = false):
	
	if is_enemy_dead:
		return
	is_enemy_dead = true	
	
	print("death has happened")
	if not killed_bullet_type == "":
		for bullet:Bullet in get_tree().get_nodes_in_group(killed_bullet_type):
			if bullet.root_unit == root_parent:
				bullet.disable_and_retreat()
	else:
		pass
	if root_parent:
		
		EnemyManager.current_amount_of_enemies -= 1
		EnemyManager.all_spawned_enemies.erase(root_parent)
		root_parent.queue_free()
		
	
