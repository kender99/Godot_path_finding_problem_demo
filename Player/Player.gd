extends KinematicBody2D

const speed = 200


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
	
	
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -=1
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -=1
#	if Input.is_action_pressed("ui_right"):		
#		velocity.x +=1
#	if Input.is_action_pressed("ui_down"):
#		velocity.y +=1
	move_and_slide(velocity.normalized() * speed)
	player_animation(velocity)


func player_animation(velocity):
	if velocity.y > 0:
		$"AnimatedSprite".play("run")
	elif velocity.y<0:
		$"AnimatedSprite".play("run")
	elif velocity.x !=0:
		$"AnimatedSprite".play("run")
		$"AnimatedSprite".flip_h = velocity.x > 0
	else: 
		$"AnimatedSprite".stop()
		$"AnimatedSprite".frame = 0
		
	
		
		
	
	
