extends Sprite2D
var x_default = $".".get_position()[0]
var y_default = $".".get_position()[1]
var y_current = y_default

func _ready() -> void:
	var tween = get_tree().create_tween().set_loops()
	
	tween.tween_property($".", "position:x", x_default - 2.5, 1.0)
	tween.tween_property($".", "position:x", x_default + 2.5, 1.0 )


func _process(delta: float) -> void:
	var x_current = $".".get_position()[0]
	y_current -= 0.1
	
	$".".set_position(Vector2(x_current, y_current))
	
	
	if $".".get_position()[1] == -1472.0:
		$".".set_position(Vector2(x_default, y_default))
		y_current = y_default
