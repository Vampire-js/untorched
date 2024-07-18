extends Area2D

@export var start_torch = false
var code = 0
@onready var timer = $"../Timer"
@onready var torch = $".."
@onready var light = $"../PointLight2D"



func _on_body_entered(body):
	if start_torch:
		torch.frame = 2
		light.enabled = true
		

func _input(event):
	if event is InputEventKey:
		if event.keycode == 32:
			start_torch = true



