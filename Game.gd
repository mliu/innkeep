extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Ashes.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Eye.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Feather.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Plant.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Spoon.connect("input_event", self, "_on_Spoon_input_event")
	pass # Replace with function body.

func _on_Spoon_input_event(viewport, event, shape_idx):
	if(event is InputEventScreenTouch && event.is_pressed()):
		$Bowl.mix()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
