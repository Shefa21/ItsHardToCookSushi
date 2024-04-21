extends Area2D

var cookingInProgress = false

func _ready():
	pass

func _on_body_entered(body: PhysicsBody2D):
	if body.has_method("player"):
		pass
		#print("Player entered cooking area. Press 'k' to start cooking.")

func _on_body_exited(body):
	if body.has_method("player"):
		pass
		#print("Player left cooking area.")

func _process(delta):
	if cookingInProgress and Input.is_action_pressed("k"):
		start_cooking()

func start_cooking():
	print("Cooking started!")
	cookingInProgress = true
