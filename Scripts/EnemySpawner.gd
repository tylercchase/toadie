extends Node2D


onready var enemies = [preload("res://Scenes/Enemies/Test.tscn")]

func _ready():
	pass # Replace with function body.


func get_spawn_location():
	var rand_x = rand_range(-1000,1000)
	var rand_y = rand_range(-1000,1000)
	var player_pos = get_node("../Player").global_position
	var pos = Vector2(
		player_pos.x + rand_x,
		player_pos.y + rand_y
	)
	var difference = pos - player_pos
	if abs(difference.x + difference.y) < 1000:
		pos = get_spawn_location()
	return pos
func spawn_enemy():
	var Enemy = enemies[0].instance()
	var location = get_spawn_location()
	Enemy.global_position = location
	Enemy.player = get_node("../Player")
	get_node("/root/World/Enemies").add_child(Enemy)
	
func _on_Timer_timeout():
	spawn_enemy()
	$Timer.start()
