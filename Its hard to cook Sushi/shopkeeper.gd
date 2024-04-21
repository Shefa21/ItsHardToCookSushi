extends StaticBody2D

func _ready():
	$AnimatedSprite2D.play("idle")
	$shopmenu.visible=false

func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		$shopmenu.visible=true

func _on_area_2d_body_exited(body):
	$shopmenu.visible=false
