extends Label

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		
		set_text("U.S.S Ceiling")
		$"../AudioStreamPlayer".stop()
		$Congrats.play()
		$conclusion.set_visible(true)
		await get_tree().create_timer(9.0).timeout
		$"../AudioStreamPlayer".play()
		
		var tween_left = get_tree().create_tween()
		$left.set_visible(true)
		tween_left.tween_property($left, "position:x", -176.0, 4.0)
		
		var tween = get_tree().create_tween()
		$right.set_visible(true)
		tween.tween_property($right, "position:x", 60.0, 4.0)
		
		await get_tree().create_timer(4.0).timeout
		$the_end.set_visible(true)
		
