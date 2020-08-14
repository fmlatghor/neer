extends KinematicBody

export var speed = 10
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 30

onready var head = $Head
onready var camera = $Head/Camera

var velocity = Vector3()

func _physics_process(delta):
	var head_basis = head.get_global_transform().basis
	
	var direction = Vector3()
	if Input.is_action_pressed("move_forward"):
		direction -= head_basis.z
	elif Input.is_action_pressed("move_forward"):
		direction +- head_basis.z
	if Input.is_action_pressed("move_left"):
		direction -= head_basis.x
	elif Input.is_action_pressed("move_right"):
		direction += head_basis.x
		
		velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
		
		direction = direction.normalized()
		velocity = move_and_slide(velocity)