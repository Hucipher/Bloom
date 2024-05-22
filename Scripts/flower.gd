extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var game_manager = %GameManager
@onready var col = $CollisionShape2D

func _on_body_entered(body):
	if body.name == "player":
		anim.play("PickUp")
		var tween = get_tree().create_tween()
		var tween2 = get_tree().create_tween()
		tween.tween_property(self,"position",position - Vector2(0,30),1)
		tween2.tween_property(self,"modulate:a",0,1)
		game_manager.pick_flower()
		tween.tween_callback(queue_free)
		
func _on_body_exited(body):
	col.set_deferred("disabled",true)
