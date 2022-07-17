extends Node2D

signal done

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready	var FloatingText = preload("res://Scenes/Floating_Text/FloatingText.tscn")

export (Vector2) var velocity = Vector2(0, -80)
export (int) var duration = 2
export (int) var spread = PI/2
# Called when the node enters the scene tree for the first time.

func show_value(value, crit=false):
	var aaa = FloatingText.instance()
	add_child(aaa)
	aaa.show_value(str(value), velocity, duration, spread, crit)
	emit_signal("done")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
