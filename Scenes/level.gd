extends Node2D

@onready var heartsContainer = $CanvasLayer/HeartsContainer
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heartsContainer.setHearts(player.maxHealth);
	player.healthChanged.connect(heartsContainer.updateHealth)
