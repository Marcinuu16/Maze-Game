extends Area2D

enum Target_room_e {r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12}
enum Target_door_e {d1,d2,d3,d4,d5,d6}
enum Target_direction_e {north,south,east,west}

@export var Target_room = Target_room_e.r1
@export var Target_door = Target_door_e.d1
@export var Target_direction = Target_direction_e.north
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(room_manager, "prepare_swap").bind(Target_room+1,Target_door+1,Target_direction))
	
