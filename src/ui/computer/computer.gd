class_name Computer extends Control

@onready var blips: RichTextLabel = %Blips

func add_char(s: String):
	blips.simulate_typing(s)
	
func reset():
	blips.text = ""
