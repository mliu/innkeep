extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Ashes.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Eye.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Feather.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Plant.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Spoon.connect("input_event", self, "_on_Spoon_input_event")
	$OrderGenerator.connect("new_order", self, "_on_generate_order_input_event")
	pass # Replace with function body.

func _on_Spoon_input_event(event):
	if(event is InputEventScreenTouch && event.is_pressed()):
		$Bowl.mix()
	pass

func _on_generate_order_input_event(order):
	print("Recipe: ", Recipe.recipes[order])
	#print("Recipe: " + str(Recipe.recipes[dish]))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
