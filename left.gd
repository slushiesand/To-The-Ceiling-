extends ColorRect

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		await get_tree().create_timer(9.0).timeout
		$".".set_visible(true)
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position:x", -172.0, 4.0)
