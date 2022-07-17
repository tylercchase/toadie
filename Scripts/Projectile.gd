extends Area2D

export (int) var max_damage = 1
export (int) var speed = 300

var fired = false
func _ready():
	pass 

func _physics_process(delta):
	if fired:
		position += Vector2(speed, 0).rotated(rotation) * delta

	
func _on_Projectile_body_entered(body):
	if body.has_method("on_hit"):
		var damage = int(rand_range(1,max_damage))
		body.on_hit(damage)
		print(damage)
	queue_free()

func start_thing():
	fired = true
	$Timer.start()
	$CollisionShape2D.disabled = false

func _on_Timer_timeout():
	queue_free()
