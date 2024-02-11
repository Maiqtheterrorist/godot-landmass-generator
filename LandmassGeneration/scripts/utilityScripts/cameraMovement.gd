extends Camera3D
var speed = 10
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		global_position += Vector3.UP * speed * delta
	if Input.is_action_pressed("ui_down"):
		global_position += Vector3.DOWN * speed * delta
	if Input.is_action_pressed("ui_right"):
		global_position += Vector3.RIGHT * speed * delta
	if Input.is_action_pressed("ui_left"):
		global_position += Vector3.LEFT * speed * delta
