extends Node2D

var has_customer = false
var customer = preload("res://Customer.tscn")

func _ready():
	pass

func add_customer(order_index, anchor_index):
	has_customer = true
	var customer_instance = customer.instance()
	customer_instance.set_name("Customer")
	customer_instance.order_index = order_index
	customer_instance.anchor_index = anchor_index
	add_child(customer_instance)
	customer_instance.connect("on_click", get_parent(), "_on_Customer_click")
	
func remove_customer():
	remove_child(get_node("Customer"))
	has_customer = false