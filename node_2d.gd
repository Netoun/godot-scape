extends Node2D

@export var speed = 300
var start = false
var Obstacle_scene = preload("res://obstacle.tscn")
var distance = 0

func _ready():
	$Timer.timeout.connect(_on_Timer_timeout)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !start:
		if Input.is_action_just_pressed("ui_accept"):
			start = true   
			$ParallaxBackground.playing = true
			$Timer.start()
			$Hero.start = true

func _on_Timer_timeout():
	distance += 5
	spawn_obstacle()
	
func spawn_obstacle(): 
	var obstacle: Obstacle = Obstacle_scene.instantiate()
	obstacle.position = Vector2(600, 350)
	obstacle.connect("body_entered", on_obstacle)
	obstacle.start = true
	obstacle.add_to_group("obstacles")
	update_speed()
	add_child(obstacle)
	
func update_speed():
	speed += 20
	$Timer.wait_time -= 0.01
	$ParallaxBackground.speed = speed

func on_obstacle(body):
	game_over()

func game_over():
	$Hero.start = false
	$ParallaxBackground.playing = false
	$Timer.stop()
	var childs = get_tree().get_nodes_in_group('obstacles')
	for child in childs:
		child.start = false
