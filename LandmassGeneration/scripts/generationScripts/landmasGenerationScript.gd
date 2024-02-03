extends Node
class_name landmassGenerator
static var noiseTexture = ImageTexture.new()
static var fastNoiseLite : FastNoiseLite = FastNoiseLite.new()
static var data : PackedByteArray
@export var noiseWidth : int = 10
@export var noiseHeight : int = 10
@export var noiseScale : float = 1.0

func _ready() -> void:
	_fastNoiseLite_initializer()

func _fastNoiseLite_initializer():
	fastNoiseLite.noise_type = FastNoiseLite.TYPE_PERLIN
	fastNoiseLite.fractal_type = FastNoiseLite.FRACTAL_NONE

static func _generate_noise_map(width, height, scale) -> ImageTexture:
	var noiseImage : Image = Image.create(width,height,false,Image.FORMAT_RGBA8)
	for y in height:
		for x in width:
			var sampleY = y/scale
			var sampleX = x/scale
			noiseImage.set_pixel(x,y, Color.from_hsv(0.0, 0.0, (fastNoiseLite.get_noise_2d(sampleX,sampleY)+1)/2))
	var noiseTextureInstance = noiseTexture.create_from_image(noiseImage)
	return noiseTextureInstance