extends Node2D

var orders = {0: null, 1: null, 2: null}
var MAX_ORDERS = 3
var anchor_points = []
var current_recipe
var current_order_index
var current_anchor_index

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Ashes.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Eye.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Feather.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Plant.connect("add_to_bowl", $Bowl, "add_ingredient")
	$Spoon.connect("input_event", self, "_on_Spoon_input_event")
	$OrderGenerator.connect("new_order", self, "_on_generate_order")
	$OrderGenerator.start_day()
	anchor_points = [$Anchor1, $Anchor2, $Anchor3]
	pass

func _on_Spoon_input_event(viewport, event, shape_idx):
	if(event is InputEventScreenTouch && event.is_pressed()):
		var temp_recipe = Recipes.recipes[current_recipe]
		var temp_bowl = $Bowl.ingredients
		temp_recipe.sort()
		temp_bowl.sort()
		if (temp_recipe == temp_bowl):
			$Bowl.mix()
		else:
			$Bowl.dump()
		remove_current_customer()
	pass
	
func _on_Customer_click(order_index, anchor_index):
	if(current_recipe == null):
		current_recipe = orders[order_index]
		current_order_index = order_index
		current_anchor_index = anchor_index
		print(Recipes.recipes[current_recipe])
	pass

func _on_generate_order():
	if (orders.size() > MAX_ORDERS):
		pass
	print("generate order")
	var temp_order_index
	for i in range(MAX_ORDERS):
		if (orders[i] == null):
			temp_order_index = i
			orders[i] = randi() % Recipes.recipes.size()
			break
	# Find the next available Anchor point
	for i in range(MAX_ORDERS):
		if (anchor_points[i].has_customer):
			continue
		anchor_points[i].add_customer(temp_order_index, i)
		return
		
func remove_current_customer():
	orders[current_order_index] = null
	current_recipe = null
	current_order_index = null
	anchor_points[current_anchor_index].remove_customer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
