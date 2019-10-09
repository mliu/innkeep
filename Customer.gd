extends Area2D

var order_index
var anchor_index

signal on_click(order_index, anchor_index)

func _ready():
	connect("input_event", self, "_on_input_event")
	pass
	
func _on_input_event(viewport, event, shape_idx):
	if(event is InputEventScreenTouch && event.is_pressed()):
		emit_signal("on_click", order_index, anchor_index)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
