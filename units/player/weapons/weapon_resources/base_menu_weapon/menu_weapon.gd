extends Node2D
class_name MenuWeapon
@export var current_weapon:WeaponDefinition




func insert_weapon(new_weapon:WeaponDefinition):
	current_weapon = new_weapon
	$mouse_detect/text_area/name.text = %TouchManager.get_two_line(new_weapon.trunciated_weapon_name)
	
	$weapon_sprite.texture = new_weapon.weapon_image
	


func _on_mouse_detect_mouse_entered() -> void:
	print("ho")
	%TouchManager.on_weapon_entered(self)


func _on_mouse_detect_mouse_exited() -> void:
	%TouchManager.on_exited()
