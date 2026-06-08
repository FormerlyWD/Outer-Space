extends Node2D
class_name WeaponSwitch
@export var bullet_slot:BulletGeneratorContainerSlot
@export var base_parent:Player
@onready var all_weapon_definitions:Array[WeaponDefinition]
@onready var weapon_definition_named:Dictionary


func _ready() -> void:
	all_weapon_definitions = load_weapon_def() 
func switch(weapon_def:WeaponDefinition):
	$"../Ui/weapon_texture".texture = weapon_def.weapon_image
	var string_name :String = weapon_def.weapon_bgcs_path
	var clean = string_name.strip_edges().trim_prefix("\"").trim_suffix("\"")
	

	clean = clean.replace("\u200B", "") # zero-width space
	clean = clean.replace("\uFEFF", "") # BOM
	clean = clean.replace("\u00A0", "") # non-breaking space

	var packed :PackedScene= load(clean)
	
	var new_weapon :BulletGeneratorContainer= packed.instantiate()
	bullet_slot.bullet_generator_container = new_weapon
	base_parent.add_child.call_deferred(new_weapon)
	new_weapon.stat_component = base_parent.stat_component 
	new_weapon.mark_bullet = "player_bullet"
	new_weapon.initiate_effects()

	new_weapon.format_all()
	
	new_weapon.position=weapon_def.position_offset

func shot_gun():
	for child in get_children():
		if not child == $ShotGunBulletGeneratorContainer:
			child.queue_free()
	bullet_slot.bullet_generator_container = $ShotGunBulletGeneratorContainer
	$ShotGunBulletGeneratorContainer.reparent.call_deferred(base_parent)
	$ShotGunBulletGeneratorContainer.stat_component = base_parent.stat_component 
	$ShotGunBulletGeneratorContainer.mark_bullet = "player_bullet"
	$ShotGunBulletGeneratorContainer.format_all()
	
	
	
func load_weapon_def() -> Array[WeaponDefinition]:
	var path:= "res://units/player/weapons/weapon_resources/pool/"
	var weapon_def: Array[WeaponDefinition] = []
	var dir := DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and file_name.ends_with(".tres"):
				var res = load(path + "/" + file_name)
				if res is WeaponDefinition:
					weapon_def.append(res)
					weapon_definition_named[file_name.get_basename()] = res
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		push_error("Cannot open folder: %s" % path)
	return weapon_def
