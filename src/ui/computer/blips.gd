class_name TypiningText extends RichTextLabel

signal letter_typed
signal completed

@export var type_speed: float = 0.05

func _ready():
	bbcode_enabled = true
	
func simulate_typing(new_text: String):
	visible_characters = 0
	text = new_text
	
	for i in text.length():
		visible_characters += 1
		letter_typed.emit()
		await get_tree().create_timer(type_speed).timeout
	completed.emit()
