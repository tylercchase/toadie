extends RigidBody2D

export (int) var max_damage = 1

func _ready():
	pass 

func _on_Projectile_body_entered(body):
	if body.has_method("on_hit"):
		var damage = int(rand_range(1,max_damage))
		body.on_hit(damage)
		print(damage)
	queue_free()

func start_thing():
	$Timer.start()
	$CollisionShape2D.disabled = false

func _on_Timer_timeout():
	queue_free()
