extends Area2D

var speed = 1000
var direction = Vector2.ZERO
@export var damage: float = 50

func _ready():
	rotation = direction.angle()  # Rotate the projectile to face the direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	if !get_viewport_rect().has_point(global_position):
		queue_free() 

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.call("take_damage", damage)
		queue_free()
