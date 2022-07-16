extends KinematicBody2D

export (int) var speed = 400
export (int) var health = 3
export (int) var xp_multiplier = 1

var velocity = Vector2()
var current_xp = 0
var next_xp = 100


onready var projectile = preload("res:///Scenes/Projectiles/Projectile.tscn")
func _ready():
	Events.connect("enemy_death", self, "process_kill")

func process_kill(health):
	current_xp += health * 4 * xp_multiplier
	while current_xp >= next_xp:
		current_xp -= next_xp
		next_xp *= 2
		Events.emit_signal("level_up")
	Events.emit_signal("set_xp", float(current_xp) / next_xp * 100)

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
	look_at(get_global_mouse_position())

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		var BULLET = projectile.instance()
		BULLET.global_position = $Position2D.global_position
		BULLET.rotation_degrees = rotation_degrees
		BULLET.apply_impulse(Vector2(), Vector2(400, 0).rotated(rotation))
		get_node("/root/World/Projectiles").add_child(BULLET)
		
func on_hit(damage: int):
	print(damage)
	health -= damage
	Events.emit_signal("set_health", health)
	if health <= 0:
		Events.emit_signal("player_death")

func shoot():
	pass
