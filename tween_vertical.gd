extends CanvasItem

func _ready() -> void:
	var tween = get_tree().create_tween().set_loops()
	var y_default = $".".get_scale()[1]
	var position_default = $".".get_position()[1]
	
	tween.tween_property($".", "scale:y", y_default * 0.85, 1.0)
	tween.parallel().tween_property($".", "position:y", position_default + 5.0, 1.0)
	tween.tween_property($".", "scale:y", y_default, 1.0)
	tween.parallel().tween_property($".", "position:y", position_default, 1.0)
