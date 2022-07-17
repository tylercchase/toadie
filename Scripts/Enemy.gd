extends KinematicBody2D

export var speed := 10.0
export var damage := 1
export var max_health := 3
var player = null
var velocity = Vector2.ZERO
var health

var knockback = Vector2.ZERO

func _ready():
	health = max_health

func _physics_process(delta):
	velocity = position.direction_to(player.position) * speed
	velocity = move_and_slide(velocity + knockback)
	if knockback:
		knockback = Vector2.ZERO

func on_hit(amount):
	health -= amount
	$TextManager.show_value(amount)
	if health <= 0:
		Events.emit_signal("enemy_death", max_health)
		$CollisionShape2D.disabled = true
		$Sprite.visible = false
		$HitArea.monitoring = false
		$HitArea.monitorable = false
		yield($TextManager, "done")
		self.queue_free()

func _on_HitArea_body_entered(body):
	if(body.name == "Player"):
		body.on_hit(damage)

func test(pulse):
	knockback = pulse
