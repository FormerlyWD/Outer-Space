extends Node
class_name WeaponMenuCollection
@export var all_weapon_slots:Array[MenuWeapon]

@onready var all_weapon_definitions:Array[WeaponDefinition]
func _ready() -> void:
	pass
	
func insert_all():
	var count := 0
	all_weapon_definitions = load_weapon_def()
	all_weapon_definitions.shuffle()
	for menu_weapon in all_weapon_slots:
		menu_weapon.insert_weapon(all_weapon_definitions[count])
		count +=1
	
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
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		push_error("Cannot open folder: %s" % path)
	return weapon_def
