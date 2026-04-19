class_name TypiningText extends RichTextLabel

signal completed

@export var cursor_char: String = "_" # Or "_"
@export var blink_speed: float = 0.5
@export var type_speed: float = 0.05

var _display_text: String = ""   # The actual content
var _cursor_visible: bool = true
var _blink_timer: float = 0.0

func _ready():
	# Standard terminal styling
	bbcode_enabled = true
	text = cursor_char 
	

func _process(delta):
	# Handle the blinking logic
	_blink_timer += delta
	if _blink_timer >= blink_speed:
		_blink_timer = 0.0
		_cursor_visible = !_cursor_visible
		_update_display()

func simulate_typing(new_text: String):
	for c in new_text:
		_display_text += c
		_update_display()
		# Small delay for typewriter effect
		await get_tree().create_timer(type_speed).timeout
	completed.emit()

func _update_display():
	# If cursor is visible, show it; otherwise, show a space to prevent "jumping"
	var cursor = cursor_char if _cursor_visible else " "
	self.text = _display_text + cursor
