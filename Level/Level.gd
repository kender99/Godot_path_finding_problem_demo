extends Node2D

var path : = PoolVector2Array()

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
						
			path = $Navigation2D.get_simple_path($Player.position, event.position)
			$Line2D.points = path
			print(path.size(), ' Path:',path, '  Player:', $Player.position, '  Target:', event.position)
			#print(event.position)
			update()
			#$Player.path = path

func _draw():
	for p in path:
				draw_circle(p, 5, Color(200, 200, 200))
	
