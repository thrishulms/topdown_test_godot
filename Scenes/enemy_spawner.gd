extends Node2D

@export var enemy_scene = preload("res://Scenes/Enemy.tscn")
@export var spawn_delay: float = 2.0

func _ready() -> void:
	# Start a repeating timer to spawn enemies
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_delay
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_spawn_enemy)
	add_child(spawn_timer)

func _spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	get_parent().add_child(enemy)

	# Get the viewport size to determine the camera view
	var viewport_size = get_viewport_rect().size
	
	# choose a any edge of camera to spawn enemy
	var random_x = randf_range(0, viewport_size.x)
	var random_y = randf_range(0, viewport_size.y)
	
	# Randomly choose one of the four corners to spawn the enemy
	match randi() % 2:
		0:
			enemy.global_position = Vector2(random_x, 0)  # Top-right corner
		1:
			enemy.global_position = Vector2(0, random_y)  # Bottom-left corner
