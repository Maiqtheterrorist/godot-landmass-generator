extends Node2D

@onready var noise_preview: TextureRect = %noisePreview
var chunk : MeshInstance3D


var generationData : Dictionary = {
	 "width" : 256,
	"height" : 256,
	"scale" : 0.9,
	"octaves" : 3,
	"persistance" : 0.5,
	"lacunarity" : 3.8,
}
var finalValues : Dictionary = {
	
}

func _ready() -> void:
	noiseGenerator._fastNoiseLite_initializer()
	_setup_noise_preview_node()

func _setup_noise_preview_node() -> void:
	_create_noise_texture_and_assign()
	

func _create_noise_texture_and_assign() -> void:
	noise_preview.size = Vector2(generationData.get("width"), generationData.get("height"))
	noise_preview.texture = noiseGenerator._generate_noise_map(generationData.get("width"), generationData.get("height"), generationData.get("scale"), generationData.get("octaves"), generationData.get("persistance"), generationData.get("lacunarity"))


func _on_h_slider_value_changed(value: float) -> void:
	%LineEdit.text = "persistance " + str(value)
	generationData["persistance"] = value
	_create_noise_texture_and_assign()

func _on_h_slider_2_value_changed(value: float) -> void:
	%LineEdit2.text = "lacunarity " + str(value)
	generationData["lacunarity"] = value
	_create_noise_texture_and_assign()


func _on_h_slider_3_value_changed(value: float) -> void:
	%LineEdit3.text = "scale " + str(value)
	generationData["scale"] = value
	_create_noise_texture_and_assign()




func _on_button_pressed() -> void:
	visible = false
	chunk = landmassGenerator._triangulatedQuad(generationData.get("width"), generationData.get("height"))
	var mater = StandardMaterial3D.new()
	
	mater.albedo_color = Color.SANDY_BROWN
	chunk.material_override = mater
	
	var world = get_node_or_null("/root/world/meshes")
	world.add_child(chunk)
	var scene = load("res://LandmassGeneration/scenes/player.tscn") as PackedScene
	var playerInstance = scene.instantiate()
	world.add_child(playerInstance)
	playerInstance.get_node_or_null("/root/world/meshes/player").position = Vector3(64,20,80)
