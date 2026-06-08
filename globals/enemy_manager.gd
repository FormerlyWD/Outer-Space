extends Node


@onready var maximum_amount_of_enemies:int = 4
@onready var all_spawned_enemies:Array[CharacterBody2D]

var current_amount_of_enemies:int = 0
signal enemy_spawned(enemy:CharacterBody2D)
