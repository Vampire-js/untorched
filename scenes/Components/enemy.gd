extends CharacterBody2D

@onready var range = $Range
@onready var player = $"../CharacterBody2D"
@onready var raycast = $RayCast2D

var player_entered = false
var SPEED = 1

func _physics_process(delta):
	if player_entered:
		position += (player.position - position)/100

func _on_range_body_entered(body):
	print(body)
	if body == player:
		player_entered = true

func _on_range_body_exited(body):
	if body == player:
		player_entered = false
		

