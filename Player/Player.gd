extends KinematicBody2D

const speed = 200
var path : = PoolVector2Array()

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity =Vector2(-1,0)
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(0,-1)
	if Input.is_action_pressed("ui_right"):		
		velocity =Vector2(1,0)
	if Input.is_action_pressed("ui_down"):
		velocity= Vector2(0,1)	
	
	move_and_slide(velocity.normalized() * speed)

	
	# Code to make the Player walk along the paths
	# Calculate the movement distance for this frame
	var distance_to_walk = speed * delta
	
	# Move the player along the path until he has run out of movement or the path ends.
	while distance_to_walk > 0 and path.size() > 0:
		var distance_to_next_point = position.distance_to(path[0])
		if distance_to_walk <= distance_to_next_point:
			# The player does not have enough movement left to get to the next point.
			position += position.direction_to(path[0]) * distance_to_walk
		else:
			# The player get to the next point
			position = path[0]
			path.remove(0)
		# Update the distance to walk
		distance_to_walk -= distance_to_next_point


		
	
	
