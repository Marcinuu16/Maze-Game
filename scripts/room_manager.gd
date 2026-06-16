extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("action_debug"):
		print("debug kliknięty")
		var room = preload("res://scenes/room1.tscn").instantiate()
		get_node("/root/game").add_child(room)
		
		var player= preload("res://scenes/player.tscn").instantiate()
		room.get_node("TileMap").add_child(player)
		
	
		
func on_trigger_entered(body, room, door):
	if body is CharacterBody2D:
		print("Trying to enter "+str(room)+"'s door nr "+str(door))
