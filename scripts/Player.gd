extends KinematicBody2D

const GRAVITY = 500
const JUMP_FORCE = -150
const SPEED = 100
const FRICTION = 0.5
var velocity : Vector2

func _pressing_left():
	return Input.is_action_pressed("left")


func _pressing_right():
	return Input.is_action_pressed("right")


func _pressing_directions():
	return _pressing_right() or _pressing_left()



func _input(event):
	if event.is_action_pressed("left"):
		velocity.x = -SPEED
	
	if event.is_action_pressed("right"):
		velocity.x = SPEED
	
	if event.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_FORCE

func apply_gravity(delta):
	velocity.y += GRAVITY * delta
	if velocity.y > 0:
		velocity.y = min(velocity.y, abs(JUMP_FORCE) * 1.5)


func apply_friction():
	if not _pressing_directions():
		velocity.x = lerp(velocity.x, 0, FRICTION)

func _physics_process(delta):
	apply_gravity(delta)
	apply_friction()
	move_and_slide(velocity, Vector2.UP)
