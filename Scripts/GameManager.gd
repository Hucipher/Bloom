extends Node

var flowers = 5
@onready var label_flower = $"../UI/Label_flower"
@onready var win = $"../UI/Win"
@onready var timer = $Timer
@onready var player = $"../player"
var bee = preload("res://Scenes/bee.tscn")
func _ready():
	label_flower.text = str(flowers)

func pick_flower():
	flowers -= 1
	label_flower.text = str(flowers)
	count_flowers()

func count_flowers():
	if flowers <= 0:
		win.text = "YOU WIN!!!"
		player.anim.play("Idle")
		player.can_move = false
		timer.start()

func player_death():
	player.can_move = false
	

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

