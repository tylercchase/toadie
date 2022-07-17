extends Control

var pause_state = false

func _ready():
	Events.connect("player_death", self, "on_player_death")
	Events.connect("toggle_pause", self, "toggle_pause")

func on_player_death():
	$CenterContainer/Restart.visible = true
	$CenterContainer/Quit.visible = true
	
func toggle_pause():
	pause_state = !pause_state
	$CenterContainer/Restart.visible = pause_state
	$CenterContainer/Quit.visible = pause_state
	
func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_Quit_pressed():
	get_tree().quit()
