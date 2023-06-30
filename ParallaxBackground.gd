extends ParallaxBackground

@export var playing = false
@export var speed = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(playing):
		scroll_offset += Vector2.LEFT * speed * delta
