extends HBoxContainer

@onready var HeartGuiClass = preload('res://Scenes/HeartGui.tscn')

func setHearts(max: int) -> void:
	for i in range(max):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)

func updateHealth(currentHealth: int) -> void:
	var health = get_children()
	for i in range(currentHealth, health.size()):
		remove_child(health[i])
