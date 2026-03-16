extends CanvasItem

func _ready() -> void:
	var tween = get_tree().create_tween().set_loops()
	var x_default = $".".get_position()[0]
	
	tween.tween_property($".", "position:x", x_default + 5.0, 1.0)
	tween.tween_property($".", "position:x", x_default - 5.0, 1.0)
