extends Label

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		set_text("U.S.S Ceiling")
		$"../AudioStreamPlayer".stop()
		$Congrats.play()
		$conclusion.set_visible(true)
		await get_tree().create_timer(9.0).timeout
		$"../AudioStreamPlayer".play()
		
		
