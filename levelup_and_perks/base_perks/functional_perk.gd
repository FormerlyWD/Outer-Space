extends Node
class_name FunctionalPerk
@onready var current_perk_manager:PerkManagerComponent
var perk_level:int = 0
func apply_perk_effect():
	pass
func upgrade_perk_effect():
	pass
func get_base_description()-> String:
	return "In joy annd sorrow my hole is in your heart"
func get_upgrade_preface_description()-> String:
	return "In joy annd sorrow my hole is in your heart"
