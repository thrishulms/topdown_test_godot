extends Node2D

@export var speed: float = 200
var player: Node2D = null

func _ready() -> void:
	# Find the player in the scene tree (assuming there's only one player)
	player = get_tree().root.get_node("Level/Player")  # Adjust the path to match your scene structure

func _process(delta: float) -> void:
	var animationPlayer = $RigidBody2D/AnimationPlayer
	if player:
		var direction = (player.global_position - global_position).normalized()
		var oldPosition = position;
		position += direction * speed * delta
		if oldPosition == position:
			animationPlayer.play("Run")
		else:
			animationPlayer.play("Idle")
	else:
		animationPlayer.play("Idle")
