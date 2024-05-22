extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var col = $player_detection/CollisionShape2D
var chase = false
var speed = 90

func _process(delta):
	if chase == true:
		anim.play("Angry")
		var player = $"../player"
		var direction = (player.position - self.position).normalized()
		if direction.x < 0:
			anim.flip_h = false
		elif direction.x > 0:
			anim.flip_h = true
		velocity = direction * speed
	else:
		velocity.x = 0
		velocity.y = 0
		anim.play("Idle")
	move_and_slide()
	
func _on_player_detection_body_entered(body):
	chase = true

func _on_player_detection_body_exited(body):
	chase = false 
