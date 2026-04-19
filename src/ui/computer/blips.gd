class_name TypiningText extends RichTextLabel

signal completed

@export var cursor_char: String = "_"
@export var blink_speed: float = 0.5
@export var type_speed: float = 0.05

func _ready():
	bbcode_enabled = true
	text = cursor_char 
	
func simulate_typing(new_text: String):
	text += new_text
	
	for i in text.length():
		visible_characters += 1
		await get_tree().create_timer(type_speed).timeout
	completed.emit()
