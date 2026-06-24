extends CharacterBody2D
class_name Player

@export var speed: float = 60.0

func _physics_process(_delta: float) -> void:
	var raw_direction := Vector2.ZERO

	# --- DIAGONALS FIRST ---
	if Input.is_action_pressed("action_up") and Input.is_action_pressed("action_right"):
		raw_direction = Vector2(1, -1)
		$AnimatedSprite2D.frame = 1

	elif Input.is_action_pressed("action_right") and Input.is_action_pressed("action_down"):
		raw_direction = Vector2(1, 1)
		$AnimatedSprite2D.frame = 3

	elif Input.is_action_pressed("action_down") and Input.is_action_pressed("action_left"):
		raw_direction = Vector2(-1, 1)
		$AnimatedSprite2D.frame = 5

	elif Input.is_action_pressed("action_left") and Input.is_action_pressed("action_up"):
		raw_direction = Vector2(-1, -1)
		$AnimatedSprite2D.frame = 7

	# --- CARDINAL DIRECTIONS ---
	elif Input.is_action_pressed("action_up"):
		raw_direction = Vector2(0, -1)
		$AnimatedSprite2D.frame = 0

	elif Input.is_action_pressed("action_right"):
		raw_direction = Vector2(1, 0)
		$AnimatedSprite2D.frame = 2

	elif Input.is_action_pressed("action_down"):
		raw_direction = Vector2(0, 1)
		$AnimatedSprite2D.frame = 4

	elif Input.is_action_pressed("action_left"):
		raw_direction = Vector2(-1, 0)
		$AnimatedSprite2D.frame = 6


	# Animation
	if raw_direction != Vector2.ZERO:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.pause()

	# Movement
	velocity = raw_direction.normalized() * speed
	move_and_slide()
