extends Node2D
@onready var first_enemy:PackedScene = preload("res://new_enemies/aliens/blue.tscn")
@export var set_timer:= 1.0
@onready var enemy_pool:Array[PackedScene] = [preload("res://new_enemies/aliens/blue.tscn"),
 preload("res://new_enemies/aliens/purple.tscn"),
preload("res://new_enemies/aliens/green.tscn"),
 preload("res://new_enemies/aliens/white.tscn"),
preload("res://new_enemies/spaceships/spaceship_pink.tscn")
]
var is_paused:bool = false
var timer:=0.0
@onready var x_enemy_scaling := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = set_timer
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_paused:
		return
	if EnemyManager.current_amount_of_enemies >= EnemyManager.maximum_amount_of_enemies:
		timer = set_timer
		
		return
	timer -= delta
	while timer <= 0:
		timer = set_timer
		if EnemyManager.current_amount_of_enemies < EnemyManager.maximum_amount_of_enemies:
			spawn()
		else: break


func get_random_y_pos() -> float:
	$SpawnLine.points[0]
	$SpawnLine.points[1]
	return randf_range($SpawnLine.points[0].y,$SpawnLine.points[1].y)
func spawn():
	if EnemyManager.current_amount_of_enemies >= EnemyManager.maximum_amount_of_enemies:
		return
	x_enemy_scaling +=1
	EnemyManager.current_amount_of_enemies +=1
	var new_enemy:CharacterBody2D = enemy_pool.pick_random().instantiate()
	new_enemy.stat_component.projectile_damage += 5*x_enemy_scaling
	add_child(new_enemy)
	new_enemy.position = Vector2(
		0,
		get_random_y_pos()
	)
	EnemyManager.all_spawned_enemies.append(new_enemy)
	EnemyManager.enemy_spawned.emit(new_enemy)
	
func custom_pause():
	is_paused = true
func custom_resume():
	is_paused = false
