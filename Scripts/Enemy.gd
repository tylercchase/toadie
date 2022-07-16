extends KinematicBody2D

export var speed := 10.0
export var damage := 1
export var max_health := 3
var player = null
var velocity = Vector2.ZERO
var health

func _ready():
	health = max_health

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * speed
	velocity = move_and_slide(velocity)

func _on_Detection_Radius_body_entered(body):
	if(body.name == "Player"):
		player = body

func on_hit(amount):
	health -= amount
	print('hit')
	if health <= 0:
		Events.emit_signal("enemy_death", max_health)
		self.queue_free()

func _on_HitArea_body_entered(body):
	if(body.name == "Player"):
		body.on_hit(damage)
