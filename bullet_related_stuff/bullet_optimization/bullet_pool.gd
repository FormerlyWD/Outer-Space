extends Node


@onready var camera_move:float = 0
@onready var base_bullet:PackedScene = preload("res://bullet_related_stuff/bullets/base_bullet.tscn")
@export var bullet_capacity:int = 200
@onready var bullet_pool:Array[Bullet]
@onready var active_bullet_pool:Array[Bullet]


@export var behaviors_to_class:Dictionary = {
	"wavy":WavyBulletBehavior,
	"homing":HomingBulletBehavior,
	"normal":NormalBulletBehavior
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for count in bullet_capacity:
		var new_bullet:Bullet = base_bullet.instantiate()
		new_bullet.disable()
		add_child(new_bullet)
		bullet_pool.append(new_bullet)
		
		
func confidently_set_group_mark(bullet:Bullet,group_name:String):
	bullet.add_to_group(group_name)
func set_group_mark(bullet:Bullet,group_name:String):
	if group_name == "":
		return
	bullet.remove_from_group("enemy_bullet")
	bullet.remove_from_group("player_bullet")
	bullet.add_to_group(group_name)
	
		
func get_bullet():
	if bullet_pool.is_empty():
		var oldest_active_bullet = active_bullet_pool.pop_front()
		oldest_active_bullet.disable_and_retreat()
		return oldest_active_bullet
	var new_bullet = bullet_pool.pop_back()
	
	new_bullet.behavior_slot = null
	return new_bullet
	
func start_bullet(bullet:Bullet):
	active_bullet_pool.append(bullet)
	bullet.enable()
func retreat_bullet(bullet:Bullet):
	bullet.remove_from_group("enemy_bullet")
	bullet.remove_from_group("player_bullet")
	active_bullet_pool.erase(bullet)
	bullet_pool.append(bullet)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
