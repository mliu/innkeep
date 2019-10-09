extends Node2D

signal new_order

var DAY_TIME = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	$DayTimer.connect("timeout", self, "end_day")
	$OrderTimer.connect("timeout", self, "maybe_generate_order")

func start_day():
	$DayTimer.start(DAY_TIME)
	$OrderTimer.start(3)
	
func end_day():
	$OrderTimer.stop()

func maybe_generate_order():
	if (randi() % 1 == 0):
		emit_signal("new_order")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
