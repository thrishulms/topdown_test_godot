extends Node2D

@export var speed := 500;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# position = Vector2(10,10)
	# print(Input.is_action_pressed("ui_down"))
	# print(Input.is_action_pressed("ui_down"))
	var direction = Input.get_vector("Left", "Right", "Up" , "Down")
	print(direction);
	position += direction * delta * speed
	pass
