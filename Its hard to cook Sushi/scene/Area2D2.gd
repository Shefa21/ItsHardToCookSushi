extends Area2D

var entered = false

func _on_body_entered(body: PhysicsBody2D) -> void:
	#print("Body entered")
	entered = true

func _on_body_exited(body: PhysicsBody2D) -> void:
	#print("Body exited")
	entered = false

func _process(delta):
	if entered:
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene_to_file("res://scene/world.tscn")
	
		
  
