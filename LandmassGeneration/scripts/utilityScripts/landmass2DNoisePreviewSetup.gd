extends TextureRect

@onready var noise_preview: TextureRect = $"."


var generationData : Dictionary = {
	 "width" : 10,
	"height" : 10,
	"scale" : 0.1,
	"octaves" : 3,
	"persistance" : 0.5,
	"lacunarity" : 2.0,
}
var finalValues : Dictionary = {
	
}

func _ready() -> void:
	_setup_noise_preview_node()

func _setup_noise_preview_node() -> void:
	_create_noise_texture_and_assign()
	

func _create_noise_texture_and_assign() -> void:
	noise_preview.size = Vector2(generationData.get("width"), generationData.get("height"))
	noise_preview.scale = scale*50
	noise_preview.texture = landmassGenerator._generate_noise_map(generationData.get("width"), generationData.get("height"), generationData.get("scale"), generationData.get("octaves"), generationData.get("persistance"), generationData.get("lacunarity"))
