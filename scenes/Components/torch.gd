extends Area2D

var start_torch = false
@onready var timer = $"../Timer"
@onready var torch = $".."
@onready var light = $"../PointLight2D"

func _input(event):
	if event is InputEventKey:
		if event.keycode == 32:
			torch.frame = 2
			light.enabled = true
