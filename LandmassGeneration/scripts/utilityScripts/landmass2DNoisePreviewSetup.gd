extends Node
@onready var noise_preview: MeshInstance3D = %noisePreview
@onready var texture_rect: TextureRect = $"../TextureRect"

var generationData : Dictionary = {
	 "width" : 500,
	"height" : 500,
	"scale" : 0.5,
	"octaves" : 3,
	"persistance" : 0.5,
	"lacunarity" : 2.0,
}
var finalValues : Dictionary = {
	
}
var texture : ImageTexture

func _ready() -> void:
	_setup_noise_preview_node()

func _setup_noise_preview_node() -> void:
	_create_noise_texture_and_assign()
	

func _create_noise_texture_and_assign() -> void:
	#noise_preview.texture = landmassGenerator._generate_noise_map(generationData.get("width"), generationData.get("height"), generationData.get("scale"), generationData.get("octaves"), generationData.get("persistance"), generationData.get("lacunarity"))
	texture_rect.texture = landmassGenerator._generate_noise_map(generationData.get("width"), generationData.get("height"), generationData.get("scale"), generationData.get("octaves"), generationData.get("persistance"), generationData.get("lacunarity"))
