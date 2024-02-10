extends Node

@onready var nodeToAddAssChild : Node = get_node_or_null("/root/world/meshes")

var arrayMesh : ArrayMesh = ArrayMesh.new()
var meshDataTool : MeshDataTool = MeshDataTool.new()
var meshInstance : MeshInstance3D = MeshInstance3D.new()


func _ready() -> void:
	_create_landmass()
	_add_landmass_to_scene()
	meshInstance.rotate_x(-90)


func _create_landmass():

	# Create arrays to hold vertex positions and indices for the triangle
	var vertices = PackedVector3Array([Vector3(-1, 1, 0), Vector3(-1, -1, -1), Vector3(1, -1, -1)])
	var indices = PackedInt32Array([2, 1, 0])

	# Create a SurfaceTool to configure the mesh
	var surface_tool = SurfaceTool.new()
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	for vertex in vertices:
		surface_tool.add_vertex(vertex)
	for i in range(indices.size()):
		surface_tool.add_index(indices[i])
	surface_tool.commit(arrayMesh)

func _add_landmass_to_scene():
	meshInstance.mesh = arrayMesh
	nodeToAddAssChild.add_child(meshInstance)
	

