extends CharacterBody2D
##############################################################
const SPEED = 200
const DASH_SPEED = 600
const acc = 20
const dash_acc = 20
const friction = 70
var dash_timer = true
var dashing = true
var dash_richtung: Vector2
var can_attack = true
@onready var hitbox = $hitbox
@onready var hp = 1
var direction: Vector2
signal on_hit
############################################################
		
############################################################
func _process(delta):	
	var maus = get_local_mouse_position()
	var richtung = maus / maus.length()
	
		# input
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		#lauf animation
	if velocity == direction:
		$playersprite.play("default")
	else:
		$playersprite.play("walk")
		#movement
	if dashing:
		velocity = velocity.move_toward(direction * SPEED, acc)
	else:
		velocity = velocity.move_toward(dash_richtung * DASH_SPEED, dash_acc)
	move_and_slide()
		#animation_handler_movement
	if richtung.x > 0:
		$playersprite.flip_h = false
		$playersprite/AnimatedSprite2D.flip_h = false
		$playersprite/AnimatedSprite2D.flip_v = false
	else:
		$playersprite.flip_h = true
		$playersprite/AnimatedSprite2D.flip_v = true
	if can_attack:
		$playersprite/AnimatedSprite2D.flip_v = false
		#game over
	if hp == 0:
		get_tree().change_scene_to_file("res://Szene/main.tscn")
############################################################
	
############################################################
func _input(atk):
		#ich weine immer noch
	if atk.is_action_pressed("ui_accept") and can_attack:
		$hitbox/gcd.start()
		$playersprite/AnimatedSprite2D.stop()
		$playersprite/AnimatedSprite2D.play("atk")
		$playersprite/AnimatedSprite2D.look_at(get_global_mouse_position())
		if hitbox.is_colliding():
			var i = hitbox.get_collider(0)
				
			if i.is_in_group("enemy"):
				i.take_damage()
				on_hit.emit()
		can_attack = false
	if atk.is_action_pressed("ui_accept_alt") and dash_timer:
		$dash.start()
		$dash_timer.start()
		dash_richtung = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		dashing = false
		dash_timer = false
############################################################

############################################################
		#attack animation cancel
func _on_animated_sprite_2d_animation_finished():	
	$playersprite/AnimatedSprite2D.play("default_r")
	$playersprite/AnimatedSprite2D.rotation = 0
############################################################

############################################################
func _on_gcd_timeout():
	can_attack=true
############################################################

############################################################
func _on_dash_timeout():
	dashing = true
############################################################

############################################################
func _on_dash_timer_timeout():
	dash_timer = true
############################################################

############################################################
func recive_damage():
	hp -= 1
############################################################
