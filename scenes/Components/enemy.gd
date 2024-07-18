extends CharacterBody2D

@onready var range = $Range
@onready var player = $"../CharacterBody2D"

@onready var nav_agent = $NavigationAgent2D
@onready var timer = $"../Timer"
@onready var bullets = $"../Bullets"


var player_entered = false
var SPEED = 300
var rng = RandomNumberGenerator.new()

var dir_timer = 0
var dir_interval = 2

#func _physics_process(delta):
	#if player_entered:
		#position += (player.position - position)/100
#
func _on_range_body_entered(body):
	print(body)
	if body == player:
		player_entered = true

func _on_range_body_exited(body):
	if body == player:
		player_entered = false
		

func _physics_process(delta):
	rotation = (player.global_position - global_position).angle()
	dir_timer += delta
	if player_entered:
		var direction = Vector2()
		nav_agent.target_position = player.position
		direction = nav_agent.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = velocity.lerp(direction * SPEED , 7*delta)
		

		#var bullet = preload("res://scenes/Components/bullet.tscn").instantiate()
		#bullet.position = position
		#bullet.rotation =  rotation
		#bullet.scale = 0.5 * bullet.scale
		#bullet.apply_impulse((Vector2(position.x , position.y).rotated(rotation)).normalized()*1000 , Vector2())
		#bullets.add_child(bullet)
	
	move_and_slide()



func _on_timer_timeout():
	print("timedout")
	velocity = Vector2(rng.randf_range(-10.0, 10.0) , rng.randf_range(-10.0, 10.0)).normalized() * SPEED
	if player_entered:
		var bullet = preload("res://scenes/Components/bullet.tscn").instantiate()
		bullet.position = position
		bullet.rotation =  rotation
		bullet.scale = 0.5 * bullet.scale
		bullet.apply_impulse((Vector2(position.x , position.y).rotated(rotation)).normalized()*1000 , Vector2())
		bullets.add_child(bullet)
	move_and_slide()
