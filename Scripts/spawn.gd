extends Node2D

var enemy = preload("res://Szene/enemy.tscn")
@onready var spawntimer = 0
var i = 0

func _ready():
	randomize()
	
func _process(delta):
	
		#Spawn handler
	if i < 25:
		#Spawn Timer
		spawntimer = spawntimer + delta
		if spawntimer > 2:
			#Spawn Ort Randomizer
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			#Spawn Ort + Instanz
			$"/root/level/player/Path2D/PathFollow2D".progress = rng.randi_range(0, 3664)
			var instance = enemy.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
			instance.global_position = $"/root/level/player/Path2D/PathFollow2D/Marker2D".global_position
			get_parent().add_child(instance)
			
			#Spawn Counter
			i += 1
			spawntimer = 0
			
	
