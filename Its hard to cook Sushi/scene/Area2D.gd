extends Area2D

var entered = false

func _on_body_entered(body: PhysicsBody2D) -> void:
	#print("Body entered")
	entered = true

func _on_body_exited(body: PhysicsBody2D) -> void:
	#print("Body exited")
	entered = false

var pscene=load("res://scene/world2.tscn")

func _process(delta):
	if entered && Input.is_action_just_pressed("ui_accept"):
		#print("clicked")
		get_tree().change_scene_to_file("res://scene/world2.tscn")
		#get_tree().change_scene_to_packed(pscene)
		#get_tree().call_deferred("change_scene_to_file",pscene)
		
	
		
  
