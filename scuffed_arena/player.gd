extends Area2D

@export var speed = 400
@onready var label = $Label



func _ready():
	print("Hello, world!")

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("ui_accept"):
		var copy : Label
		copy = label.duplicate()
		copy.show()
		copy.global_position = position
		get_parent().add_child(copy)

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	
