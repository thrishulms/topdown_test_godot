extends CharacterBody2D

var player: Node2D = null
var animatedSprite: AnimatedSprite2D = null

@export var attack_range: float = 100
@export var health : float = 100
@export var speed: float = 200

var canMove: bool = true
var isAttacking: bool = false

func _ready() -> void:
	# Find the player in the scene tree (assuming there's only one player)
	player = get_tree().root.get_node("Level/Player")  # Adjust the path to match your scene structure
	animatedSprite = $AnimatedSprite2D


func _process(delta: float) -> void:
	if isAttacking || !canMove:
		return  # Stop all other actions while attacking
		
	if player && canMove:
		var distance_to_player = global_position.distance_to(player.global_position)

		if distance_to_player <= attack_range:
			# Stop moving and start attacking if in range
			attack_player()
		else:
			move_towards_player(delta)

func attack_player():
	if !isAttacking:
		canMove = false
		isAttacking = true
		animatedSprite.play("Attack")

func move_towards_player(delta):
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed 
	move_and_collide(velocity * delta)
	animatedSprite.play("Run")

func take_damage(damage : float):
	health = health - damage
	animatedSprite.play("TakeDamage")
	velocity = -velocity
	if(health <= 0):
		queue_free()
	canMove = false

func _animation_finished() -> void:
	var animName = $AnimatedSprite2D.get_animation()
	var test = $AnimatedSprite2D.animation
	var distance_to_player = global_position.distance_to(player.global_position)
	if animName == "Attack" && distance_to_player <= attack_range:
		if player.has_method("take_damage_player"):
			player.call("take_damage_player")
	
	canMove = true
	isAttacking = false
