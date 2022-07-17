extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pause_state = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("player_death", self, "player_death")
	Events.connect("toggle_pause", self, "pause_toggle")
	pass # Replace with function body.

func player_death():
	pause_everything(true)

func pause_toggle():
	pause_state = !pause_state
	pause_everything(pause_state)

func pause_everything(state):
	print(state)
	print('help')
	for child in get_children():
		if child.name != "Camera2D":
			if "paused" in child:
				print('test')
				child.paused = state
			elif child.name == "Enemies":
				for child2 in child.get_children():
					child2.set_physics_process(!state)
					if "paused" in child2:
						child2.paused = state
			else:
				child.set_physics_process(!state)
