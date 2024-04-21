extends Control

var item_sprites: Array = [] # Array to store references to sprite nodes
var item_labels: Array = [] # Array to store references to label nodes

var item_quantities: Dictionary = {}

func _ready():
	# Initialize item_quantities dictionary
	item_quantities = {
		"coin" : 100,
		"nori" : 786,
		"rice" : 0,
		"soysauce" : 0,
		"wasabi" : 0,
		"pickledginger" : 0,
		"ricevinegar" : 0,
		"sugar" : 0,
		"salt" : 8987,
		"tuna" : 0,
		"salmon" : 0,
		"crabmeat" : 0,
		"cucumber" : 0,
		"avocado" : 0,
		"carrot" : 0,
		"onions" : 0,
		"seed" : 0,
		"mirin" : 0
	}

	createLabels()
	hideDashboard()

func createLabels():
	for i in range(item_sprites.size()):
		var sprite_name = item_sprites[i].name
		if sprite_name != "Board":
			var label_name = sprite_name + "L"
			var label = get_node(label_name)
			if label:
				label.text = "Quantity: " + str(item_quantities[sprite_name])
				item_labels.append(label)
			else:
				print("Label node not found for sprite: " + sprite_name)

func hideDashboard():
	self.visible = false

func showDashboard():
	self.visible = true

func _input(event):
	if event.is_action_pressed("i"):
		if self.visible:
			hideDashboard()
		else:
			showDashboard()

func updateLabels():
	for i in range(item_labels.size()):
		var label = item_labels[i]
		if label.name.chomp("L") in item_quantities: # Check if label exists in item_quantities
			label.text = "Quantity: " + str(item_quantities[label.name.chomp("L")])
			print("Updated label for", label.name.chomp("L"), "with quantity:", item_quantities[label.name.chomp("L")])
		else:
			print("Label", label.name.chomp("L"), "does not exist in item_quantities.")

func updateItemQuantity(item_name, quantity):
	item_quantities[item_name] = quantity
	updateLabels()
	print("Quantity updated for", item_name, ":", quantity)
