extends CharacterBody2D

var health: float = 100.0

@onready var finn: AnimatedSprite2D = $finn
@onready var canvas_layer_2: CanvasLayer = %GameOver

signal health_depleted

func _physics_process(delta):
	var movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement * 450
	move_and_slide()

	if movement.length() > 0:
		if movement.x != 0:
			finn.scale.x = abs(finn.scale.x) * sign(movement.x)
		finn.play("walk")
	else:
		finn.play("idle")

	# Daño al jugador
	const DAMAGE_RATE: float = 10.0
	var enemies_near = %HurtBox.get_overlapping_bodies()
	
	if enemies_near.size() > 0:
		health -= DAMAGE_RATE * enemies_near.size() * delta
		%ProgressBar.value = health
		
		if health <= 0.0:
			health_depleted.emit()
	
			
