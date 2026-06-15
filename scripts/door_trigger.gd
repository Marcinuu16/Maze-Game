extends Area2D

enum Direction {north,south,east,west}

@export var direction = Direction.north
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(room_manager, "on_trigger_entered").bind(direction))
	
