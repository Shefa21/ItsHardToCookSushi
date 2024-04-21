extends CharacterBody2D

var speed = 100
var player_state
var current_world

#@export var inv: Inv

func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	else:
		player_state = "walking"

	velocity = direction.normalized() * speed
	move_and_slide()

	play_anim(direction)

	# Set player size
	

func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
		if Input.is_action_pressed("k"):
			$AnimatedSprite2D.play("cook")
		#print("cooking")
	elif player_state == "walking":
		if abs(dir.x) > abs(dir.y):
			if dir.x > 0:
				$AnimatedSprite2D.play("e-walk")
			else:
				$AnimatedSprite2D.play("w-walk")
		else:
			if dir.y > 0:
				$AnimatedSprite2D.play("s-walk")
			else:
				$AnimatedSprite2D.play("n-walk")

	#$AnimatedSprite2D.scale = Vector2(32.0 / $AnimatedSprite2D.texture.get_width(), 32.0 / $AnimatedSprite2D.texture.get_height())			

func player():
	pass

func player_shop_method():
	pass

func player_sell_method():
	pass
