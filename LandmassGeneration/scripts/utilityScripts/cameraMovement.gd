extends Camera3D

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		global_position += Vector3.UP * delta
	if Input.is_action_pressed("ui_down"):
		global_position += Vector3.DOWN * delta
	if Input.is_action_pressed("ui_right"):
		global_position += Vector3.RIGHT * delta
	if Input.is_action_pressed("ui_left"):
		global_position += Vector3.LEFT * delta
	if Input.is_action_pressed("ui_zoom_in"):
		global_position += Vector3.FORWARD * delta
	if Input.is_action_pressed("ui_zoom_out"):
		global_position += Vector3.BACK * delta
