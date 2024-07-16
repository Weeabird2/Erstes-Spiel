extends ShapeCast2D

func _process(_delta):
	var mausi = get_local_mouse_position()
	var richtungi = mausi / mausi.length() 
	var länge = min(mausi.length(),50)
	target_position = richtungi * länge
	
		


