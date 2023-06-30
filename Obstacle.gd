extends Area2D
class_name Obstacle

var start = false
@onready var speed = get_parent().get_node("ParallaxBackground").speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x < 0:
		queue_free()
		
	if start: 
		position += Vector2.LEFT * speed * delta 
