extends Area2D

signal new_order(order)
var RNG = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("OrderGenerator ready")
	RNG.randomize()

func _process(delta):
	var order = RNG.randi_range(0, 2)
	emit_signal("new_order", order)
	
#func generate_order():
#	return RNG.randf_range(0, 10)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
