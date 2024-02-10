extends TextureRect

@onready var noise_preview: TextureRect = $"."


var generationData : Dictionary = {
	 "width" : 100,
	"height" : 100,
	"scale" : 0.1,
	"octaves" : 4,
	"persistance" : 0.5,
	"lacunarity" : 3.0,
}
var finalValues : Dictionary = {
	
}

func _ready() -> void:
	noiseGenerator._fastNoiseLite_initializer()
	noise_preview.scale = scale*5
	_setup_noise_preview_node()

func _setup_noise_preview_node() -> void:
	_create_noise_texture_and_assign()
	

func _create_noise_texture_and_assign() -> void:
	noise_preview.size = Vector2(generationData.get("width"), generationData.get("height"))
	noise_preview.texture = noiseGenerator._generate_noise_map(generationData.get("width"), generationData.get("height"), generationData.get("scale"), generationData.get("octaves"), generationData.get("persistance"), generationData.get("lacunarity"))


func _on_h_slider_value_changed(value: float) -> void:
	$"../Control/GridContainer/LineEdit".text = "persistance " + str(value)
	generationData["persistance"] = value
	_create_noise_texture_and_assign()


func _on_h_slider_2_value_changed(value: float) -> void:
	$"../Control/GridContainer/LineEdit2".text = "lacunarity " + str(value)
	generationData["lacunarity"] = value
	_create_noise_texture_and_assign()


func _on_h_slider_3_value_changed(value: float) -> void:
	$"../Control/GridContainer/LineEdit3".text = "scale " + str(value)
	generationData["scale"] = value
	_create_noise_texture_and_assign()
