extends Node2D

@export var speed := 500 # default speed of player set to 500 as per testing on local machine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Player Movement and Animation
	var animation = $CharacterBody2D/AnimationPlayer
	var sprite = $CharacterBody2D/PlayerImage
	var direction = Input.get_vector("Left", "Right", "Up" , "Down")
	if direction != Vector2.ZERO: # true if player is moving
		animation.play("Run")
		sprite.flip_h = false
		if direction.x < 0: # true for player moving to the left
			sprite.flip_h = true
	else: # false if the player is not moving at all
		animation.play("idle")
	position += direction * delta * speed
