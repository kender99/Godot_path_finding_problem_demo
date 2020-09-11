extends Node2D

var globalPath := PoolVector2Array()

onready var nav = $Navigation2D
onready var player = $Player
onready var line = $Line2D

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			var fromGlobal = player.global_position
			var toGlobal = get_global_mouse_position()

			# Navigation2D.get_simple_path takes and returns everything in it's local space
			var navLocalPath = nav.get_simple_path(nav.to_local(fromGlobal), nav.to_local(toGlobal))

			# get global path: transform points from nav's local to global space
			globalPath = nav.global_transform.xform(navLocalPath)

			# give player path in global coordinates; make sure he treats it like this (start by renaming it to globalPath?)
			player.path = globalPath 

			# line.points needs to be in line's local space so transform points from global to line's local space
			line.points = line.global_transform.affine_inverse().xform(globalPath)    		
			update()
			

func _draw():
	for p in globalPath:
		# draw_x methods also work in local coordinate space
		draw_circle(to_local(p), 5, Color(200, 200, 200))
