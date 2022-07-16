extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var value = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("set_health", self, "update_health")
	for i in get_child_count():
		get_child(i).visible = value > i

func update_health(health):
	value = health
	update()

func update():
	for i in get_child_count():
		get_child(i).visible = value > i

