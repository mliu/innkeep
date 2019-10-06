extends Area2D

enum INGREDIENT_TYPE {ASHES, EYE, FEATHER, PLANT}

export(INGREDIENT_TYPE) var type = INGREDIENT_TYPE.PLANT

var ashes = preload("res://sprites/ashes.png")
var eye = preload("res://sprites/eye.png")
var feather = preload("res://sprites/feather.png")
var plant = preload("res://sprites/plant.png")

onready var sprite = get_node("Sprite")

signal add_to_bowl(type)

func _ready():
	match type:
		INGREDIENT_TYPE.ASHES:
			sprite.set_texture(ashes)
		INGREDIENT_TYPE.EYE:
			sprite.set_texture(eye)
		INGREDIENT_TYPE.FEATHER:
			sprite.set_texture(feather)
		INGREDIENT_TYPE.PLANT:
			sprite.set_texture(plant)
		_:
			print("Unrecognized ingredient type!")
	self.connect("input_event", self, "_on_Area2D_input_event")
	pass
	

func _on_Area2D_input_event(viewport, event, shape_idx):
	if(event is InputEventScreenTouch && event.is_pressed()):
		emit_signal("add_to_bowl", type)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
