extends CharacterBody2D
@onready var player = $"/root/level/player"
@onready var health = 1
var SPEED = 250

func take_damage():
	health -= 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
		#Movement
	if player:
		var vel = global_position.direction_to(player.global_position)
		move_and_collide(vel * SPEED * delta)
		
		#Death
	if health == 0:
		get_parent().remove_child(self)
	

		
	

		#Player Damage
func _on_area_2d_body_entered(body):
	if body == player:
		player.recive_damage()
