extends Control

var pause_state = false

func _ready():
	Events.connect("player_death", self, "on_player_death")
	Events.connect("toggle_pause", self, "toggle_pause")

func on_player_death():
	set_menu(true)

func toggle_pause():
	pause_state = !pause_state
	set_menu(pause_state)

func set_menu(state):
	$CenterContainer/MenuButtons/Quit.visible = state
	$CenterContainer/MenuButtons/Restart.visible = state

func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_Quit_pressed():
	get_tree().quit()
