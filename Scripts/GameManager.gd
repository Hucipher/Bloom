extends Node

var flowers = 5
@onready var label = $"../UI/Label"

func _ready():
	label.text = str(flowers)

func pick_flower():
	flowers -= 1
	label.text = str(flowers)
	
func count_flowers():
	if flowers <= 0:
		flowers == 0
