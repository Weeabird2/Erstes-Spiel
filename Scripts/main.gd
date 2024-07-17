extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Szene/level1.tscn")
	



func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.set_frame_and_progress(10,10)
