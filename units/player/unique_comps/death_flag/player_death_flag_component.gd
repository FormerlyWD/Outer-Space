extends DeathFlagComponent
@export var stat_component:PlayerStatComponent
func die():
	References.level_up_preview_node.die()
