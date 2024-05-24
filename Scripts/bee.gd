extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var col = $player_detection/CollisionShape2D
var chase = false
var speed = 90
@onready var game_manager = %GameManager

func _process(_delta):
	if game_manager.flowers > 0:
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
			passive()
		move_and_slide()
	else:
		passive()
		self.col.shape.radius = 0.1
	
func passive():
	velocity.x = 0
	velocity.y = 0
	anim.play("Idle")
	
func _on_player_detection_body_entered(_body):
	chase = true
	self.col.shape.radius = 150

func _on_player_detection_body_exited(_body):
	chase = false 
	self.col.shape.radius = 50

