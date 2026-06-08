extends Node
class_name BulletDetectionComponent

@export var collision_boxes:Array[CollisionShape2D]
@export var root_node:CharacterBody2D
@export var health_component:HealthComponent
@export var hit_anim_component:HitAnimComponent
@export var consumable_bullet:String = "player_bullet"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for cb in collision_boxes:
		var new_collision_box := cb.duplicate()
		add_child(new_collision_box)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
 


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.get_parent() == null:
		return
	
	var parent = area.get_parent()
	if parent.is_in_group(consumable_bullet):
		consume_bullet_as_hit(parent)


func consume_bullet_as_hit(bullet:Bullet):
	var bullet_damage = bullet.acc_damage
	print("accdmg" + str(bullet.acc_damage))
	if bullet_damage == 0.0:
		bullet_damage = bullet.damage
	var health_stats:Array = health_component.deplete_health(bullet_damage)
	bullet.pierce_value -= health_stats[1]
	
	if health_stats[0] == "killed":
		if bullet.is_in_group("player_bullet"):
			if References.player_node.killing_flag_component:
				References.player_node.killing_flag_component.register_kill(bullet,root_node)
	else:
		if hit_anim_component:
			hit_anim_component.do_animation()

		
	
	
	if bullet.pierce_value <=0:
		bullet.disable_and_retreat()
