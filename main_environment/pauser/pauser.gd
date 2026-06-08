extends Node

@export var pausable_nodes:Array[Node]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause_game_test"):
		pause_everything()
	if Input.is_action_just_pressed("resume_game_test"):
		resume_everything()
func pause_everything():
	var all_enemies:Array= get_tree().get_nodes_in_group("enemy")
	for enemy in all_enemies:
		pause_nodes(enemy)
	pause_nodes(References.player_node)
	var all_bullets:Array= get_tree().get_nodes_in_group("bullets")
	for bullet in all_bullets:
		pause_bullet(bullet)
	for node in pausable_nodes:
		pause_nodes(node)




func resume_everything():
	var all_enemies:Array= get_tree().get_nodes_in_group("enemy")
	for enemy in all_enemies:
		resume_nodes(enemy)
	resume_nodes(References.player_node)
	var all_bullets:Array= get_tree().get_nodes_in_group("bullets")
	for bullet in all_bullets:
		resume_bullet(bullet)
	for node in pausable_nodes:
		resume_nodes(node)

func pause_bullet(bullet:Bullet):
	bullet.disable_actives()
func resume_bullet(bullet:Bullet):
	bullet.enable_actives()
func pause_nodes(selected_node:Node):
	selected_node.set_process(false)
	if "all_pausable_nodes" in selected_node:
		for node in selected_node.all_pausable_nodes:
			node.set_process(false)
	if "custom_pause" in selected_node:
		selected_node.custom_pause()
func resume_nodes(selected_node:Node):
	selected_node.set_process(true)
	if "all_pausable_nodes" in selected_node:
		for node in selected_node.all_pausable_nodes:
			node.set_process(true)
	if "custom_resume" in selected_node:
		selected_node.custom_resume()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
