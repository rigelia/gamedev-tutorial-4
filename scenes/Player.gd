extends CharacterBody2D

const ACCELERATION = 400.0
const DECELERATION = 400.0

@export var speed: float = 400.0
@export var gravity: int = 1200
@export var jump_speed: int = -400

@onready var sprite = $Sprite2D
@onready var particle = $GPUParticles2D


func get_input():
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	if Input.is_action_pressed("right"):
		sprite.flip_h = false
		velocity.x = lerp(velocity.x, speed, ACCELERATION / speed)
	elif Input.is_action_pressed("left"):
		sprite.flip_h = true
		velocity.x = lerp(velocity.x, -speed, ACCELERATION / speed)
	else:
		velocity.x = lerp(velocity.x, 0.0, DECELERATION / speed)


func set_particles():
	var is_running = abs(velocity.x) >= speed - 1.0
	particle.set_emitting(is_running and is_on_floor())


func _physics_process(delta):
	velocity.y += delta * gravity
	get_input()
	set_particles()
	move_and_slide()


func _process(_delta):
	if not is_on_floor():
		$Animator.play("Jump")
	elif velocity.x != 0:
		$Animator.play("Walk")
	else:
		$Animator.play("Idle")

