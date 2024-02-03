extends Node
var delete = 100

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
	material.albedo_texture = landmassGenerator._generate_noise_map(delete,delete, 1.0)


func _on_h_slider_value_changed(value: float) -> void:
	material.albedo_texture = landmassGenerator._generate_noise_map(delete, delete, value)
