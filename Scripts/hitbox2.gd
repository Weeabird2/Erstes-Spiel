extends ShapeCast2D
@onready var player = $"/root/level/player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = player.position
	var richtung = player_pos / player_pos.length() 
	var länge = min(player_pos.length(),100)
	target_position = richtung * länge
