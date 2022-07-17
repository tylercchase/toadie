extends Control



func _ready():
	Events.connect("player_death", self, "on_player_death")

func on_player_death():
	$Restart.visible = true
	$Quit.visible = true
	

func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_Quit_pressed():
	get_tree().quit()
