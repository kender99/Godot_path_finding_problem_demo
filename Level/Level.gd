extends Node2D

var path : = PoolVector2Array()



func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			path = $Navigation2D.get_simple_path($Player.position, event.position)
			$Player.path = path			
			$Line2D.points = path
			print(path.size(), ' Path:',path, '  Player:', $Player.position, '  Target:', event.position)			
			update()  # so line and circles get drawn
			

func _draw():
	for p in path:
				draw_circle(p, 5, Color(200, 200, 200))
	
