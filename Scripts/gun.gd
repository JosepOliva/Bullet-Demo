extends Area2D

@onready var enemy_group = get_node("/root/Game/Mobs")

func _physics_process(delta):
	var detected_enemies = get_overlapping_bodies()
	if detected_enemies.size() > 0:
		var closest_enemy = detected_enemies.front()
		look_at(closest_enemy.global_position)

func fire():
	const BULLET_SCENE = preload("res://Scenes/bullet.tscn")
	var bullet_instance = BULLET_SCENE.instantiate()
	bullet_instance.global_position = %ShootingPoint.global_position
	bullet_instance.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(bullet_instance)

func _on_timer_timeout():
	fire()
