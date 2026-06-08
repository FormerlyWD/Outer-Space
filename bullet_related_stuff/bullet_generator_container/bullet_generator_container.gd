extends BulletGeneratorContainer



# Called when the node enters the scene tree for the first time.
func initiate_effects():
	pass
	stat_component.projectile_damage = 15
	print("oh.")
func _ready() -> void:
	format_all()

		
func fire_all():

	for bg in all_bullet_generators:
		bg.spawn_bullet()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
