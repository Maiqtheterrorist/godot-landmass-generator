extends Node
class_name  landmassGenerator

static var meshInstance : MeshInstance3D = MeshInstance3D.new()
static var arrayMesh : ArrayMesh = ArrayMesh.new()
static var surfaceTool : SurfaceTool = SurfaceTool.new()
static var vertices : PackedVector3Array = []

static var data = []

static var height = 3


static func _triangulatedQuad(worldLength, worldWidth):
	
	data.resize(Mesh.ARRAY_MAX)
	
	for x in worldLength-1:
		for z in worldWidth-1:
			
			var vert0 = [Vector3(x,noiseGenerator.combinedImages.get_pixel(x,z).v*height,z)]
			var vert1 = [Vector3(x+1,noiseGenerator.combinedImages.get_pixel(x+1,z+1).v*height,z+1)]
			var vert2 = [Vector3(x,noiseGenerator.combinedImages.get_pixel(x,z+1).v*height,z+1)]
			var vert4 = [Vector3(x+1,noiseGenerator.combinedImages.get_pixel(x+1,z).v*height,z)]
			
			vertices.push_back(vert0[0])
			vertices.push_back(vert1[0])
			vertices.push_back(vert2[0])

			data[Mesh.ARRAY_VERTEX] = vertices
			
			arrayMesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, data)
			vertices.clear()

			vertices.push_back(vert0[0])
			vertices.push_back(vert4[0])
			vertices.push_back(vert1[0])
			
			data[Mesh.ARRAY_VERTEX] = vertices
			arrayMesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, data)
		
		meshInstance.mesh = arrayMesh
	return meshInstance
