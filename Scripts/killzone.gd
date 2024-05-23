extends Area2D

@onready var timer = $Timer
@onready var game_manager = %GameManager

func _on_body_entered(body):
	Engine.time_scale = 0.5
	game_manager.player_death()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
