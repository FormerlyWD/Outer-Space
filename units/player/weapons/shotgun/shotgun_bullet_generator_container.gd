extends BulletGeneratorContainer

@export var bifurcation:bool = false

var radius := 20
var angle := 0.0
var speed := 1.5

var offset := Vector2(0,0)
func initiate_effects():
	stat_component.projectile_damage = 5
	print("oh.")
func _process(delta: float) -> void:
	if bifurcation:
		circular_motion()
func circular_motion():
	angle += speed * get_process_delta_time()
	
	var x_pos = cos(angle)
	var y_pos = sin(angle)
	
	
	position.x = radius * x_pos + offset.x
	position.y = radius * y_pos + offset.y
func _ready() -> void:
	format_all()
	
func format_all():
	for bg in all_bullet_generators:
		bg.stat_component = stat_component
		bg.bullet_mark = mark_bullet
		if root_unit:
			bg.root_unit = root_unit

		
		
