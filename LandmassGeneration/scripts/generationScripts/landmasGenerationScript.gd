extends Node

class_name landmassGenerator

static var fastNoiseLite : FastNoiseLite = FastNoiseLite.new()
static var combinedImages : Image 
static var finalTexture

static var textures : Dictionary = {
	
}
static var images = {
	
}
func _ready() -> void:
	_fastNoiseLite_initializer()

func _fastNoiseLite_initializer():
	fastNoiseLite.noise_type = FastNoiseLite.TYPE_PERLIN
	fastNoiseLite.fractal_type = FastNoiseLite.FRACTAL_NONE

static func _generate_noise_map(width : int, height : int, scale : float, octaves : int, persistance : float, lacunarity : float) -> ImageTexture:
	combinedImages = Image.create(width,height,false,Image.FORMAT_RGBA8)
	var usableFrequency = lacunarity
	var usableAmplitude = persistance
	
	for i in octaves:
		var noiseImage : Image = Image.create(width,height,false,Image.FORMAT_RGBA8)
		usableFrequency = pow(lacunarity, i)
		usableAmplitude = pow(persistance, i)
		
		for y in height:
			for x in width:
				var sampleY = y/scale * usableFrequency
				var sampleX = x/scale * usableFrequency
				
				var combinedImagePixel = combinedImages.get_pixel(x, y)
				var fnlPixel = Color.from_hsv(0.0,0.0,(fastNoiseLite.get_noise_2d(sampleX,sampleY)+1)/2)*usableAmplitude
				combinedImagePixel = (combinedImagePixel+fnlPixel*usableAmplitude)
				combinedImages.set_pixel(x,y, combinedImagePixel)
				
				noiseImage.set_pixel(x,y, Color.from_hsv(0.0, 0.0, (fastNoiseLite.get_noise_2d(sampleX,sampleY)+1)/2)*usableAmplitude)
				
			images.merge({"image " + str(i) : noiseImage})
		
		var noiseTextureInstance : ImageTexture = ImageTexture.create_from_image(noiseImage)
		textures.merge({"image " + str(i) : noiseTextureInstance})
	finalTexture = ImageTexture.create_from_image(combinedImages)
	
	return finalTexture
