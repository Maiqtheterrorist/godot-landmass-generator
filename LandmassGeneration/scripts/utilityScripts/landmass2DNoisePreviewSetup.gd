extends Node
var total = 0

var generationData : Dictionary = {
	 "width" : 100,
	"height" : 100,
	"scale" : 0.5,
	"octaves" : 3,
	"persistance" : 0.5,
	"lacunarity" : 2.0,
	#"frequency" : 1.0,
	#"amplitude" : 0.0
}
var finalValues : Dictionary = {
	
}
@onready var noise_preview: MeshInstance3D = %noisePreview
var material : StandardMaterial3D = StandardMaterial3D.new()
var texture : ImageTexture

func _ready() -> void:
	_setup_noise_preview_node()

func _setup_noise_preview_node() -> void:
	_create_material_and_assign()
	_create_noise_texture_and_assign()
	
func _create_material_and_assign() -> void:
	self.mesh.surface_set_material(0, material)

func _create_noise_texture_and_assign() -> void:
	material.albedo_texture = landmassGenerator._generate_noise_map(generationData.get("width"), generationData.get("height"), generationData.get("scale"), generationData.get("octaves"), generationData.get("persistance"), generationData.get("lacunarity"))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		#print(landmassGenerator.octavesDictionary)
		var index = 0
		for key in landmassGenerator.octavesDictionary:
			#print("in " + str(key))
			total += landmassGenerator.octavesDictionary.get(key)[0][0].z
			print(landmassGenerator.octavesDictionary.get(key)[index][0].z)
			index += 1
			for value in landmassGenerator.octavesDictionary.get(str(key)):
				print("at x: " + str(value[0].x) + " at y: " + str(value[0].y) + " value is :" + str(value[0].z))
	#if Input.is_action_just_pressed("ui_left"):
		#print(total)
