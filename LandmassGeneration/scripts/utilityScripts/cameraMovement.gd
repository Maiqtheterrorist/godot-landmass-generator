extends Camera3D

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position += Vector3.UP * delta
	if Input.is_action_pressed("ui_down"):
		position += Vector3.DOWN * delta
	if Input.is_action_pressed("ui_right"):
		position += Vector3.RIGHT * delta
	if Input.is_action_pressed("ui_left"):
		position += Vector3.LEFT * delta
	if Input.is_action_pressed("ui_zoom_in"):
		position += Vector3.FORWARD * delta
	if Input.is_action_pressed("ui_zoom_out"):
		position += Vector3.BACK * delta
