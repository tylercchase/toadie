extends KinematicBody2D

export (int) var speed = 400
export (int) var health = 3
var velocity = Vector2()
onready var projectile = preload("res:///Scenes/Projectile")
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func on_hit(damage: int):
	print(damage)
	health -= damage
	Events.emit_signal("set_health", health)
	if health <= 0:
		Events.emit_signal("player_death")

func shoot():
	pass
