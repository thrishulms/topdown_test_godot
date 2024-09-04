extends CharacterBody2D

@export var speed := 250 # default speed of player set to 500 as per testing on local machine
@export var health := 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Player Movement and Animation
	var animatedSprite2D = $AnimatedSprite2D
	var direction = Input.get_vector("Left", "Right", "Up" , "Down")
	if direction != Vector2.ZERO: # true if player is moving
		animatedSprite2D.play("Run")
		animatedSprite2D.flip_h = false
		if direction.x < 0: # true for player moving to the left
			animatedSprite2D.flip_h = true
		velocity = direction * speed 
		move_and_collide(velocity * delta)
		position += direction * delta * speed
	else: # false if the player is not moving at all
		animatedSprite2D.play("Idle")
		
func take_damage_player(damage: float):
	health = health - damage
	
