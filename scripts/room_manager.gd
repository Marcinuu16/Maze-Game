extends Node

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
		print("debug kliknięty")
			
func swap_room(body, to_room, to_door):
	if body is CharacterBody2D:
		print("Trying to enter room "+str(to_room)+", door "+str(to_door))
		
		if current_room:
			current_room.get_node("TileMap").remove_child(player)
			current_room.queue_free()
			
			player = load("res://scenes/player.tscn").instantiate()
			current_room = load("res://scenes/room"+str(to_room)+".tscn").instantiate()
			get_node("/root/game").add_child(current_room)
			current_room.get_node("TileMap").add_child(player)
			print("loaded room"+str(to_room))
		
