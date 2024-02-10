extends MeshInstance3D

var original_vertices = []
var modified_vertices = []
@onready var plane: Node3D = $plane

func _ready():
	# Get the mesh
	var meshs = plane.get_child(0).mesh
	
	# Store original vertices
	if meshs:
		var surface_arrays = mesh.surface_get_arrays(0)
		var vertices = surface_arrays[Mesh.ARRAY_VERTEX]
		var normals = surface_arrays[Mesh.ARRAY_NORMAL]
		
		for i in range(modified_vertices.size() / 3):
			modified_vertices.vertices[i * 3] *= 1.1
			modified_vertices.vertices[i * 3 + 1] *= 1.1
			modified_vertices.vertices[i * 3 + 2] *= 1.1


	# Create a new mesh with the modified arrays
	var new_mesh = ArrayMesh.new()
	new_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, [modified_vertices])
	
	# Set the new mesh
	plane.get_child(0).mesh = new_mesh
