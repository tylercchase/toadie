extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var enemies = [preload("res://Scenes/Enemies/Test.tscn")]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_spawn_location():
	var rand_x = rand_range(-500,500)
	var rand_y = rand_range(-500,500)
	var player_pos = get_node("../Player").global_position
	var pos = Vector2(
		player_pos.x + rand_x,
		player_pos.y + rand_y
	)
#	if abs(pos - player_pos) < 300:
#		pos = get_spawn_location()
	return pos
func spawn_enemy():
	var Enemy = enemies[0].instance()
#	rand_range(0, get_node("/World/Player/Camera2D"))

	var location = get_spawn_location()
	Enemy.global_position = location
#	BULLET.rotation_degrees = rotation_degrees
#	BULLET.apply_impulse(Vector2(), -Vector2(400, 0).rotated(rotation))
	get_node("/root/World").add_child(Enemy)
	
func _on_Timer_timeout():
	spawn_enemy()
	$Timer.start()
