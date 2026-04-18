extends LineEdit

func _ready() -> void:
	text_changed.connect(_on_text_changed)
	
func _on_text_changed(new_text: String): 
	var caret_pos = caret_column 
	text = new_text.to_upper() 
	caret_column = caret_pos
