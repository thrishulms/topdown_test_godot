extends Node2D

var projectile_scene = preload("res://Scenes/Projectile.tscn")
var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fire_rate_timer = $Sprite2D/FireRateTimer
	fire_rate_timer.timeout.connect(_on_FireRateTimer_timeout)
	fire_rate_timer.start()

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
	if Input.is_action_pressed("ShootTrigger") and can_shoot:  # 'ui_select' is the default action for left mouse click
		shoot(direction)

func _on_FireRateTimer_timeout():
	can_shoot = true  # Allow shooting again when the timer times out

func shoot(direction):
	can_shoot = false  # Prevent shooting until the timer resets
	$Sprite2D/FireRateTimer.start()  # Reset the timer
	var projectile = projectile_scene.instantiate()
	get_tree().root.add_child(projectile)
	projectile.global_position = $Sprite2D/Marker2D.global_position  # Start the projectile at the weapon's position
	projectile.direction = direction
	projectile.rotation = rotation
