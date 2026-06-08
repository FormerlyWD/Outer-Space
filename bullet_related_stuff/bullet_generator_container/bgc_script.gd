extends Node2D
class_name BulletGeneratorContainer

@export var all_bullet_generators:Array[BulletGenerator]
@export var stat_component:StatComponent
@export var root_unit:CharacterBody2D
@export var mark_bullet:String
# Called when the node enters the scene tree for the first time.
func initiate_effects():
	return
func _ready() -> void:
	format_all()
func format_all():
	for bg in all_bullet_generators:
		bg.stat_component = stat_component
		bg.bullet_mark = mark_bullet
		bg.root_unit = root_unit
func fire_all():

	for bg in all_bullet_generators:
		bg.spawn_bullet()
