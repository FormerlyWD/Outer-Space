extends CharacterBody2D
class_name Player

@export var movement_component:PlayerMovementComponent
@export var stat_component:PlayerStatComponent
@export var killing_flag_component:PlayerKillingFlagComponent 
@export var perk_manager_component:PerkManagerComponent 
@export var health_component:HealthComponent
@export var weapon_switcher:WeaponSwitch

@export var all_pausable_nodes:Array[Node]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	References.player_node = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += BulletPool.camera_move
	
	var direction:Vector2 = movement_component.get_direction(delta)
	match movement_component.current_unit_movement_state:
		PlayerMovementComponent.UnitMovementState.STATIC:
			pass
		PlayerMovementComponent.UnitMovementState.MOVING:
			pass
	velocity = direction * stat_component.movement_speed
	
	move_and_slide()
