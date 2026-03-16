extends ColorRect

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		await get_tree().create_timer(9.0).timeout
		var tween = get_tree().create_tween()
		$".".set_visible(true)
		tween.tween_property($".", "position:x", 60.0, 4.0)
