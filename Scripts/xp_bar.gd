extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("set_xp", self, "set_xp")
	pass # Replace with function body.

func set_xp(xp):
	print(xp)
	value = xp
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
