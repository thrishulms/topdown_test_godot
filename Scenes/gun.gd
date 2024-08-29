extends Node2D

var projectile_scene = preload("res://Scenes/Projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# weapon rotation logic
	var mouse_pos = get_global_mouse_position()
	var weapon_pos = global_position
	var direction = (mouse_pos - weapon_pos).normalized()
	if direction.x < 0:
		scale.y = -1
	else:
		scale.y = 1
	rotation = direction.angle()
	
	# shoot logic
	if Input.is_action_just_pressed("ShootTrigger"):  # 'ui_select' is the default action for left mouse click
		shoot(direction)

func shoot(direction):
	var projectile = projectile_scene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position  # Start the projectile at the weapon's position
	projectile.direction = direction
