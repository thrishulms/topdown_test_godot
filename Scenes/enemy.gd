extends CharacterBody2D

@export var speed: float = 200
var player: Node2D = null

@export var health : float = 100
var canMove: bool = true

func _ready() -> void:
	# Find the player in the scene tree (assuming there's only one player)
	player = get_tree().root.get_node("Level/Player")  # Adjust the path to match your scene structure
	#$AnimatedSprite2D.connect("animation_finished", Callable(self, "_on_animation_finished"))


func _process(delta: float) -> void:
	var animationSprite = $AnimatedSprite2D
	if player && canMove:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed 
		move_and_collide(velocity * delta)
		animationSprite.play("Run")

func take_damage(damage : float):
	var animationSprite = $AnimatedSprite2D
	health = health - damage
	animationSprite.play("TakeDamage")
	velocity = -velocity
	if(health <= 0):
		queue_free()
	canMove = false

func _on_animation_finished(anim_name: String) -> void:
	print(anim_name)
	if anim_name == "TakeDamage":
		canMove = true
	else:
		canMove = false

func _animation_finished() -> void:
	canMove = true;
