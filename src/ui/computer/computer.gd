class_name Computer extends Control
@onready var blips: RichTextLabel = $MarginContainer/Blips



func add_char(s: String):
	blips.text += s
	
func reset():
	blips.text = ""	
