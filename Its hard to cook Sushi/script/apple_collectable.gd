extends StaticBody2D



func _ready():
	fallfromtree()

func fallfromtree():
	$AnimationPlayer.play("fallingfromtree")
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("fade")
	print("+1 apples")
	await get_tree().create_timer(0.3).timeout
	queue_free()
	
	
