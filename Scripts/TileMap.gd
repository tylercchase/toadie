extends TileMap


var noise := OpenSimplexNoise.new()
func create_noise(x_pos, y_pos, width, height):
	for x in range(width):
		for y in range(height):
			set_cell(x+x_pos, y+y_pos, noise.get_noise_2d(x+x_pos, y+y_pos)*2+1)
	

func _ready():
	randomize()
	noise.seed = randi()
	create_noise(-50,-50,100,100)
	pass # Replace with function body.

func _process(delta):
	if $"../Player":
		var tile_pos = world_to_map($"../Player".global_position)
		create_noise(tile_pos.x-50, tile_pos.y-50, 100, 100)
