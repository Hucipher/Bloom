extends AnimatableBody2D

@onready var anim = $AnimatedSprite2D
var speed = 6
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("Idle")


func _on_detection_body_entered(body):
	if body.name == "player":
		pass
