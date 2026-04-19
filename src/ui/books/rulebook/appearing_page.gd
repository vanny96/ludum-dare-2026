class_name AppearingPage extends Control

@export var day_of_appear: int = 0

func _on_day_change(d: int):
	if d >= self.day_of_appear:
		self.visible = true
