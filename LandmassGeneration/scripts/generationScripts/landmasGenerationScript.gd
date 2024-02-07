extends Node

class_name landmassGenerator

static var fastNoiseLite : FastNoiseLite = FastNoiseLite.new()

static var octavesDictionary : Dictionary = {
	
}

func _ready() -> void:
	_fastNoiseLite_initializer()

func _fastNoiseLite_initializer():
	fastNoiseLite.noise_type = FastNoiseLite.TYPE_PERLIN
	fastNoiseLite.fractal_type = FastNoiseLite.FRACTAL_NONE

static func _generate_noise_map(width : int, height : int, scale : float, octaves : int, persistance : float, lacunarity : float) -> ImageTexture:
	var noiseImage : Image = Image.create(width,height,false,Image.FORMAT_RGBA8)
	var usableFrequency = lacunarity
	var usableAmplitude = persistance
	
	for i in octaves:
		usableFrequency = pow(lacunarity, i)
		usableAmplitude = pow(persistance, i)
		prints(i,usableAmplitude,usableFrequency)
		
		var octave = []
		
		for y in height:
			for x in width:
				var sampleY = y/scale * usableFrequency
				var sampleX = x/scale * usableFrequency
				
				var data = [Vector3(    sampleX, sampleY, ((fastNoiseLite.get_noise_2d(sampleX,sampleY)+1)/2)*usableAmplitude    )]
				octave.append(data)
				
				noiseImage.set_pixel(x,y, Color.from_hsv(0.0, 0.0, (fastNoiseLite.get_noise_2d(sampleX,sampleY)+1)/2)*usableAmplitude)
		octavesDictionary.merge({"Octave " + str(i) : octave})
	var noiseTextureInstance : ImageTexture = ImageTexture.create_from_image(noiseImage)
	return noiseTextureInstance
