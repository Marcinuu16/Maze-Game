extends Area2D

enum Target_room_e {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11}
enum Target_door_e {d0,d1,d2,d3,d4}
@export var Target_room = Target_room_e.r0
@export var Target_door = Target_door_e.d0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(room_manager, "on_trigger_entered").bind(Target_room,Target_door))
	
