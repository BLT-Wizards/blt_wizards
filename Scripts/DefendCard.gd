extends Node2D

signal mouse_entered
signal mouse_exited

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass
	

func _on_card_mouse_entered():
	mouse_entered.emit()

func _on_card_mouse_exited() -> void:
	mouse_exited.emit()
