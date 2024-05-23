extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var col = $player_detection/CollisionShape2D

var chase = false
var speed = 90

func _process(_delta):
	if chase == true:
		anim.play("Angry")
		var player = %player
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
	
func _on_player_detection_body_entered(_body):
	chase = true
	col.shape.radius = 150

func _on_player_detection_body_exited(_body):
	chase = false 
	col.shape.radius = 50

