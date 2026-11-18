@tool
class_name Card extends Node2D

signal mouse_entered
signal mouse_exited

@export var card_name: String = "Card Name"
@export var card_description: String = "Card Description"
@export var card_cost: int = 1
@export var card_image: Sprite2D

@onready var cost_lbl: Label = $CostDisplay/CostLbl
@onready var name_lbl: Label = $CardName/NamLbl
@onready var description_lbl: Label = $CardDescription
@onready var base_sprite: Sprite2D = $BaseCardSprite

func _ready():
	set_card_values(card_cost, card_name, card_description)
	

func set_card_values(_cost: int, _name: String, _description: String):
	card_name = _name
	card_cost = _cost
	card_description = _description
	
	_update_graphics()

func _update_graphics():
	if cost_lbl.get_text() != str(card_cost):
		cost_lbl.set_text(str(card_cost))
	if name_lbl.get_text() != card_name:
		name_lbl.set_text(card_name)
	if description_lbl.get_text() != card_description:
		description_lbl.set_text(card_description)
	
func highlight():
	base_sprite.set_modulate(Color(0.929, 0.478, 0.224))
	
func unhighlight():
	base_sprite.set_modulate(Color(1.0, 1.0, 1.0))
	
func activate():
	pass

func _process(_delta):
	_update_graphics()





func _on_area_2d_mouse_entered():
	mouse_entered.emit()


func _on_area_2d_mouse_exited():
	mouse_exited.emit()
