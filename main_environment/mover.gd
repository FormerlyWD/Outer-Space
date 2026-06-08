extends Parallax2D
@onready var distance_covered_pixels:float
@export var default_autoscroll_x:float
@export var starting_scroll_offset := 360
@export var distance_node:Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	autoscroll.x = default_autoscroll_x

func custom_pause(): autoscroll.x = 0.0
func custom_resume(): autoscroll.x = default_autoscroll_x
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	distance_covered_pixels = scroll_offset.x - starting_scroll_offset
	distance_node.text = "distance " +str( ceil(abs(distance_covered_pixels)* 1000)/1000)
