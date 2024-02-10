extends Node

@onready var meshComp: Node = get_node_or_null("/root/world/mesh")

var meshInstance : MeshInstance3D = MeshInstance3D.new()
var arrayMesh : ArrayMesh = ArrayMesh.new()
var surfaceTool : SurfaceTool = SurfaceTool.new()
var vertices : PackedVector3Array = []
var data : = []


var worldLenght : int = 2
var worldWidth : int = 2

func _ready() -> void:
	_triangulatedQuad()
	_add_mesh_to_world()

func _triangulatedQuad():
	data.resize(Mesh.ARRAY_MAX)
	for x in worldLenght:
		for z in worldWidth:
			vertices.push_back(Vector3(x,0,0))
			vertices.push_back(Vector3(x+1,0,z+1))
			vertices.push_back(Vector3(x,0,z+1))
			
			data[Mesh.ARRAY_VERTEX] = vertices
			arrayMesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, data)
			vertices.clear()
			
			vertices.push_back(Vector3(x,0,0))
			vertices.push_back(Vector3(x+1,0,0))
			vertices.push_back(Vector3(x+1,0,z+1))
			
			data[Mesh.ARRAY_VERTEX] = vertices
			arrayMesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, data)
	
func _add_mesh_to_world():
	meshInstance.mesh = arrayMesh
	var surface = arrayMesh.surface_get_arrays(2)
	print(arrayMesh.get_surface_count())
	meshComp.add_child.call_deferred(meshInstance)
	


