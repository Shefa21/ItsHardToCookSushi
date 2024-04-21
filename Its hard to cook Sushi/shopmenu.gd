extends StaticBody2D

var item = 1
var coin = 10000

var prices = [100, 250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000]
var owned = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]

func _ready():
	$icon.play("Nori")
	update_ui()

func _physics_process(delta):
	if self.visible == true:
		$RichTextLabel.text = str(prices[item - 1])
		if coin >= prices[item - 1]:
			$condiLable.text = "Available"
		else:
			$condiLable.text = "Out of coins"

func _on_left_b_pressed():
	swap_item_back()

func _on_right_b_pressed():
	swap_item_forward()

func _on_button_pressed():
	if coin >= prices[item - 1] and !owned[item - 1]:
		buy()

func swap_item_back():
	item -= 1
	if item < 1:
		item = prices.size()
	update_ui() # Update UI when item is swapped

func swap_item_forward():
	item += 1
	if item > prices.size():
		item = 1
	update_ui() # Update UI when item is swapped

func buy():
	coin -= prices[item - 1]
	owned[item - 1] = true
	update_ui()

func update_ui():
	if item == 1:
		$icon.play("Nori")
	elif item == 2:
		$icon.play("rice")
	elif item == 3:
		$icon.play("soysauce")
	elif item == 4:
		$icon.play("wasabi")
	elif item == 5:
		$icon.play("pickledginger")
	elif item == 6:
		$icon.play("vinegar")
	elif item == 7:
		$icon.play("sugar")
	elif item == 8:
		$icon.play("salt")
	elif item == 9:
		$icon.play("tuna")
	elif item == 10:
		$icon.play("salmon")
	elif item == 11:
		$icon.play("crabmeat")
	elif item == 12:
		$icon.play("cucumber")
	elif item == 13:
		$icon.play("avocado")
	elif item == 14:
		$icon.play("carrot")
	elif item == 15:
		$icon.play("onion")	
	elif item == 16:
		$icon.play("seed")
	elif item == 17:
		$icon.play("mirin")

		
	
