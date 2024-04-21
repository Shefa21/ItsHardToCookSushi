extends Control

@onready var label: Label = $Label2
@onready var pb: ProgressBar = $ProgressBar

var filling_duration: float = 5.0  # Duration for filling the progress bar (in seconds)
var fill_speed: float = 70.0  # Speed at which progress bar fills (in units per second)
var current_fill_time: float = 0.0  # Current fill time

func _ready():
	hide()

func _process(delta: float):
	if self.visible:
		current_fill_time += delta  # Accumulate time
		var fill_amount = current_fill_time / filling_duration * fill_speed
		pb.value = clamp(fill_amount, 0.0, 100.0)  # Clamp the fill amount between 0 and 1
		if pb.value >= 100.0:
			label.text = "phew...Cooked"  # Update label text when progress bar is fully filled
	else:
		current_fill_time = 0.0  # Reset fill time when UI is hidden
		pb.value = 0.0  # Reset progress bar value
		label.text = ""  # Reset label text

func hideProcess():
	self.visible = false

func showProcess():
	self.visible = true
	pb.value = 0.0  # Reset progress bar value
	label.text = "stir boil cut..."  # Set label text to indicate filling in progress

# Called for every input event.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("k"):
		if self.visible:
			hideProcess()
		else:
			showProcess()
