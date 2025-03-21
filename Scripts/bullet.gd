extends Area2D

@export var speed = 1000
@export var range = 1200
var start_position: Vector2

func _ready():
	start_position = position  

func _physics_process(delta):

	position += Vector2.RIGHT.rotated(rotation) * speed * delta 


	if position.distance_to(start_position) > range:
		queue_free()

func _on_body_entered(body):
	queue_free() 
	if body.has_method("take_damage"):
		body.take_damage()
