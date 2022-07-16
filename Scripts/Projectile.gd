extends RigidBody2D

func _ready():
	pass 

func _on_Projectile_body_entered(body):
	if body.has_method("on_hit"):
		body.on_hit(1)
	queue_free()

func start_thing():
	$Timer.start()
	$CollisionShape2D.disabled = false

func _on_Timer_timeout():
	queue_free()
