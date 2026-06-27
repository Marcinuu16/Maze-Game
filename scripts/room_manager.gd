extends Node
var is_swapping = false
var current_room: Node = null
var player: Node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = load("res://scenes/player.tscn").instantiate()
	current_room = load("res://scenes/room1.tscn").instantiate()
	get_node("/root/game").add_child(current_room)
	current_room.get_node("TileMap").add_child(player)
	print("loaded room 1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("action_debug"):
		print("debug button clicked")
			
func prepare_swap(body, to_room, to_door,to_direction):
	if body is CharacterBody2D:
		if is_swapping:
			print("swap is locked")
			return
		is_swapping = true
		print("ready to swap")
		call_deferred("swap_room",body,to_room,to_door,to_direction)
	
func swap_room(body, to_room, to_door,to_direction):
	if body is CharacterBody2D:
		print("Trying to enter room "+str(to_room)+", door "+str(to_door))
		player.reparent(get_node("/root/room_manager"),true)
		
		if current_room:
			current_room.queue_free()
			print("freed previous room")
			
		current_room = load("res://scenes/room"+str(to_room)+".tscn").instantiate()
		get_node("/root/game").add_child(current_room)
		player.reparent(current_room.get_node("TileMap"),true)
		var spawn_cords: Vector2 = Vector2(0,0)
		match to_direction:
			0:
				spawn_cords = Vector2(-16,-16)
				print("door leading north")
			1:
				print("door leading south")
				spawn_cords = Vector2(16,8)
			2:
				print("door leading east")
				spawn_cords = Vector2(16,-16)
			3:
				print("door leading west")
				spawn_cords = Vector2(-16,8)
				
		print(spawn_cords)
		player.position = current_room.get_node("door"+str(to_door)).position + spawn_cords
		
		print("loaded room "+str(to_room))
		is_swapping = false
		
		
