extends Node2D

var speed = 1000
var direction = Vector2.ZERO

func _ready():
	rotation = direction.angle()  # Rotate the projectile to face the direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	if !get_viewport_rect().has_point(global_position):
		queue_free()  # Destroy the projectile when it leaves the screen
